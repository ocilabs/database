# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

output "autonomous_database_admin_password" {
  value = var.input.password == false ? random_string.admin_password.result : random_string.admin_password.result
}

output "autonomous_database_high_connection_string" {
  value = oci_database_autonomous_database.database.connection_strings[0]
}

output "databases" {
  value = data.oci_database_autonomous_databases.database
}