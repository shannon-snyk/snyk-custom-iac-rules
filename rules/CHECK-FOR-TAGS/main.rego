package rules

# Example from Snyk Infrastructure as Code - Custom Rules
# Terraform tagging example for AWS S3 Resources
# All resources must have a:
# `Team` provided

deny[msg] {
	resource := input.resource.aws_s3_bucket[name]
	not resource.tags.Team

	msg := {
		"publicId": "CHECK-FOR-TAGS",
		"title": "Missing a tag for owning team",
		"severity": "critical",
		"issue": "There is no defined tag for the owning team",
		"impact": "Deployment will be blocked until this is resolved.",
		"remediation": "Set `aws_s3_bucket.tags.Team`",
		"msg": sprintf("input.resource.aws_s3_bucket[%s].tags", [name]),
		"references": [],
	}
}