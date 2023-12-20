import psycopg

from connect import get_conn
import pandas as pd
import numpy as np
import time
import os

insert_time = {}

def insert_rows(data, n, transaction, col, s, table, envpath):
    try:
        conn = get_conn(envpath)
        cur = conn.cursor()
        for row in data.iloc[n:n + transaction].to_numpy():
            cur.execute(f"INSERT INTO {table} ({col}) VALUES ({s})", tuple(row))
        conn.commit()
        cur.close()
        conn.close()
        print(f"Inserted rows in table {table}: {n}-{n+transaction};")
    except Exception as e:
        print(e)
        insert_rows(data, n, transaction, col, s, table, envpath)

def insert_data():
    transaction = 100
    for file_name in os.listdir('files'):
        print(f"Inserting rows from {file_name} to db:")
        start = time.perf_counter()
        data = pd.read_csv(os.path.join('files', file_name), encoding='cp1251', sep=';', decimal=',', low_memory=False, nrows=100)
        data["zno_year"] = file_name[5:9]
        data = data.replace([np.nan], [None])
        data.columns = data.columns.str.lower()
        col = ','.join(data.columns.values)
        s = ','.join(["%s" for s in data.columns.values])
        for n in range(0, len(data), transaction):
            insert_rows(data, n, transaction, col, s, "zno", "config/zno.env")
        print("Inserting complete.\n")
        insert_time[file_name] = time.perf_counter() - start
    
def get_time():
    return list(insert_time.items())

def get_df_from_db(envpath, table):
    conn = get_conn(envpath)
    data = pd.read_sql(f"SELECT * FROM {table};", conn)
    conn.close()
    return data


def insert_table(table, envpath_conn, envpath_destination, transaction):
    data = get_df_from_db(envpath_conn, table)
    data = data.replace([np.nan], [None])

    col = ','.join(data.columns.values)
    s = ','.join(["%s" for s in data.columns.values])

    for n in range(0, len(data), transaction):
        insert_rows(data, n, transaction, col, s, table, envpath_destination)


def migrate_data(envpath_conn, envpath_destination, table_names):
    try:
        transaction = 100
        for table in table_names:
            insert_table(table, envpath_conn, envpath_destination, transaction)

    except Exception as e:
        print(f"Error: {e}")


