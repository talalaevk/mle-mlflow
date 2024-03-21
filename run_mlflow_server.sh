if [ -f .env ]; then
    export $(cat .env | grep -v '#' | xargs)
fi

mlflow server \
--backend-store-uri postgresql://$DB_DESTINATION_USER:$DB_DESTINATION_PASSWORD@$DB_DESTINATION_HOST:$DB_DESTINATION_PORT/$DB_DESTINATION_NAME \
--registry-store-uri postgresql://$DB_DESTINATION_USER:$DB_DESTINATION_PASSWORD@$DB_DESTINATION_HOST:$DB_DESTINATION_PORT/$DB_DESTINATION_NAME \
--default-artifact-root s3://$AWS_BUCKET_NAME \
--no-serve-artifacts