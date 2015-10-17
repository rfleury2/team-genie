ngTeamGenie.controller('ngGamesCtrl', function NgGamesCtrl($scope, GamesRoutes) {
	// GET - INDEX
  var allGames = GamesRoutes.query();
	$scope.games = allGames;

	// POST - CREATE
	$scope.addGame = function() {
		var newlyCreatedGame = GamesRoutes.save({time: $scope.newGame.time})
		$scope.games.push(newlyCreatedGame)
	}

	// DELETE - DELETE
	$scope.deleteGame = function(game) {
		GamesRoutes.remove(game)
		// TODO: Add "if successful logic"
		$scope.updateGames(game)
	}

	$scope.updateGames = function(removedGame) {
		for (var i = 0; i < $scope.games.length; i++) { 
			if($scope.games[i].id === removedGame.id) {
				$scope.games.splice(i, 1)
			}
    	
		}

	}
});