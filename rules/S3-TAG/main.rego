package rules

deny[msg] {
	resource := input.resource.aws_s3_bucket[name]
	not resource.tags
	msg := {
		# Mandatory fields
		"publicId": "S3-TAG",
		"title": "No S3 tags",
		"severity": "critical",
		"msg": sprintf("input.resource.aws_s3_bucket[%s].tags", [name]), # must be the JSON path to the resource field that triggered the deny rule
		# Optional fields
		"issue": "",
		"impact": "",
		"remediation": "",
		"references": [],
	}
}
