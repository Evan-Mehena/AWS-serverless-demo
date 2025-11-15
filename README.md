# AWS-serverless-demo
Complete AWS serverless prototype using Lambda, API Gateway, and DynamoDB. Includes SAM template, SQL scripts, architecture diagram, and Postman tests. Ideal for learning and cloud development demos.

# AWS Serverless Demo – Lambda + API Gateway + DynamoDB (Full Version)

This repository is a full, production-ready demo for a serverless API using:
- AWS Lambda (Python)
- API Gateway (REST)
- DynamoDB (NoSQL)
- SAM / CloudFormation template for deployment

## What’s included
- Lambda code (lambda_function.py)
- SAM template (template.yaml)
- DynamoDB table setup in template
- Database schema & sample data (for local testing / migrations)
- Advanced query example (for the separate SQL project)
- ER diagram (text) and architecture PNG
- Postman collection for testing
- .gitignore and helpful notes

## Quick local / deployment steps
1. Install AWS SAM CLI: https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html
2. Build:
   ```
   sam build
   ```
3. Deploy (guided):
   ```
   sam deploy --guided
   ```
4. After deployment, note the API endpoint and use Postman / curl to test:
   - `POST /add-item`
   - `GET /get-item?id=<id>`

## Notes
- The template creates a DynamoDB table named `DemoTable`. Adjust names/permissions for production.
- The Lambda uses AWS SDK (boto3) to interact with DynamoDB.
