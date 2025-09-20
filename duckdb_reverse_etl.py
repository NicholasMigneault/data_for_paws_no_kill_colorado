import duckdb

def to_csv_query(table_name: str):
    return f"COPY data.dbt_marts.{table_name} to 'data/{table_name}.csv' (HEADER, DELIMITER ',');"

# todo: refine this to use the information schema to query table names, instead of hard-coding

if __name__ == "__main__":
    # define tables to also check into version control as csvs
    marts_tables = ['yearly_shelter_statistics']

    # connect to in-repo duckdb database
    con = duckdb.connect("data/data.duckdb")

    # copy marts tables to csv's for easy access
    for table in marts_tables:
        print(to_csv_query(table))
        con.sql(to_csv_query(table))