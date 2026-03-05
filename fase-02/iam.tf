# Role

resource "aws_iam_role" "terraform-role" {
  name = "terraform-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# Policy

resource "aws_iam_role_policy_attachment" "ecr-policy" {
  role       = aws_iam_role.terraform-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

# Instance Profile

resource "aws_iam_instance_profile" "ec2-profile" {
  name = "ec2-profile"
  role = aws_iam_role.terraform-role.name
}