## AWS Terraform POC

### How to run it

First you should go to Terraform website (https://www.terraform.io/downloads.html) and download the correct binary for your OS and follow the instructions.

And then simply run`terraform apply`

### Project files

#### main.tf
Contains the creation of the infrastructure, it creates the connection to AWS, in order to create the instances and security groups in use for those instances.  

#### variables.tf
Contains all the variables that are used in the main file.  

#### output.tf
Contains all the outputs that will be shown once the `terraform apply` command exits.
In this file you can print all the useful data from the infrastructure that you just created.  

### Configuration specific files
#### \*.auto.tfvars 
Contains all the values that will override the variable defined in `variables.tf` file.  
In the variables file, there are two kinds of variables, the required (The ones equal to {}) or the optional (The ones that has a default value set)  
Those values can be overriden in a key = value format.   
For example, to override the AWS_ACCESS_KEY var, you need to write something like this in your .auto.tfvars file:  
`AWS_ACCESS_KEY = "SUPERSTRONGANDAWESOMEACCESSKEY"`
