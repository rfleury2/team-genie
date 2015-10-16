ngTeamGenie.controller('ngRosterCtrl', function ngRosterCtrl($scope, RosterRoutes, InviteRoutes) {
	var memberships = RosterRoutes.query()

	$scope.memberships = memberships

	$scope.invites = [
		{ email: 'hello@hello.com' },
		{ email: 'hello@hello.com' },
		{ email: 'hello@hello.com' }
	]
});