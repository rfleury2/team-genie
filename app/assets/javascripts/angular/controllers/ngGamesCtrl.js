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

	$scope.toggleDelete = function(game) {
		game.deleteMode = !game.deleteMode
	}

	
	////////////   RSVP   //////////////
	$scope.toggleRsvps = function(game) {
		gameIndex = $scope.games.indexOf(game);
		if($scope.games[gameIndex].active) {
			$scope.games[gameIndex].active = false;
			return
		} else {
			$scope.getRsvps(game.id)
		}

	}

	// RSVP index
	$scope.getRsvps = function(gameId) {
		rsvps = RsvpRoutes.query({ gameId: gameId });
		for (var i = 0; i < $scope.games.length; i++) { 
			if($scope.games[i].id === gameId) {
				$scope.games[i].rsvps = rsvps;
				$scope.games[i].active = true;
				return;
			}	
		}
	}
});
