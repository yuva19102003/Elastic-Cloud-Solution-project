

# vpc.tf contains vpc's cidr block , private subnet , public subnet and internet gateway


# creating vpc cidr block

resource "aws_vpc" "main" {
  cidr_block = var.vpc-cidr-block
  tags = {
    Name = var.vpc-name
  }

}


# creating public subnet 

resource "aws_subnet" "public-subnet" {

    vpc_id = aws_vpc.main.id

    count    = length(var.public-subnet-cidr-block)
    cidr_block = var.public-subnet-cidr-block[count.index]
    availability_zone = var.subnet-az[count.index]

    map_public_ip_on_launch = true

    tags = {
      Name = "${var.vpc-name}-public-subnet-${var.subnet-az[count.index]}"
    }
}


# creating private subnet

resource "aws_subnet" "private-subnet" {

    vpc_id = aws_vpc.main.id

    count    = length(var.private-subnet-cidr-block)
    cidr_block = var.private-subnet-cidr-block[count.index]
    availability_zone = var.subnet-az[count.index]

    map_public_ip_on_launch = false

    tags = {
      Name = "${var.vpc-name}-private-subnet-${var.subnet-az[count.index]}"
    }
}

# Creating Internet Gateway 

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.vpc-name}-internet-gateway"
  }
}

