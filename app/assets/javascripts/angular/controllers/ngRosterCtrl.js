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

	$scope.removeFromRoster = function(removedMembership) {
		MembershipRoutes.remove({id: removedMembership.id});
		$scope.updateRoster(removedMembership);
	}

	$scope.updateRoster = function(removedMembership) {
		for (var i = 0; i < $scope.memberships.length; i++) { 
			if($scope.memberships[i].id === removedMembership.id) {
				$scope.memberships.splice(i, 1);
				$scope.flash = "Player " + removedMembership.player.name + " removed from roster";
			}	
		}
	}
});