# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

resource "oci_database_autonomous_database" "database" {
  depends_on = [
    data.oci_identity_compartments.database,
    data.oci_secrets_secretbundle.database
  ]
  compartment_id           = data.oci_identity_compartments.database.compartments[0].id
  count                    = local.adb_count
  cpu_core_count           = var.configuration.database.cores
  data_storage_size_in_tbs = var.configuration.database.storage
  db_name                  = var.configuration.database.name
  admin_password           = var.options.password == "RANDOM" ? var.assets.encryption.passwords[var.configuration.database.password] : base64decode(data.oci_secrets_secretbundle.database.secret_bundle_content.0.content)
  db_version               = var.configuration.database.version
  display_name             = var.configuration.database.display_name
  db_workload              = var.configuration.database.type
  is_free_tier             = var.options.class == "FREE_TIER" ? true : false
  license_model            = var.configuration.database.license
  defined_tags             = var.assets.resident.defined_tags
  freeform_tags            = local.module_freeform_tags
}