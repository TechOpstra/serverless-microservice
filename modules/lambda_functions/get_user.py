# lambda_functions/get_user.py
import boto3

def lambda_handler(event, context):
    table_name = 'serverless_workshop_intro'
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(table_name)

    user_id = event['userid']
    response = table.get_item(
        Key={
            'Userid': user_id
        }
    )

    if 'Item' in response:
        return {'message': 'User found', 'data': response['Item']}
    else:
        return {'message': 'User not found'}
