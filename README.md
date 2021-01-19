# Terraform Ambassador Endpoints

Create the necessary CRDs to serve a service via Ambassador using Terraform.

Each "instance" of this module will create a single `Host`, `Mapping` and an optional `TLSContext`
for `Mapping` TLS origination. This greatly simplifies the module.

If your service serves multiple hosts, create multiple instances of this module with `for_each`.
