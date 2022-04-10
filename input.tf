# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "config" {
  type = object({
    class    = string,
    create   = bool,
    password = string
  })
  description = "Input for database module"
}

variable "input" {
  type = object({
    tenancy = any,
    service = any,
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