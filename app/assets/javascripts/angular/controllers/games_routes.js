ngTeamGenie.factory('GamesRoutes', function($resource) {
  return $resource(window.location.pathname + "/games/:id", { id: '@id' }, {
    update: {
      method: 'PUT' // this method issues a PUT request
    }
  });
});