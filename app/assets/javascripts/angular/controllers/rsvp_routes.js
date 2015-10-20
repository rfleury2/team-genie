ngTeamGenie.factory('RsvpRoutes', function($resource) {
  return $resource(window.location.pathname + "/games/:game_id/rsvps/:id", { game_id: '@game_id', id: '@id' }, {
    update: {
      method: 'PUT' // this method issues a PUT request
    }
  });
});