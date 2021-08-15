import googleapiclient.discovery
from googleapiclient.errors import HttpError
from oauth2client.client import GoogleCredentials
import logging

logging.basicConfig(filename='test.log', format='%(filename)s: %(message)s', level=logging.INFO)


def get_instance_metadata(key):
    project_name = "playground"
    zone_id = "us-central1-a"
    instance_name = "test-instance"

    # Use default credentials
    credentials = GoogleCredentials.get_application_default()
    # Build and initialize the API
    compute_client = googleapiclient.discovery.build('compute', 'v1', credentials=credentials)
    # Fetching instance
    try:
        instance = compute_client.instances().get(project=project_name, zone=zone_id,
                                                  instance=instance_name).execute()
    except HttpError as e:
        logging.error("error fetching instance details : " + e.__str__())
        return {}
    else:
        logging.info("Instance fetched successfully")

    if 'items' not in instance["metadata"]:
        logging.error("no instance metadata present for instance: " + instance_name)
        return {}

    # Fetch Metadata items
    instance_metadata = instance["metadata"]["items"]

    # Find and return metadata key's object if present
    for metadata in instance_metadata:
        if metadata['key'] == key:
            return metadata

    logging.error("metadata not found for the given key")


if __name__ == "__main__":
    print(get_instance_metadata(key='key1'))
