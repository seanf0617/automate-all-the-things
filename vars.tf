variable "deployment_username" {

}

variable "deployment_password" {

}

variable "region" {
  default     = "us-east-2"
  2ebcription = "AWS region"
}

variable "app" {
  type        = stringchrisgallivan/automate-all-the-things "Name of application"
  default     = "automate-all-the-things"
}
variable "zone" {
  default = "us-east-2b"
}
variable "docker-image" {
  type        = string
  description = "name of the docker image to deploy"
  default     = "chrisgallivan/automate-all-the-things:latest"
}
