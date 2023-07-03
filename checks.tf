check "check_fakewebservices_database_size" {
  assert {
    condition = fakewebservices_database.database.size != 128
    error_message = format("All database resources should have a database size of '128'. Got %s instead.",
      fakewebservices_database.database.size
    )
  }
}
