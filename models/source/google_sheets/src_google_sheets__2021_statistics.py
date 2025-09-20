import pandas as pd

def model(dbt, session):

    # create series containing dlt metadata column names
    metadata = pd.Series(['_dlt_load_id','_dlt_id'])

    # get source data
    my_sql_model_df = dbt.source('google_sheets', 'gsheet_2021_stats')
    
    # convert response to pandas df
    df = my_sql_model_df.df()

    # parse row1 (headers), ignoring dlt metadata columns
    headers = df.iloc[0,0:-2]

    # format column names
    headers = headers.replace(' ', '_',regex=True).replace('\n', '',regex=True).replace(r'\/', '_',regex=True)
    
    # add back in dlt metadata columns
    headers = pd.concat([headers,metadata])

    # grab actual data from response, sans first row
    body = df.iloc[1:].to_numpy()

    # create new df
    formatted_df = pd.DataFrame(data=body, columns=headers)

    # aggregate to prevent duplicate facility names
    final_df = formatted_df.groupby('Facility_Name').sum().reset_index()

    # final table, swap this to final_df to aggregate dupe facility names into the source table
    return formatted_df