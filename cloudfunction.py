#--------------------------
#requirements.txt
## Function dependencies, for example:
## google-cloud-automl
# Pillow
# requests
#--------------------------

from PIL import Image
import requests
from io import BytesIO
import sys
import base64
from google.cloud import automl_v1beta1
from google.cloud.automl_v1beta1.proto import service_pb2


def encode_image(image):
    image_content = image.read()
    return base64.b64encode(image_content)

def get_prediction(event, context):
    """Triggered by a change to a Cloud Storage bucket.
    Args:
         event (dict): Event payload.
         context (google.cloud.functions.Context): Metadata for the event.
    """
    file = event

    print(f"Processing file: {file['name']}.")
    print(f"file mediaLink: {file['mediaLink']}.")
    response = requests.get(file['mediaLink'])
    img = Image.open(BytesIO(response.content))
    content = encode_image(img)
    print(f"encoded")
    prediction_client = automl_v1beta1.PredictionServiceClient()
    project_id = "ivory-period-127118"
    model_id = "ICN4418541924757434019"
    name = 'projects/{}/locations/us-central1/models/{}'.format(project_id, model_id)
    payload = {'image': {'image_bytes': content }}
    params = {}
    request = prediction_client.predict(name, payload, params)
    return request
