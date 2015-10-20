ngTeamGenie.factory('RsvpRoutes', function($resource) {
  return $resource(window.location.pathname + "/games/:gameId/rsvps/:id", { gameId: '@gameId', id: '@id' }, {
    update: {
      method: 'PUT' // this method issues a PUT request
    }
  });
});