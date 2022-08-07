# UST_Terraform_task to Show 

### demo.pdf and demo.pptx file for demonstration and show the process

### setup all local environment which are mentioned  in pdf file or ppt file
## To run this Task -
# Step -1
we need to S3 bucket and DynamoDB for state locking 
So plz go to "backend" folder and run "B_auto.py" file press Enter only for given input
```
$ cd backend
$ python B_auto.py
$ press Enter only
```
![ig](https://user-images.githubusercontent.com/78929192/179165396-1013464b-3006-4f9a-9087-a5d5451b603f.PNG)

# Step -2
used cd .. command come back to "Resoces_create" ,Run again "R_auto.py" file and press Enter for given input 
```
& cd ..
& cd Resoces_create
& python R_auto.py
& press Enter only
```
![ig2](https://user-images.githubusercontent.com/78929192/179165449-ae2ecad2-7316-47e6-8d2d-499961d996c3.PNG)

## to complet all the process it's taking some time  
## check the AWS Console

# some command is used most of time
```
$ terraform init
$ terraform fmt
$ terraform validate
$ terraform plan
$ terraform apply
$ terraform destroy
$ terraform init -reconfigure
```
## to run other env 
```
$ terraform apply -auto-approve 
$ terraform apply -var-file=Env_Pro.tfvars
$ terraform apply -var-file=Env_Test.tfvars
$ terraform apply -var-file=Env_Test.tfvars -var-file=Env_Pro.tfvars
$ terraform destroy -auto-approve
```
## Copy any file local to remote host
```
$ scp -i ./terrafromTF.pem -rv index.html ec2-user@<public_ip>:/home/ec2-user/t
```

# Thank for your time

