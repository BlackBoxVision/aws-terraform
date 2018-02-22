output "api-0 Private DNS" {
  value = "${aws_instance.api-0.private_dns}"
}

output "api-1 Private DNS" {
  value = "${aws_instance.api-1.private_dns}"
}

output "load-balancer-0 Public DNS" {
  value = "${aws_instance.load-balancer-0.public_dns}"
}

