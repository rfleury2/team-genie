ngTeamGenie.controller('ngRosterCtrl', function ngRosterCtrl($scope, RosterRoutes, InviteRoutes, MembershipRoutes) {
	$scope.memberships = RosterRoutes.query();
	$scope.invites = InviteRoutes.query();

	$scope.addPlayer = function() {
		RosterRoutes.save({email: $scope.inviteEmail});
		$scope.refreshRoster();
	}	

	$scope.refreshRoster = function() {
		$scope.invites = InviteRoutes.query();
		$scope.memberships = RosterRoutes.query();
	}

	$scope.removeFromRoster = function(removedMembership) {
		RosterRoutes.remove({id: removedMembership.id});
		$scope.updateRoster(removedMembership);
	}

	$scope.updateRoster = function(removedMembership) {
		for (var i = 0; i < $scope.memberships.length; i++) { 
			if($scope.memberships[i].id === removedMembership.id) {
				$scope.memberships.splice(i, 1);
				// $scope.flash = "Player " + removedMembership.player.name + " removed from roster";
			}	
		}
	}
});