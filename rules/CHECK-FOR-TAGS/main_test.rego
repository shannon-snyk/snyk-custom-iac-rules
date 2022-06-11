package rules

import data.lib
import data.lib.testing

test_CHECK_FOR_TAGS {
	# array containing test cases where the rule is allowed
	allowed_test_cases := [{
		"want_msgs": [],
		"fixture": "allowed.json",
	}]

	# array containing cases where the rule is denied
	denied_test_cases := [{
		"want_msgs": ["input.resource.aws_s3_bucket[denied].tags"], # verifies that the correct msg is returned by the denied rule
		"fixture": "denied.json",
	}]

	test_cases := array.concat(allowed_test_cases, denied_test_cases)
	testing.evaluate_test_cases("CHECK-FOR-TAGS", "./rules/CHECK-FOR-TAGS/fixtures", test_cases)
}
