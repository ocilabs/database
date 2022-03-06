# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

resource "oci_database_autonomous_database" "database" {
  compartment_id           = data.oci_identity_compartments.database.compartments[0].id
  cpu_core_count           = var.database.cores
  data_storage_size_in_tbs = var.database.storage
  db_name                  = var.database.name
  admin_password           = var.input.password == false ? random_string.admin_password : random_string.admin_password 
  db_version               = var.database.version
  display_name             = var.database.display_name
  db_workload              = var.database.type
  is_free_tier             = var.tenancy.class    == "FREE_TIER" ? "true" : "false"
  license_model            = var.database.license
}

/*
resource "oci_database_autonomous_database" "db_free" {
  #Required
  admin_password           = random_string.autonomous_database_admin_password.result
  compartment_id           = var.compartment_ocid
  cpu_core_count           = "1"
  data_storage_size_in_tbs = "1"
  db_name                  = "adbdb1f"

  #Optional
  db_version                                     = data.oci_database_autonomous_db_versions.test_autonomous_db_versions.autonomous_db_versions[0].version
  db_workload                                    = var.autonomous_database_db_workload
  display_name                                   = "example_autonomous_database"
  freeform_tags                                  = var.autonomous_database_freeform_tags
  is_auto_scaling_enabled                        = "true"
  license_model                                  = var.autonomous_database_license_model
  is_preview_version_with_service_terms_accepted = "false"
  whitelisted_ips                                = ["1.1.1.1/28"]
}

resource "oci_database_autonomous_database" "db_payg" {
  admin_password                       = random_string.autonomous_database_admin_password.result
  compartment_id                       = var.compartment_ocid
  cpu_core_count                       = "1"
  data_storage_size_in_tbs             = "1"
  db_name                              = "adbdb11f"
  db_version                           = "19c"
  db_workload                          = "AJD"
  license_model                        = "LICENSE_INCLUDED"
  is_free_tier                         = "false"
  autonomous_maintenance_schedule_type = var.autonomous_database_autonomous_maintenance_schedule_type
}

resource "oci_database_autonomous_database" "db_apex" {
  admin_password           = random_string.autonomous_database_admin_password.result
  compartment_id           = var.compartment_ocid
  cpu_core_count           = "1"
  data_storage_size_in_tbs = "1"
  db_name                  = "adbapex"
  db_version               = "19c"
  db_workload              = "APEX"
  license_model            = "LICENSE_INCLUDED"
  is_free_tier             = "false"
}

resource "oci_database_autonomous_database" "db_actions" {
  admin_password           = random_string.autonomous_database_admin_password.result
  compartment_id           = var.compartment_ocid
  cpu_core_count           = "1"
  data_storage_size_in_tbs = "1"
  db_name                  = "adbdb11ff"
  db_version               = "19c"
  db_workload              = "AJD"
  license_model            = "LICENSE_INCLUDED"
  is_free_tier             = "false"
  state                    = "STOPPED"
}

resource "oci_database_autonomous_database_backup" "db" {
  #Required
  autonomous_database_id = oci_database_autonomous_database.autonomous_database.id
  display_name           = var.autonomous_database_backup_display_name
}

resource "oci_database_autonomous_database" "db_oneway_tls_connection" {
  admin_password              = random_string.autonomous_database_admin_password.result
  compartment_id              = var.compartment_ocid
  cpu_core_count              = "1"
  data_storage_size_in_tbs    = "1"
  db_name                     = "adbOneWay"

  whitelisted_ips             = ["1.1.1.1"]
  is_mtls_connection_required    = "true"
}

resource "oci_database_autonomous_database" "dbms_status" {
  admin_password              = random_string.autonomous_database_admin_password.result
  compartment_id              = var.compartment_ocid
  cpu_core_count              = "1"
  data_storage_size_in_tbs    = "1"
  db_name                     = "adbdbms"
  database_management_status  = "ENABLED"
}
*/

// Per service, we need to pass in a back up that is at least 2 hours old
/*
resource "oci_database_autonomous_database" "db_from_backup" {
  #Required
  admin_password           = random_string.autonomous_database_admin_password.result
  compartment_id           = var.compartment_ocid
  cpu_core_count           = "1"
  data_storage_size_in_tbs = "1"
  db_name                  = "adbdb2"
  clone_type                    = "FULL"
  source                        = "BACKUP_FROM_ID"
  autonomous_database_backup_id = oci_database_autonomous_database_backup.autonomous_database_backup.id
}
resource "oci_database_autonomous_database" "db_from_backup_timestamp" {
  #Required
  admin_password           = random_string.autonomous_database_admin_password.result
  compartment_id           = var.compartment_ocid
  cpu_core_count           = "1"
  data_storage_size_in_tbs = "1"
  db_name                  = "adbdb3"
  clone_type             = "FULL"
  source                 = "BACKUP_FROM_TIMESTAMP"
  autonomous_database_id = oci_database_autonomous_database_backup.autonomous_database_backup.autonomous_database_id
  timestamp              = oci_database_autonomous_database_backup.autonomous_database_backup.time_ended
}
*/