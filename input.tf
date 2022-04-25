# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "account" {
  description = "Account parameter"
  type = object({
    tenancy_id = string,
    class      = bool
  })
}

variable "options" {
  description = "Input for database module"
  type = object({
    create   = bool,
    password = string
  })
}

variable "configuration" {
  description = "configuration parameter for the database service"
  type = object({
    resident  = any,
    database = any
  })
}

variable "assets" {
  description = "Retrieve asset identifier"
  type = object({
    encryption = any,
    network    = any,
    resident   = any
  })
}