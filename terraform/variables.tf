variable "common_tags" {
  default = {
    Project = "roboshop"
    Environment = "dev"
    Terrafrom = "true"
  }
}

variable "sg_id" {
  default = {}
}

variable "project_name" {
  default = "roboshop"
}

variable "tags" {
  default = {
    Component = "catalogue"
  }
}



variable "sg_tags" {
  default = {}
}

variable "environment" {
  default = "dev"
}


variable "zone_name" {
  default = "grobo.shop"
}