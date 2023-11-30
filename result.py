from insert import get_time
import os




def get_result_time():
     insert_time = get_time()
     file = open('result/insert_time.txt', 'w')
     for i in range(len(insert_time)):
          file.write(f"Time loading of {insert_time[i][0]} to db = {insert_time[i][1]}\n")
     file.close()



def get_result():
     if not os.path.exists('result'):
          os.makedirs('result')
     get_result_time()
     print("Result is saved (dir 'result')\n")
