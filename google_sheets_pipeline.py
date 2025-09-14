from typing import Sequence

import dlt

from google_sheets import google_spreadsheet

# TODO: Can we programatically move xlsx to sheet and then ingest that? 2018

def load_pipeline_with_ranges(
    spreadsheet_url_or_id: str, range_names: Sequence[str], sheet_name: str
) -> None:
    """
    Function to load single google sheet, based on explicitly passed range
    Args:
        spreadsheet_url_or_id (str): Unique Google Sheet identifier or url. The ID lives in the url, so if the entire url is passed, the ID gets parsed out. For a sample URL:
            https://docs.google.com/spreadsheets/d/1mmsehBjl-V1eVueiCJEjFV6PhM6eKaCCPFIfcrk7IKk/...
            ID = 1mmsehBjl-V1eVueiCJEjFV6PhM6eKaCCPFIfcrk7IKk
            
        range_names (Sequence[str]): Range of cells to ingest, formatted as {Google Sheet Tab Name}!{Range}, ex: "Form Responses 1!A1:FQ329"

        sheet_name (str): Unique descriptor, used in the two places 
                          - dlt pipeline name: gsheet_{sheet_name}_pipeline
                          - duckdb table name: gsheet_{sheet_name}
                          
    """
    # create the pipeline object
    pipeline = dlt.pipeline(
        pipeline_name=f"gsheet_{sheet_name}_pipeline",
        destination=dlt.destinations.duckdb("data/data.duckdb"),
        dataset_name="raw",
    )

    # create the sheet specific resource, based on function inputs
    data = google_spreadsheet(
        spreadsheet_url_or_id=spreadsheet_url_or_id,
        range_names=range_names,
        get_sheets=False,
        get_named_ranges=False,
    )

    # set table alias based on given sheet name
    table_alias = f"gsheet_{sheet_name}"
    data.resources[range_names[0]].apply_hints(table_name=table_alias)

    # run pipeline
    info = pipeline.run(data)
    print(info)

def load_multi_year_statistics(sheets_config: dict):
    """
    Function to load single google sheet, based on explicitly passed range
    Args:
        sheets_config (dict): A dictionary object that contains a dictionary for each year of statistics data ingested. This structure is defined in the configure_years function and is transformed here into a series of dlt resources that are then run and ingested into a local duckdb.

        To add new years of data, simply modify the configure_years function with additional sheets
    """
    # Create pipeline object
    pipeline = dlt.pipeline(
        pipeline_name="gsheets_shelter_statistics",
        destination=dlt.destinations.duckdb("data/data.duckdb"),
        dataset_name="raw",
    )
    
    # init resource list
    run_list = []

    for key,value in sheets_config.items():
        # create a spreadsheet object pointing to each sheet for ingestion
        data = google_spreadsheet(
            spreadsheet_url_or_id = value['id'],
            range_names = value['range'],
            get_sheets = False,
            get_named_ranges = False,
        )

        # alias the table name
        data.resources[value['range'][0]].apply_hints(table_name=f"gsheet_{key}_stats")
        
        # append objects to list of sheets to ingest
        run_list.append(data)

    # run pipeline
    info = pipeline.run(run_list)
    print(info)

def configure_years():
    """
    Function for manual configuration of google sheets to ingest containing yearly shelter statistics
    This data sources from the Pet Animal Care and Facilities Act from the Colorado Dept of Agriculture

    Configuration is a dictionary of dictionaries, with each nest object titled as the year the statistics apply to. That year has 2 parameters, the google sheet ID and the specific range for that sheet, both housed in the .dlt/config.toml file.
    """
    list_configuration = {}

    list_configuration['2024'] = {
        'id': dlt.config['sources.google_sheets.url_or_id_2024'],
        'range': dlt.config['sources.google_sheets.range_names_2024']
    }
    list_configuration['2023'] = {
        'id': dlt.config['sources.google_sheets.url_or_id_2023'],
        'range': dlt.config['sources.google_sheets.range_names_2023']
    }
    list_configuration['2022'] = {
        'id': dlt.config['sources.google_sheets.url_or_id_2022'],
        'range': dlt.config['sources.google_sheets.range_names_2022']
    }
    list_configuration['2021'] = {
        'id': dlt.config['sources.google_sheets.url_or_id_2021'],
        'range': dlt.config['sources.google_sheets.range_names_2021']
    }
    list_configuration['2020'] = {
        'id': dlt.config['sources.google_sheets.url_or_id_2020'],
        'range': dlt.config['sources.google_sheets.range_names_2020']
    }
    list_configuration['2019'] = {
        'id': dlt.config['sources.google_sheets.url_or_id_2019'],
        'range': dlt.config['sources.google_sheets.range_names_2019']
    }
    list_configuration['2018'] = {
        'id': dlt.config['sources.google_sheets.url_or_id_2018'],
        'range': dlt.config['sources.google_sheets.range_names_2018']
    }

    return list_configuration

if __name__ == "__main__":
    # ad hoc run of active licenses sheet
    load_pipeline_with_ranges(dlt.config['sources.google_sheets.url_or_id_active_licenses'], dlt.config['sources.google_sheets.range_names_active_licenses'], 'active_licenses')
    
    # core yearly statistic pipeline run
    load_multi_year_statistics(configure_years())