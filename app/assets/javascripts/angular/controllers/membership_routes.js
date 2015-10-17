ngTeamGenie.factory('MembershipRoutes', function($resource) {
  return $resource(window.location.pathname + "/memberships/:id", { id: '@id' }, {
    update: {
      method: 'PUT' // this method issues a PUT request
    }
  });
});