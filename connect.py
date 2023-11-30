import psycopg
import time
from dotenv import load_dotenv
import os


load_dotenv("config.env")

username = os.getenv("DB_USERNAME")
password = os.getenv("DB_PASSWORD")
database = os.getenv("DB_DATABASE")
host = os.getenv("DB_HOST")
port = os.getenv("DB_PORT")

def get_conn():
     try:
          conn = psycopg.connect(user=username, password=password, dbname=database, host=host, port=port)
          return conn
     except:
          print("Reconnecting...")
          time.sleep(5)
          get_conn()

