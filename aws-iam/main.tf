#IAM user creation
resource "aws_iam_user" "User1" {
  name = "user1"
  path = "/"
}

#policy creation
resource "aws_iam_policy" "policy1" {
  name = "policy1"
  description = "This is policy1"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "s3:GetObject"
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = "s3:fullcontrol"
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = "EC2:fullcontrol"
        Resource = "*"
      }
    ]
  })
}

#policy attachment to user
resource "aws_iam_user_policy_attachment" "policy1" {
    user = aws_iam_user.User1.name
    policy_arn = aws_iam_policy.policy1.arn
  
}

#Group creation
resource "aws_iam_group" "Devs"{
   name = "Devs"
   path = "/"
}

#user attachment to group
resource "aws_iam_group_membership" "Devs_Members" {
  name = "Devs Members"

    users = [
        aws_iam_user.User1.name
    ]
    group = aws_iam_group.Devs.name
    

}