import os

from dagster import asset, Definitions, get_dagster_logger
import boto3

_logger = get_dagster_logger()
_endpoint_url = os.environ.get(
    "S3_ENDPOINT_URL", "http://minio-dev.k8s.jeromeswannack.com/"
)


@asset
def my_asset():
    s3 = boto3.client("s3", endpoint_url=_endpoint_url)
    all_buckets = s3.list_buckets()
    _logger.info(f"Found buckets: {all_buckets}")
    return [bucket["Name"] for bucket in all_buckets["Buckets"]]


definitions = Definitions([my_asset])
