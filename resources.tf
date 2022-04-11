# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

resource "oci_database_autonomous_database" "database" {
  compartment_id           = data.oci_identity_compartments.database.compartments[0].id
  count                    = local.adb_count
  cpu_core_count           = var.input.database.cores
  data_storage_size_in_tbs = var.input.database.storage
  db_name                  = var.input.database.name
  admin_password           = var.input.service.stage < 2 ? var.assets.encryption.passwords[var.input.database.password] : base64decode(data.oci_secrets_secretbundle.database.secret_bundle_content.0.content)
  db_version               = var.input.database.version
  display_name             = var.input.database.display_name
  db_workload              = var.input.database.type
  is_free_tier             = var.schema.class == "FREE_TIER" ? true : false
  license_model            = var.input.database.license
  defined_tags             = var.assets.resident.defined_tags
  freeform_tags            = var.assets.resident.freeform_tags
}