function checkSize() {
	if ($(window).width() >= 768) {
		$('.dropdown-toggle').addClass('disabled');
	} else {
		$('.dropdown-toggle').removeClass('disabled');
	}
}
checkSize();
$(window).resize(function() {
	checkSize();
});