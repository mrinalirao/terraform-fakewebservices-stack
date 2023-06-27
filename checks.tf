check "check_fakewebservices_load_balancer_id" {
  assert {
    condition = fakewebservices_load_balancer.load_balancer.id == "fakelb-Adg9MsKzvygbgTj7"
    error_message = format("The fakewebservices_load_balancer resource should have %s assigned as the unique identifier. Got %s instead.",
      "fakelb-Adg9MsKzvygbgTj7",
      fakewebservices_load_balancer.load_balancer.id
    )
  }
}

check "check_for_leaks" {
  assert {
    condition = fakewebservices_load_balancer.load_balancer.id == "foo"
    error_message = format("Leaking variable value %s.",
      var.fake_token
    )
  }
}
