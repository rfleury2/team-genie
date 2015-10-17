ngTeamGenie.controller('ngRosterCtrl', function ngRosterCtrl($scope, RosterRoutes, InviteRoutes, MembershipRoutes) {
	// var memberships = ;
	$scope.memberships = RosterRoutes.query();

	// var invites = ;
	$scope.invites = InviteRoutes.query();

	$scope.addPlayer = function() {
		MembershipRoutes.save({email: $scope.inviteEmail});
		$scope.refreshRoster();
	}	

	$scope.refreshRoster = function() {
		$scope.invites = InviteRoutes.query();
		$scope.memberships = RosterRoutes.query();
	}
});