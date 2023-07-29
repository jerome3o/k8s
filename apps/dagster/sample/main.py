from dagster import asset, Definitions


@asset
def my_asset():
    return 5


definitions = Definitions([my_asset])
