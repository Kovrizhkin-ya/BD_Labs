from connect import get_conn

def create_table():
     try:
          conn = get_conn()
          cur = conn.cursor()

          with open("sql/CREATE_TABLE.sql", "r") as sql_file:
               sql_code = sql_file.read()
               cur.execute(sql_code)

          conn.commit()
          cur.close()
          conn.close()
          print("Table 'zno' created\n")
     except:
          create_table()


