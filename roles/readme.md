> The `aws_emr_cluster` resource typically requires two IAM roles, one for the EMR Cluster to use as a service [i.e. a service role], and another to place on your Cluster Instances to interact with AWS from those instances [i.e. a role for the Amazon EC2 instance profile, which can be used to pass an IAM role to an EC2 instance] . The suggested role policy template for the EMR service is `AmazonElasticMapReduceRole`, and `AmazonElasticMapReduceforEC2Role` for the EC2 profile.

##### References
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/emr_cluster
- https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-iam-roles.html