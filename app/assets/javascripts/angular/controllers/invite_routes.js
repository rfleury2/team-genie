ngTeamGenie.factory('InviteRoutes', function($resource) {
  return $resource(window.location.pathname + "/invites", {}, {
    update: {
      method: 'PUT' // this method issues a PUT request
    }
  });
});