# Data for Paws: No Kill Colorado x Data Changemakers

Utilizing dltHub, dbt, & DuckDB to ingest, transform, and model years of Colorado shelter statistics for analysis and visualization

- [No Kill Colorado](https://www.nokillcolorado.org)
- [Data Changemakers](https://www.datachangemakers.org/)
- [PACFA](https://ag.colorado.gov/animal-welfare/pet-animal-care-and-facilities-act)
- [Event Details](https://www.datachangemakers.org/event-details/no-kill-colorado)

### Data Wrangling Goals
1. Create a unified and clean dataset: This involves tackling inconsistent column headers across various spreadsheets and enriching the data with geographical information (city, state, zip code) for each organization.
2. Add geo information to each organization (City County, Zip Code) and define the type of organization (Rescue, Sanctuary, Shelter)
3. Grouping some of the data elements (such as intake, outcomes (negative and positive separately), and “transfer” data elements)
4. Increase NKC’s visibility as a leader in animal welfare in Colorado

## Approach
Tools like dbt and dltHub are an increasingly popular part of a modern data stack, in large part because they are open source, code first, and easily scale from a small proof of concept to a large deployment. Moving the entire development lifecycle (Ingestion, Transformation, Documentation) into versioned code increases accessibility and reduces blind spots for developers and downstream users.

In particular, this submission uses the following stack: DuckDB, dlt, and dbt. dltHub is a declarative pyhton package for data ingestion, and makes refreshing changed data or adding new years of data easy. The ingestion points to a single `data.duckdb` file, which is a database file format. DuckDB also has a python package that enables you to easily access and navigate the different data objects with the file format. Once data is landed into our DuckDB, we use dbt to consolidate and transform the data. dbt is a best-in-class tool for making SQL the common language for transformation. The open source package, dbt Core, is again a python package and makes writing and deploying SQL easy and accessible. Futher, dbt and DuckDB work hand-in-hand, as dbt can read the dlt-ingested files as sources and land the updated versions of the data into the same database, meaning a single file can contain our entire data lifecycle, from raw to reporting (aka mart). Lastly, DuckDB provides a solid founding that prevents needing to deploy cloud data resources, yet is easily portable to those same cloud resources, if this project ever needs migration.

### Navigating the Repo
There are two key sub-folders, the `data` folder and the `dbt_nokillcolorado` folder. The root folder contains python scripts that heavily utilize dlt to load data into the `data.duckdb` database in the data folder. Then the SQL defined in `dbt_nokillcolorado` picks up that data from the database and transforms it to a pair of tables for reporting and analysis. These two tables are found in the `data.dbt_marts` schema of the database, and also copied into CSVs for ease of use. The join condition between the tables is `facility_sk`.

```
root
├── .dlt/                      # dlt configuration folder
├── data/                      # folder containing DuckDB database + materialized CSVs
├── dbt_nokillcolorado/        # dbt project folder
│   ├── models/                # folder containing all SQL dbt transformations
│   ├── dbt_project.yml        # dbt configuration file defining project scope and setup
│   └── profiles.yml           # dbt configuration file, defines DuckDB (and repo file path) as database location
├── google_sheets/             # dlt provided helpers for google sheet API connections
├── cim_rest_api_pipeline.py   # dlt pipeline to ingest data from Open Data Colorado into DuckDB
├── convert_duckdb_to_csv.py   # python script to access final DuckDB and convert key tables to in-repo CSVs
└── google_sheets_pipeline.py  # dlt pipeline to ingest google sheet data into DuckDB
```

There are many ways to install DuckDB and connect to a dataset, but the easiest might by via python and pip. If you have python & pip installed already, run `pip install duckdb` and then `duckdb path/to/your/data.duckdb` in the command line. A new interface should appear that allows you to write and enter SQL queries and get a response. Try starting with `show all tables;`.

### Getting Started

If you would like to propose changes or just copy this repository and build locally from there, the following instructions should get you started. There are some installation prerequisites and this does assume a basic familiarity with the Terminal or other CLI.

**Pre-Recs:**
- [git](https://git-scm.com/downloads)
- [python](https://www.python.org/downloads/)
- [uv](https://docs.astral.sh/uv/getting-started/installation/)
- Optional: [VS Code](https://code.visualstudio.com/download) or other IDE

**Set Up**
1. From the terminal, clone the repository
   - `git clone https://github.com/NicholasMigneault/data_for_paws_no_kill_colorado.git`
2. Navigate to the newly cloned repo
   - `cd data_for_paws_no_kill_colorado`
3. Sync dependencies
   - `uv sync`
4. Copy the `secrets.toml-example` file in `.dlt` folder, drop the `-example` from the file extension
5. Fill out the variables
   - CIM
       - Create an account for [Colorado Information Marketplace](https://data.colorado.gov/login)
       - Navigate to Developer Settings and create an API Key, save the name and key as user and password in the `secrets.toml` file
       - [Docs](https://dev.socrata.com/docs/authentication.html)
   - Google Sheets
      - Create a google service account
      - Download the `.json` file and open, paste values from that file into corresponding `secrets.toml` file
      - [dlt Docs](https://dlthub.com/docs/dlt-ecosystem/verified-sources/google_sheets#google-service-account-credentials)
      - [Google Docs](https://developers.google.com/sheets/api/guides/concepts)

**Contributing**
- New Google Sheets
  - add two new lines to `.dlt/config.toml` containing the sheet id and range to ingest, uniquely named
  - add a new function call in the `google_sheets_pipeline.py`. A one-off ingestion will use `    load_pipeline_with_ranges(dlt.config['sources.google_sheets.{sheetid}'], dlt.config['sources.google_sheets.{range}'], '{db_table_name}')`, while a new year of statistics can instead be configured in the `configure_years()` function.
  - Run the pipeline: `python google_sheets_pipeline.py`
- New CIM API endpoints
  - Add a new named endpoint to the `sources.cim_endpoints` within `.dlt/config.toml`
  - Add that endpoint as a new dictionary to the `endpoints` list in the `cim_rest_api_pipeline.py`
  - Run the pipeline: `python cim_rest_api_pipeline.py`
- dbt changes
  - Navigate into the dbt directory (`cd dbt_nokillcolorado`)
  - Make any changes to models, test, documentation, etc
  - Validate changes using `dbt build`
  - Materialize any changes to the csv's by navigating back to the root directory (`cd ..`) and running `python convert_duckdb_to_csv.py`


### Future Improvements
- Facility mapping
  - Clean up spelling and map facilities together
  - Create Parent <> Child hierarchy for dba's, map at that grain
- Consolidated dlt pipelines  
- Automate `dbt build` via [dlt runner](https://dlthub.com/docs/dlt-ecosystem/transformations/dbt/)
- Update `convert_duckdb_to_csv` to dlt pipeline, update query to run off information schema instead of hard-coding
- Automate data refresh with github actions
- Update marts documentation

#### Other Reading
- [dbt](https://www.getdbt.com/product/what-is-dbt)
  - [dbt Core](https://github.com/dbt-labs/dbt-core) (Open Source version)
- [dlt](https://dlthub.com/docs/intro)
- [DuckDB](https://duckdb.org/)
- [Modern Data Stack In-a-Box](https://duckdb.org/2022/10/12/modern-data-stack-in-a-box.html)
- [UV](https://docs.astral.sh/uv/) for python package management
