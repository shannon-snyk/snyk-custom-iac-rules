package rules

import data.lib
import data.lib.testing

test_S3_TAG {
	# array containing test cases where the rule is allowed
	allowed_test_cases := [{
		"want_msgs": [],
		"fixture": "allowed.tf",
	}]

	# array containing cases where the rule is denied
	denied_test_cases := [{
		"want_msgs": ["input.resource.aws_s3_bucket[test].tags"],
		"fixture": "denied.tf",
	}]

	test_cases := array.concat(allowed_test_cases, denied_test_cases)
	testing.evaluate_test_cases("S3-TAG", "./rules/S3-TAG/fixtures", test_cases)
}