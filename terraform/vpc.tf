resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.private_isu.id

  tags = {
    Owner = "private-isu"
  }
}

resource "aws_route_table" "public" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public.id
  }

  vpc_id = aws_vpc.private_isu.id

  tags = {
    Owner = "private-isu"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "private_isu" {
  ingress {
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  vpc_id = aws_vpc.private_isu.id

  tags = {
    Owner = "private-isu"
  }
}

resource "aws_security_group" "private_isu_bench" {
  ingress {
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  vpc_id = aws_vpc.private_isu.id

  tags = {
    Owner = "private-isu"
  }
}

resource "aws_subnet" "public" {
  availability_zone = "ap-northeast-1a"
  cidr_block        = "172.30.0.0/24"
  vpc_id            = aws_vpc.private_isu.id

  tags = {
    Owner = "private-isu"
  }
}

resource "aws_subnet" "private" {
  availability_zone = "ap-northeast-1a"
  cidr_block        = "172.30.1.0/24"
  vpc_id            = aws_vpc.private_isu.id

  tags = {
    Owner = "private-isu"
  }
}

resource "aws_vpc" "private_isu" {
  cidr_block = "172.30.0.0/16"

  tags = {
    Owner = "private-isu"
  }
}
