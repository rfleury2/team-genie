ngTeamGenie.controller('ngGamesCtrl', function NgGamesCtrl($scope, GamesRoutes, RsvpRoutes) {
	// GET - INDEX
  $scope.games = GamesRoutes.query();

	// POST - CREATE
	$scope.addGame = function() {
		var newlyCreatedGame = GamesRoutes.save({time: $scope.newGame.time});
		$scope.games.push(newlyCreatedGame);
	}

	// DELETE - DELETE
	$scope.deleteGame = function(game) {
		GamesRoutes.remove(game)
		$scope.updateGames(game);
		// TODO: Add "if successful logic"
	}

	$scope.updateGames = function(game) {
		for (var i = 0; i < $scope.games.length; i++) { 
			if($scope.games[i].id === game.id) {
				$scope.games.splice(i, 1);
			}	
		}
	}

	// RSVP index
	$scope.getRsvps = function(game_id) {
		rsvps = RsvpRoutes.query({ game_id: game_id });
		for (var i = 0; i < $scope.games.length; i++) { 
			if($scope.games[i].id === game_id) {
				$scope.games[i].rsvps = rsvps;
			}	
		}

	}
});