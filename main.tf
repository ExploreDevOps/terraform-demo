/*terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      #version = "<=5.15.0"
      version = "<4.51.0"
    }
  }
}*/

provider "google" {
    project = "trusty-obelisk-412501"
    region = "us-central1"
    credentials  = "key.json"
  
}

#for_each example
/*resource "google_storage_bucket" "my-bkt0" {
    for_each = toset(["1","2","4","5"])
    name = "trusty-obelisk-412501-test-${each.key}-reddi"
    location = "US"
  
}
#count example
resource "google_storage_bucket" "my-bkt0" {
    count = 5
    name = "trusty-obelisk-412501-test-${count.index}"
    location = "US"
  
}*/

#conditional expressions
variable "env"{
}


resource "google_storage_bucket" "my-bkt0" {
    count = var.env=="dev" ? 5:0
    name = "trusty-obelisk-412501-test-${count.index}"
    location = "US"
  
}
