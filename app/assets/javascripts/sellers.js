var do_on_load = function() {
	$("#seller_buyer_ids").multiselect({enableFiltering: true});
};

$(document).ready(do_on_load);
$(window).bind('page:change', do_on_load);