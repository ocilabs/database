# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

// --- terraform provider --- 
terraform {
  required_providers {
    oci = {
      source = "hashicorp/oci"
    }
  }
}

resource "random_string" "admin_password" {
  length      = 16
  min_numeric = 1
  min_lower   = 1
  min_upper   = 1
  min_special = 1
}

data "oci_identity_compartments" "database" {
  compartment_id = var.tenancy.id
  access_level   = "ANY"
  compartment_id_in_subtree = true
  name           = try(var.database.compartment, var.resident.name)
  state          = "ACTIVE"
}
data "oci_database_autonomous_databases" "database" {
  compartment_id = data.oci_identity_compartments.database.compartments[0].id
}

data "oci_database_autonomous_db_versions" "database" {
  compartment_id = data.oci_identity_compartments.database.compartments[0].id
}


locals {}

// Define the wait state for the data requests
resource "null_resource" "previous" {}

// This resource will destroy (potentially immediately) after null_resource.next
resource "time_sleep" "wait" {
  depends_on = [null_resource.previous]
  create_duration = "2m"
}