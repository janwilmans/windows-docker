(function( $ ) {
	'use strict';
	$( window ).load(function() {
		var SCB = $('.wp-block-simple-code-block-ace');
		if ( SCB.length > 0 ) {
			SCB.each( function( index ){
				var codeElement = $( this ), editor = ace.edit( codeElement[0] );
					editor.setTheme( 'ace/theme/' + codeElement.data('theme') );
					editor.session.setMode( 'ace/mode/' + codeElement.data('mode') );
					editor.setFontSize( codeElement.data('fontsize') );
					editor.setOptions({
						readOnly: true,
						useWorker: false,
						showPrintMargin: false,
						autoScrollEditorIntoView: true,
						maxLines: codeElement.data('lines'),
						highlightActiveLine: false,
						highlightGutterLine: false
					});
					editor.renderer.$cursorLayer.element.style.opacity = 0;
			});
		}
 	});
})( jQuery );
