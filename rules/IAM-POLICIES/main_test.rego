package rules

import data.lib
import data.lib.testing

test_IAM_POLICIES {
	# array containing test cases where the rule is allowed
	allowed_test_cases := [{
		"want_msgs": [],
		"fixture": "allowed.json",
	}]

	# array containing cases where the rule is denied
	denied_test_cases := [{
		"want_msgs": ["input.Resources[_].Properties.PolicyDocument.Statement[_].Action[sqs:CreateQueue]"], # verifies that the correct msg is returned by the denied rule
		"fixture": "denied.json",
	}]

	test_cases := array.concat(allowed_test_cases, denied_test_cases)
	testing.evaluate_test_cases("IAM-POLICIES", "./rules/IAM-POLICIES/fixtures", test_cases)
}
