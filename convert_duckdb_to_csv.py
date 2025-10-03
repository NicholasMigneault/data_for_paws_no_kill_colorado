import duckdb

def to_csv_query(table_name: str):
    return f"COPY data.dbt_marts.{table_name} to 'data/{table_name}.csv' (HEADER, DELIMITER ',');"

# todo: refine this to use the information schema to query table names, instead of hard-coding

if __name__ == "__main__":
    # define tables to also check into version control as csvs
    marts_tables = ['yearly_shelter_statistics', 'facilities']

    # quick non-dbt query to OBT the two marts models
    yearly_stats_obt = """
    select yss.*
        ,f.* exclude (facility_name)
    from data.dbt_marts.yearly_shelter_statistics as yss
    left join data.dbt_marts.facilities as f 
        on yss.facility_sk = f.facility_sk
    """

    # connect to in-repo duckdb database
    con = duckdb.connect("data/data.duckdb")

    # copy marts tables to csv's for easy access
    for table in marts_tables:
        print(to_csv_query(table))
        con.sql(to_csv_query(table))

    # print OBT to csv too
    con.sql(f"COPY ({yearly_stats_obt}) to 'data/yearly_statistics_with_facility_data.csv' (HEADER, DELIMITER ',');")