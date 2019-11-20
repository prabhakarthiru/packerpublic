# Unset IAM specific environment variables before assume a IAM role

unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_SESSION_TOKEN
unset AWS_SECURITY_TOKEN

# Assume NDC IAM role and export IAM env variable

export iamcreds=$(aws sts assume-role --role-arn arn:aws:iam::775817220478:role/sameaccount --role-session-name "NDCP" --output text)
export AWS_ACCESS_KEY_ID=$(echo ${iamcreds} | awk '/CREDENTIALS/ {print $5}')
export AWS_SECRET_ACCESS_KEY=$(echo ${iamcreds} | awk '/CREDENTIALS/ {print $7}')
export AWS_SESSION_TOKEN=$(echo ${iamcreds} | awk '/CREDENTIALS/ {print $8}')
export AWS_SECURITY_TOKEN=$AWS_SESSION_TOKEN
export AWS_DEFAULT_REGION=ap-southeast-2

# END