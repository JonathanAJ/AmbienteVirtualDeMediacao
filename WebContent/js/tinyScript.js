$(document).ready(function(){
	inicializaTiny();
});

function inicializaTiny(){
	tinymce.init({
	    selector: '#meuEditor',
	    theme: 'modern',
	    skin: 'custom',
	    height: 340,
	    content_css: '../css/semantic.min.css',
	    menubar: false,
	    statusbar: false,
	    toolbar: 'undo redo | fontsizeselect | bold italic underline | alignleft, aligncenter, alignright, alignjustify | bullist,  blockquote'
	  });
}