


# this main.tf for creating VPC's peering connections

resource "aws_vpc_peering_connection" "peering-connection" {

    # if the peering connection in same account and same region means there is no need to add the peer-owner-id

  peer_vpc_id   = var.requester-vpc-id  # requester vpc
  vpc_id        = var.accepter-vpc-id  # accepter vpc
  auto_accept = true
  # (Optional) Accept the peering (both VPCs need to be in the same AWS account and region).
}