		</div>
	</div>
</div>

<!-- MODAL -->

<div class="ui basic modal">
	<i class="close icon"></i>
	<div class="header">
		  Mudar imagem do perfil
	</div>
	<div class="content centered">
		<div class="sixteen wide collum">
				
			<div class="ui centered grid">
				<div class="one wide column fluid">
					<div id="load" class="ui hidden large inline loader centered"></div>
				</div>
			</div>
		
			<div id="content-acoes-image">
				<div id="imagem-crop"></div>
				
				<div class="ui centered grid">
					<div class="six wide column fluid">
					    <label for="upload" class="ui icon button fluid">
					        <i class="file icon"></i>
					        Abrir imagem
					    </label>
						<input id="upload" type="file" accept="image/*" name="" style="display:none"/>		
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<div id="bt-acoes-image" class="actions">
		<div class="two fluid ui buttons">
		    <div id="cancelar-modal" class="ui red basic button">
		      <i class="remove icon"></i>
		      Cancelar
		    </div>
		    <div id="bt-crop-imagem" class="ui green basic button">
		    	<i class="checkmark icon"></i>
		    	Salvar
		  	</div>
	  	</div>
	</div>
</div>

<script src="../js/jquery-2.2.1.min.js"></script>
<script src="../js/semantic.min.js"></script>
<script src="../js/croppie.min.js"></script>
<script src="../js/cropScript.js"></script>
<script src="../js/myScript.js"></script>