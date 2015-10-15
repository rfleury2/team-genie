ngTeamGenie.controller('ngRosterCtrl', function ngRosterCtrl($scope) {
	$scope.players = [
		{ name: 'Chuck', email: 'hello@hello.com', amount_owed: 1 },
		{ name: 'Carlos', email: 'hello@hello.com', amount_owed: 42.2 },
		{ name: 'Charlie', email: 'hello@hello.com', amount_owed: 300 }
	]

	$scope.invites = [
		{ email: 'hello@hello.com' },
		{ email: 'hello@hello.com' },
		{ email: 'hello@hello.com' }
	]
});