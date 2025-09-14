from typing import Any, Optional

import dlt
from dlt.common.pendulum import pendulum
from dlt.sources.rest_api import (
    RESTAPIConfig,
    check_connection,
    rest_api_resources,
    rest_api_source,
)
# to do - align table naming convention with google sheets

@dlt.source(name="CIM")
def CIM_source(
            user: Optional[str] = dlt.secrets.value,
            pw: Optional[str] = dlt.secrets.value,
            endpoints: Optional[list] = None
            ) -> Any:
    # initialize the resources object
    resources = []

    # transform the provided endpoints to required resource format
    for endpoint in endpoints:
        endpoint_obj = {
            "name": f'cim_{endpoint['year']}_stats',
            "endpoint": {
                "path": f'{endpoint['endpoint']}/query.json',
            },
        }
        resources.append(endpoint_obj)

    # Create a REST API configuration for the Colorado Information Management Open Data Portal API
    # Use RESTAPIConfig to get autocompletion and type checking
    config: RESTAPIConfig = {
        "client": {
            "base_url": "https://data.colorado.gov/api/v3/views/",

            # Use basic auth config (requires user and password)
            "auth": (
                {
                    "type": "http_basic",
                    "username": user,
                    "password": pw,

                }
            ),
        },
        # The default configuration for all resources and their endpoints
        "resource_defaults": {
            "primary_key": ":id",
            "write_disposition": "merge",
            "endpoint": {
                "params": {
                    "per_page": 500,
                },
            },
        },
        # Set of endpoints to call when pipeline is run
        "resources": resources
    }

    yield from rest_api_resources(config)


def load_CIM(endpoints: Optional[list]) -> None:
    pipeline = dlt.pipeline(
        pipeline_name="cim_api_pipeline",
        destination=dlt.destinations.duckdb("data/data.duckdb"),
        dataset_name="raw",
    )

    load_info = pipeline.run(
        CIM_source(
            dlt.secrets["source.cim.credentials.username"],
            dlt.secrets["source.cim.credentials.password"],
            endpoints=endpoints
            )
        )
    print(load_info)


if __name__ == "__main__":
    # individally configure the endpoint objects
    endpoints = [
        {
        'year': 2015,
        'endpoint': dlt.config["sources.cim_endpoints.2015"],
        },
        {
        'year': 2016,
        'endpoint': dlt.config["sources.cim_endpoints.2016"],
        },
        {
        'year': 2017,
        'endpoint': dlt.config["sources.cim_endpoints.2017"],
        }
    ]

    # run the pipeline
    load_CIM(endpoints)
