$(document).ready(function(){
	inicializaTiny();
});

function inicializaTiny(){
	tinymce.init({
	    selector: '#meuEditor',
	    theme: 'modern',
	    skin: 'custom',
	    plugins: "paste",
	    paste_data_images: false,
	    paste_as_text: true,
	    paste_word_valid_elements: "b,strong,i",
	    height: 280,
	    content_css: '../css/semantic.min.css',
	    menubar: false,
	    statusbar: false,
	    toolbar: 'undo redo | bold italic underline | blockquote'
	  });
}