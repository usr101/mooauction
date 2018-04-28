var matchCustom = function(params, data) {
    // If there are no search terms, return all of the data
    if ($.trim(params.term) === '') {
      return data;
    }

    // Do not display the item if there is no 'text' property
    if (typeof data.text === 'undefined') {
      return null;
    }

    // `params.term` should be the term that is used for searching
    // `data.text` is the text that is displayed for the data object
    //if (data.text.indexOf(params.term) > -1) {
   	if (data.text.substring(0, params.term.length) === params.term) {
      var modifiedData = $.extend({}, data, true);
      //modifiedData.text += ' (matched)';

      // You can return modified objects from here
      // This includes matching the `children` how you want in nested data sets
      return modifiedData;
    }

    // Return `null` if the term should not be displayed
    return null;
}

var do_on_load = function() {
	$("#bid_buyer_ids").select2({
		theme: "bootstrap",
		width: '100%',
		matcher: matchCustom
	});
};

$(document).on('turbolinks:load', do_on_load)