$(document).ready(function(){
	
	uploadImagem();
	
});


function uploadImagem() {
	var $uploadCrop;

	function readFile(input) {
			if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            
	            reader.onload = function (e) {
	            	$uploadCrop.croppie('bind', {
	            		url: e.target.result
	            	});
	            	$('.upload-demo').addClass('ready');
	            }
	            
	            reader.readAsDataURL(input.files[0]);
	        }
	        else {
		        swal("Sorry - you're browser doesn't support the FileReader API");
		    }
	}

	$uploadCrop = $('#imagem-crop').croppie({
		viewport: {
			width: 200,
			height: 200,
		},
		boundary: {
			width: 300,
			height: 300
		},
		exif: true
	});

	$('#upload').on('change', function () { readFile(this); console.log("upload chaged") });
	$('#bt-crop-imagem').on('click', function (ev) {
		$uploadCrop.croppie('result', {
			type: 'canvas',
			size: 'viewport'
		}).then(function (resp) {
			
			salvaImagemAjax(resp);
			
			console.log("? " + resp);
		});
	});
}

function salvaImagemAjax(image){
	
	$.ajax({
	  url: "mudarImagemAction",
	  method: "POST",
	  data: { "pessoa.imagem" : image },
	  dataType: "image"
	
	}).done(function( msg ) {
		console.log("OK " + msg);
	
	}).fail(function( jqXHR, textStatus ) {
		console.log("Request failed: " + jqXHR );
		console.log("Request failed: " + textStatus );
	});
}









