#!/bin/bash
# Smoke test for Terraform-deployed S3 bucket

APP_NAME=$1
ENV=$2

URL="http://localhost:4566/${APP_NAME}-${ENV}/index.html"

echo "Running smoke test for ${APP_NAME}-${ENV} at ${URL}"

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}")

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "Smoke test passed!"
    exit 0
else
    echo "Smoke test failed!"
    exit 1
fi
