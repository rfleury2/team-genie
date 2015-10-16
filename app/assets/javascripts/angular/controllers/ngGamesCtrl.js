ngTeamGenie.controller('ngGamesCtrl', function NgGamesCtrl($scope, GamesRoutes) {
	// GET - INDEX
  var allGames = GamesRoutes.query();
	$scope.games = allGames;

	// POST - CREATE
	$scope.addGame = function() {
		var newlyCreatedGame = GamesRoutes.save({time: $scope.newGame.time})
		$scope.games.push(newlyCreatedGame)
	}

	// PUT - UPDATE
	$scope.editGame = function() {
		
	}

	// DELETE - DELETE
	$scope.deleteGame = function() {

	}
});