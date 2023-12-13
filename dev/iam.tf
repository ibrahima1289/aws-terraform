# #Create a policy
# #https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy
# resource "aws_iam_policy" "ec2_policy" {
#   name        = "ec2-policy"
#   policy = jsonencode(
#         {
#             "Version": "2012-10-17",
#             "Statement": [{
#                     "Effect": "Allow",
#                     "Action": "ec2-instance-connect:SendSSHPublicKey",
#                     "Resource": "arn:aws:ec2:region:account-id:instance/*",
#                     "Condition": {
#                         "StringEquals": {
#                             "aws:ResourceTag/tag-key": "dev"
#                         }
#                     }
#                 },
#                 {
#                     "Effect": "Allow",
#                     "Action": "ec2:DescribeInstances",
#                     "Resource": "*"
#                 }
#             ]
#         }
#   )
# }

# # Enable EC2 Instance Connect iam role
# resource "aws_iam_role" "ec2_role" {
#   name = "ec2-role"
#   assume_role_policy = jsonencode(
#         {
#             Version : "2012-10-17",
#             Statement : [
#                 {
#                     Sid : "EC2InstanceConnect",
#                     Action : [
#                         "ec2:DescribeInstances",
#                         "ec2-instance-connect:SendSSHPublicKey"
#                     ],
#                     "Effect" : "Allow",
#                     "Resource" : "*"
#                 }
#             ]
#         }
#     )
# }

# resource "aws_iam_role_policy_attachment" "ec2_role_attachment" {
#   policy_arn = "arn:aws:iam::aws:policy/EC2InstanceConnect"
#   role = aws_iam_role.ec2_role.name
# }

# resource "aws_iam_instance_profile" "ec2_profile" {
#     name = "ec2-profile"
#     role = aws_iam_role.ec2_role.name
# }
