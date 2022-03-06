# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


output "autonomous_database_admin_password" {
  value = random_string.autonomous_database_admin_password.result
}

output "autonomous_database_high_connection_string" {
  value = lookup(
    oci_database_autonomous_database.autonomous_database.connection_strings[0],
    "high",
    "unavailable",
  )
}

output "autonomous_databases" {
  value = data.oci_database_autonomous_databases.autonomous_databases.autonomous_databases
}