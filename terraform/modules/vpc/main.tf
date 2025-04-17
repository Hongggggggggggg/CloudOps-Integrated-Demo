resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true

    tags = {
        Name = var.vpc_name
    }
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = var.public_azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
    count = length(var.private_subnets)
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private_subnets[count.index]
    availability_zone = var.private_azs[count.index]
    
    tags = {
        Name = "${var.vpc_name}-private-${count.index + 1}"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
  
    tags = {
        Name = "${var.vpc_name}-igw"
    }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

resource "aws_route_table_association" "public_rt_assoc" {
  count = length(aws_subnet.public)
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "public_sg" {
  name        = "${var.vpc_name}-public-sg"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["61.230.143.249/32"] # Replace with your IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-public-sg"
  }
}

resource "aws_security_group" "private_sg" {
  name        = "${var.vpc_name}-private-sg"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [aws_security_group.public_sg.id]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = [aws_security_group.public_sg.id]
  }

  ingress {
    from_port         = 443
    to_port           = 443
    protocol          = "tcp"
    self              = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-private-sg"
  }
}