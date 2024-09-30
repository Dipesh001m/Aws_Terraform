
# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "15.0.0.0/16"
  tags = {
    Name = "my_vpc"
  }
}

#  Private Subnet
resource "aws_subnet" "Private-Subnet" {
  cidr_block = "15.0.1.0/24"
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "private-subnet"
  }
}

#  Public Subnet
resource "aws_subnet" "Public-Subnet" {
  cidr_block = "15.0.2.0/24"
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "public-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my-igw"
  }
}

# Routing table
resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.my_vpc.id
  route  {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }
}

resource "aws_route_table_association" "Public-sub" {
  route_table_id = aws_route_table.my-rt.id
  subnet_id = aws_subnet.Public-Subnet.id
}