ngTeamGenie.controller('ngTeamTabsCtrl', function NgTeamTabsCtrl($scope) {
	$scope.changeTab = function(selectedTab) {
		// TODO: Find an angular way of doing this jQuery stuff
		var teamTabs = $(".team-tab");
		for (var i = 0; i < teamTabs.length; i++) {
			$(teamTabs[i]).removeClass('active')
		}
		$("#" + selectedTab).addClass('active')
	}

	$scope.isActive = function(parentTab) {
		return $("#" + parentTab).hasClass('active')
	}
});