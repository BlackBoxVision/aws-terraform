variable AWS_ACCESS_KEY {}
variable AWS_SECRET_KEY {}
variable AWS_REGION {
    default = "us-east-1"
}
variable AWS_AMI {
    default = "ami-66506c1c"
}

variable AWS_INSTANCE_KEY_NAME {}

// This variables can be overriden using a variables.auto.tfvars file
// Using a key = value file format
// For example, 
// AWS_REGION = "us-east-2"
