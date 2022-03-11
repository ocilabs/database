# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

output "admin_password" {
  value = var.input.password == false ? random_string.admin_password.result : random_string.admin_password.result
}

output "connection_strings" {
  value = oci_database_autonomous_database.database[0].connection_strings[0].all_connection_strings
}

output "connection_urls" {
  value = oci_database_autonomous_database.database[0].connection_urls[0]
}

output "databases" {
  value = data.oci_database_autonomous_databases.database
}