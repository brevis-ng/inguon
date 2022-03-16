import json
from re import S
import mysql.connector
from mysql.connector import errorcode
import tmdbsimple as tmdb


IMG_URL = 'https://image.tmdb.org/t/p/original'
tmdb.API_KEY = 'YOUR TMDB KEY'
tmdb.REQUESTS_TIMEOUT = 5


def search_tmdb():
    name_lst = db_movie_name()
    search = tmdb.Search()
    result_dict = {}
    for item in name_lst:
        id, name, remarks, pic = item[0], item[1], item[2], item[3]
        result_dict[id] = {}
        if 'HD' in remarks:
            res = search.movie(language='vi-VN', query=name, include_adult=True)
        elif 'tập' in remarks.lower():
            res = search.tv(language='vi-VN', query=name, include_adult=True)
        result = search.results if len(search.results) == 0 else search.results[0]
        if result:
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


def db_movie_name():
    conn = connet()
    cursor = conn.cursor()
    sql = 'SELECT vod_id, vod_name, vod_remarks, vod_pic FROM mac_vod'
    cursor.execute(sql)
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result


def update():
    json_file = None
    data = []
    with open('output.txt', 'r') as f:
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
    with open('output.txt', 'w', encoding='UTF-8') as f:
        f.write(json_str)
    update()
