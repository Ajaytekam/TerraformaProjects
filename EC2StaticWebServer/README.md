## Purpose

* Create EC2 Instance
* Create Security Group allows port 80, 22
* Run provision script to host static website 

## Usage  

1. Create an S3 bucket and update the name of S3 bucket name in s3-backend.tf file  

```
aws s3api create-bucket --bucket ec2websrv-tfstate --region ap-south-1 --create-bucket-configuration LocationConstraint=ap-south-1
```

2. Create a DynamoDB table and update the name of the table (used for state lock) on s3-backend.tf file.  

```
aws dynamodb create-table --table-name terraform_locks --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
```

3. Now run below commands 

```
terraform init 
terraform fmt
terraform validate 
terraform plan
terraform apply
```  

4. Now in order to utilize the remote state file (on s3 bucket) use below command to initiate 

```
terraform init -backend-config="bucket=ec2websrv-tfstate" -backend-config="key=terraform.tfstate" -backend-config="region=ap-south-1"
```

5. Now delete the infrastructure 

```
terraform destroy
```

6. Delete the S3 bucket and DynamoDB 

```
aws s3 rb s3://ec2websrv-tfstate --force   
aws dynamodb delete-table --table-name terraform_locks
```  
