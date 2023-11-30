import os
from dotenv import load_dotenv


dotenv_path = os.path.join(os.path.dirname(__file__), '.env')
print(load_dotenv("C:/Users/38097\Desktop/Lab_1/config.env"))


print(os.getenv("DB_USERNAME"))