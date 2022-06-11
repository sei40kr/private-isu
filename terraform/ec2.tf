resource "aws_eip" "private_isu" {
  instance = aws_instance.private_isu.id
  vpc      = true
}

resource "aws_eip" "private_isu_bench" {
  instance = aws_instance.private_isu_bench.id
  vpc      = true
}

resource "aws_instance" "private_isu" {
  ami                    = "ami-0b37d5c92add6d0d5"
  availability_zone      = "ap-northeast-1a"
  instance_type          = "c4.large"
  key_name               = aws_key_pair.private_isu.key_name
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.private_isu.id]

  tags = {
    Owner = "private-isu"
  }
}

resource "aws_instance" "private_isu_bench" {
  ami                    = "ami-024cfcacc753fa53e"
  availability_zone      = "ap-northeast-1a"
  instance_type          = "c5.xlarge"
  key_name               = aws_key_pair.private_isu.key_name
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.private_isu_bench.id]

  tags = {
    Owner = "private-isu"
  }
}

resource "aws_key_pair" "private_isu" {
  key_name   = "private-isu"
  public_key = var.ssh_public_key
}