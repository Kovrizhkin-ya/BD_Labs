from table import table
from insert import *
from result import get_result
import warnings
warnings.filterwarnings("ignore")


if __name__ == "__main__":
     table("sql/1_CREATE_TABLE.sql", "config/zno.env", "Create table zno\n")
     insert_data()
     get_result()

     table("sql/2_NORMAL_TABLE.sql", "config/zno.env", "Norming tables\n")
     table("sql/2_NORMAL_TABLE.sql", "config/zno_norm.env", "Creating second bd\n")
     table("sql/3_MIGRATION.sql", "config/zno.env", "Migrations\n")
     table_names = ["loc", "educate_organisation", "participants", "test", "participants_eo"]
     migrate_data("config/zno.env", "config/zno_norm.env", table_names)



