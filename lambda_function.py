import json
import os
import boto3
from decimal import Decimal

dynamodb = boto3.resource('dynamodb')
TABLE_NAME = os.getenv('TABLE_NAME', 'DemoTable')
table = dynamodb.Table(TABLE_NAME)

def decimal_default(obj):
    if isinstance(obj, Decimal):
        return float(obj)
    raise TypeError

def lambda_handler(event, context):
    method = event.get('httpMethod', '')
    path = event.get('path', '/')

    if method == 'POST' and path.endswith('/add-item'):
        try:
            body = json.loads(event.get('body') or '{}')
            if 'id' not in body:
                return {'statusCode': 400, 'body': json.dumps({'error': 'id required'})}
            table.put_item(Item=body)
            return {'statusCode': 200, 'body': json.dumps({'message': 'Item added successfully', 'item': body}, default=decimal_default)}
        except Exception as e:
            return {'statusCode': 500, 'body': json.dumps({'error': str(e)})}

    if method == 'GET' and path.endswith('/get-item'):
        try:
            qs = event.get('queryStringParameters') or {}
            item_id = qs.get('id')
            if not item_id:
                return {'statusCode': 400, 'body': json.dumps({'error': 'id query param required'})}
            resp = table.get_item(Key={'id': item_id})
            item = resp.get('Item')
            return {'statusCode': 200, 'body': json.dumps({'item': item}, default=decimal_default)}
        except Exception as e:
            return {'statusCode': 500, 'body': json.dumps({'error': str(e)})}

    return {'statusCode': 400, 'body': json.dumps({'error': 'Unsupported method or path'})}
