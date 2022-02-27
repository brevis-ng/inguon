import mysql.connector
from mysql.connector import errorcode
import logging


logging.basicConfig(format='%(asctime)s - %(message)s', level=logging.DEBUG)


def connect(user, pw, host, db):
    conn = None
    try:
        conn = mysql.connector.connect(
            user=user,
            password=pw,
            host=host,
            database=db,
        )
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            logging.error('Username or password is wrong')
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            logging.error('Database is not exist')
        else:
            logging.error(err)
    finally:
        return conn

def close(conn: mysql.connector.MySQLConnection):
    if conn is not None:
        conn.close()
        logging.info('Connection is closed')

def execute(cursor, sql: str, params=None):
    if cursor is None:
        return
    try:
        cursor.execute(sql, params)
        cursor.close()
        if cursor.with_rows:
            logging.info(f'Rows produced by statement "{cursor.statement}":')
            return cursor.fetchall()
        else:
            logging.info(f'Number of rows affected by statement "{cursor.statement}": "{cursor.rowcount}"')
    except mysql.connector.Error as err:
        logging.error(err)

def executemany(cursor, sql: str, params=None):
    if cursor is None:
        return
    try:
        cursor.executemany(sql, params)
        logging.info(f'Number of rows affected by statement "{cursor.rowcount}"')
        cursor.close()
    except Exception as e:
        logging.error(e)
