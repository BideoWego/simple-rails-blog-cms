//=require application
//=require_tree ./frontend
//=require_self

(function($) {

	window.exports = [];
	window.exports["indent"] = function() {
		var prettyprinted = $('.prettyprinted li span:first-child');
		for (var i = 0; i < prettyprinted.length; i++) {
			var line = prettyprinted[i];
			var text = line.innerHTML;
			var indentationLevel = 0;
			for (var j = 0; j < text.length; j++) {
				var char = text[j];
				if (char != ' ')
					break;
				indentationLevel++;
			}
			if (indentationLevel > 0) {
				$(prettyprinted[i]).addClass('indent-' + indentationLevel);
			}
		}
	};

})(jQuery);