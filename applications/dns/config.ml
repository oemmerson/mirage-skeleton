open Mirage

let timeout = Runtime_key.create "Key.timeout"
let nameservers = Runtime_key.create "Key.nameservers"
let unikernel = foreign "Unikernel.Make" (dns_client @-> job)
let stackv4v6 = generic_stackv4v6 default_network

let () =
  register "resolve"
    [ unikernel $ generic_dns_client ~timeout ~nameservers stackv4v6 ]
