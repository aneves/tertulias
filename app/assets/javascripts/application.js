// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function () {
	$("#contributions table").addClass("tablesorter").tablesorter();
	$('.collapsable>*:first-child').on('click', function() {
		$(this).parent().toggleClass('collapsed');
	});
	// TODO: No browser supports this yet. But we should check with Modernizr either way.
	$('input[type=datetime]').datetimepicker();
});
