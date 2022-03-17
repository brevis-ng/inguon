import json
import mysql.connector
from mysql.connector import errorcode
import tmdbsimple as tmdb
from datetime import datetime


IMG_URL = 'https://image.tmdb.org/t/p/original'
OUTPUT_FILE = 'output.txt'
tmdb.API_KEY = '7ade87f75c757f82c658d23699f364a6'
tmdb.REQUESTS_TIMEOUT = 5


def search_tmdb():
    name_lst = db_movie_name(datetime.strftime(datetime.now(), '%Y-%m-%d'))
    search = tmdb.Search()
    result_dict = {}
    res = {}
    for item in name_lst:
        id, name, remarks, pic = item[0], item[1], item[2], item[3]
        result_dict[id] = {}
        if 'HD' in remarks:
            res = search.movie(language='vi-VN', query=name, include_adult=True)
        elif 'tập' in remarks.lower():
            res = search.tv(language='vi-VN', query=name, include_adult=True)
        else:
            continue
        results = res['results']
        if results:
            result = results[0]
            print(result)
            backdrop_path = result['backdrop_path']
            result_dict[id]['name'] = name
            result_dict[id]['inguon_pic'] = pic
            result_dict[id]['tmdb_pic'] = f'{IMG_URL}{backdrop_path}'
            result_dict[id]['tmdb_content'] = result['overview']
    return json.dumps(result_dict)


def connet():
    conn = None
    try:
        conn = mysql.connector.connect(
            user='root',
            password='',
            host='127.0.0.1',
            database='vncms',
        )
    except Exception as e:
        print('CONNECT ERROR')
    finally:
        return conn


def executemany(cursor, sql: str, params=None):
    if cursor is None:
        return
    try:
        cursor.executemany(sql, params)
        print(f'Number of rows affected by statement "{cursor.rowcount}"')
        cursor.close()
    except Exception as e:
        print(f'UPDATE ERROR: {e}')


def db_movie_name(date):
    conn = connet()
    cursor = conn.cursor()
    sql = f'SELECT vod_id, vod_name, vod_remarks, vod_pic FROM mac_vod WHERE from_unixtime(vod_time, "%Y-%m-%d") = "{date}"'
    cursor.execute(sql)
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result


def update():
    now = datetime.strftime(datetime.now(), '%Y%m%d')
    json_file = None
    data = []
    with open(f'{now}_{OUTPUT_FILE}', 'r') as f:
        json_file = json.load(f)
    for key, value in json_file.items():
        if value:
            data.append(tuple([value['tmdb_pic'], key]))
    print(data)
    sql = 'UPDATE mac_vod SET vod_pic_slide = %s WHERE vod_id = %s'
    conn = connet()
    cursor = conn.cursor()
    executemany(cursor, sql, data)


if __name__ == '__main__':
    json_str = search_tmdb()
    now = datetime.strftime(datetime.now(), '%Y%m%d')
    with open(f'{now}_{OUTPUT_FILE}', 'w') as f:
        f.write(json_str)
    update()
