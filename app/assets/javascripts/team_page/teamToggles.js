
$(document).ready( function() {
	$(document).on('click', '#roster', function(e) {
		changeTabs(this)
	});

	$(document).on('click', '#games', function(e) {
		changeTabs(this)
	});

	$(document).on('click', '#settings', function(e) {
		changeTabs(this)
	});
});


function changeTabs(selectedTab) {
	if (!$(selectedTab).hasClass('active')) {
		var tabs = $('.team-nav')
		for(var i = 0; i < tabs.length; i++) {
			$(tabs[i]).removeClass('active')
		}
		$(selectedTab).addClass('active')
		clearContents()
	}
}

function clearContents() {
	$("#content").empty()
}