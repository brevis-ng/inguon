"""
1,视频列表地址https://api.bdxzyapi.com/api.php/provide/vod/?ac=list
2,视频详情地址https://api.bdxzyapi.com/api.php/provide/vod/?ac=detail
列表接收参数：
ac=list
t=类别ID
pg=页码
wd=搜索关键字
h=几小时内的数据
例如：https://api.bdxzyapi.com/api.php/provide/vod/?ac=list&t=1&pg=5 分类ID为1的列表数据第5页
内容接收参数：
参数 ids=数据ID，多个ID逗号分割。
t=类型ID
pg=页码
h=几小时内的数据

例如: https://api.bdxzyapi.com/api.php/provide/vod/?ac=detail&ids=123,567 获取ID为123和567的数据信息
https://api.bdxzyapi.com/api.php/provide/vod/?ac=detail&h=24 获取24小时内更新数据信息
"""

import requests
import logging
import mysql_db
import queue
import threading
from datetime import datetime, timedelta


logging.basicConfig(format='%(asctime)s - %(message)s', level=logging.DEBUG)
# URL_API = 'https://api.bdxzyapi.com/api.php/provide/vod'
URL_API = 'http://api.nguonphim.tv/api.php/provide/vod'


def update_category():
    params = {'ac': 'list', 't': 1}
    try:
        res_json = requests.get(URL_API, params=params).json()['class']
        sql = "INSERT INTO category (id, name) VALUES (%s, %s) ON DUPLICATE KEY UPDATE name = VALUES(name)"
        params = []
        for obj in res_json:
            params.append((obj['type_id'], obj['type_name']))
        logging.debug(params)
        cursor = conn.cursor()
        mysql_db.executemany(cursor, sql, params)
        conn.commit()
    except Exception as e:
        logging.error(e)


def get_movies_data():
    params = {'ac': 'detail', 'ids': None}
    res_json = requests.get(URL_API, params=params).json()
    pg_count = res_json['pagecount']
    limit = res_json['limit']
    total = res_json['total']
    logging.info(f'page {pg_count}, limit {limit}, total {total}')

    n = pg_count if pg_count <= 10 else pg_count // 10
    pg_lst = list(chunks(list(range(1, pg_count + 1)), n))
    # logging.debug(len(pg_lst))
    for idx, lst in enumerate(pg_lst):
        # logging.info(f'Create and start thread {idx}')
        th = threading.Thread(target=get_info, args=(lst,))
        threads.append(th)
        th.start()


def chunks(lst, n):
    for i in range(0, len(lst), n):
        yield lst[i:i + n]


def get_info(lst):
    logging.info(f'Get movies data from page {lst[0]} to page {lst[-1:]}')
    for pg in lst:
        data = []
        params = {'ac': 'detail', 'pg': pg, 'ids': None}
        movies = requests.get(URL_API, params=params).json()['list']
        for movie in movies:
            id = movie['vod_id']
            name = movie['vod_name']
            name2 = movie['vod_sub']
            m_stt = movie['vod_version']
            m_drt = movie['vod_director']
            actor = movie['vod_actor']
            catg_id = movie['type_id']
            m_type = 1 if movie['vod_serial'] == "0" else 2
            m_class = movie['vod_class']
            m_nt = movie['vod_area']
            m_y = movie['vod_year']
            m_img = movie['vod_pic']
            m_dspt = movie['vod_content']
            m_dur = parse_duration(movie['vod_duration'])
            m_view = movie['vod_hits']
            m_rmk = movie['vod_remarks']
            m_up = movie['vod_up']
            m_down = movie['vod_down']
            m_score = float(movie['vod_score'])
            data.append(tuple([id, name, name2, m_stt, m_drt, actor, catg_id, m_type, m_class, m_nt, m_y, m_img, m_dspt, m_dur, m_view, m_rmk, m_up, m_down, m_score]))
        lock.acquire()
        insert(data)
        lock.release()


def parse_duration(dur):
    try:
        x = datetime.strptime(dur, '%H:%M:%S')
        return round(timedelta(hours=x.hour, minutes=x.minute, seconds=x.second).total_seconds() / 60, 1)
    except Exception as e:
        try:
            d = ''.join([i for i in dur if i.isdigit()])
            return float(d)
        except Exception as e:
            return 0


def insert(params):
    try:
        sql = """
        INSERT INTO film (id, name, name2, status, director, actor, category_id, type_movie, class, nation, year, image, description, duration, num_view, remarks, up_voted, down_voted, score)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
        logging.info(params[9])
        cursor = conn.cursor()
        # mysql_db.executemany(cursor, sql, params)
    except Exception as e:
        logging.error(f'INSERT ERROR {e}')
        conn.rollback()


if __name__ == '__main__':
    conn = mysql_db.connect('root', '', 'localhost', 'inguon')
    movies_lst = []
    threads = []
    lock = threading.Lock()
    # update_category()
    get_movies_data()
    for idx, th in enumerate(threads):
        th.join()
    conn.commit()
    # logging.info(parse_duration(''))
    mysql_db.close(conn)
