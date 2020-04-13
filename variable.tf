provider "google" {
  credentials = "${file("keyfile.json")}"
  project = "myproject"
  region  = "us-east1"
}
terraform {
  backend "gcs" {
    bucket = "example_gcs_bucket"
    credentials = "keyfile.json"
  }
}

variable "project_id" {
  type = "string"
}

variable "pubsub" {
  description = "for example, pubsub to be created"
  type = map(string)
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}
