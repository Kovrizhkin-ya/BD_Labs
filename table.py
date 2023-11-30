from connect import get_conn

def table(filepath, envpath, message):
     try:
          conn = get_conn(envpath)
          cur = conn.cursor()
          with open(filepath, "r") as sql_file:
               sql_code = sql_file.read()
               cur.execute(sql_code)


          conn.commit()
          cur.close()
          conn.close()
          print(message)
     except Exception as e:
          print(e)
          #table(filepath, envpath, message)



