# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "account" {
  type = object({
    tenancy_id = string,
    class      = bool
  })
  description = "Account parameter"
}

variable "options" {
  type = object({
    create   = bool,
    password = string
  })
  description = "Input for database module"
}

variable "configuration" {
  type = object({
    service  = any,
    database = any
  })
}

variable "assets" {
  type = object({
    encryption = any,
    network    = any,
    resident   = any
  })
  description = "Retrieve asset identifier"
}