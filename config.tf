# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

// --- terraform provider --- 
terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
    }
  }
}

data "oci_identity_compartments" "database" {
  compartment_id = var.configuration.tenancy.id
  access_level   = "ANY"
  compartment_id_in_subtree = true
  name           = try(var.configuration.database.compartment, var.configuration.resident.name)
  state          = "ACTIVE"
}

data "oci_secrets_secretbundle" "database" {
  secret_id = var.assets.encryption.secret_ids["${var.configuration.database.display_name}_secret"]
}
data "oci_database_autonomous_databases" "database" {
  compartment_id = data.oci_identity_compartments.database.compartments[0].id
}

locals {
  adb_count = var.options.create ? 1 : 0
  module_freeform_tags = {
    # list of freeform tags, added to stack provided freeform tags
    terraformed = "Please do not edit manually"
  }
  merged_freeform_tags = merge(local.module_freeform_tags, var.assets.resident.freeform_tags)
}


// Define the wait state for the data requests
resource "null_resource" "previous" {}

// This resource will destroy (potentially immediately) after null_resource.next
resource "time_sleep" "wait" {
  depends_on = [null_resource.previous]
  create_duration = "2m"
}