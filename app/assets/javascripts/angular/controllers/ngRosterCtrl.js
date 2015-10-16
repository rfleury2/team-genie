ngTeamGenie.controller('ngRosterCtrl', function ngRosterCtrl($scope, RosterRoutes, InviteRoutes) {
	var memberships = RosterRoutes.query()
	$scope.memberships = memberships

	var invites = InviteRoutes.query()
	$scope.invites = invites
});