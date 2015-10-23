ngTeamGenie.controller('ngRsvpCtrl', function ngRsvpCtrl($scope, RsvpRoutes) {
	$scope.rsvps = RsvpRoutes.query({ gameId: $scope.game.id })

	$scope.updateRsvp = function(newResponse, newComment) {
		RsvpRoutes.update(
			{ gameId: $scope.game.id, id: $scope.rsvp.id, rsvp: { response: newResponse, comment: newComment } }
		);
		$scope.rsvp.response = newResponse;
		$scope.rsvp.comment = newComment;
		$scope.toggleEditing();
	}

	$scope.toggleEditing = function() {
		console.log('gets called')
		$scope.editingMode = !$scope.editingMode
	}
});
