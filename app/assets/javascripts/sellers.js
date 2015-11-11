var do_on_load = function() {
	$("#seller_buyer_ids").select2({
		theme: "bootstrap",
		width: '100%'
	});
};

$(document).ready(do_on_load);
$(window).bind('page:change', do_on_load);