from connect import get_conn
import pandas as pd
import numpy as np
import time
import os

insert_time = {}

def insert_rows(data, n, transaction, col, s):
    try:
        conn = get_conn()
        cur = conn.cursor()
        for row in data.iloc[n:n + transaction].to_numpy():
            cur.execute(f"INSERT INTO zno ({col}) VALUES ({s})", tuple(row))
        conn.commit()
        cur.close()
        conn.close()
        print(f"Inserted rows: {n}-{n+transaction};")
    except:
        insert_rows(data, n, transaction, col, s)

def insert_data():
    transaction = 500
    for file_name in os.listdir('files'):
        print(f"Inserting rows from {file_name} to db:")
        start = time.perf_counter()
        data = pd.read_csv(os.path.join('files', file_name), encoding='cp1251', sep=';', decimal=',', low_memory=False, nrows=10000)
        data["zno_year"] = file_name[5:9]
        data = data.replace([np.nan], [None])
        data.columns = data.columns.str.lower()
        col = ','.join(data.columns.values)
        s = ','.join(["%s" for s in data.columns.values])
        for n in range(0, len(data), transaction):
            insert_rows(data, n, transaction, col, s)
        print("Inserting complete.\n")
        insert_time[file_name] = time.perf_counter() - start
    
def get_time():
    return list(insert_time.items())
