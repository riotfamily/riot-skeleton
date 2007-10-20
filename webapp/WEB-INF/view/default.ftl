<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Riot Project Skeleton</title>

	<link rel="stylesheet" type="text/css" href="${common.resource('/style/yui/reset/reset.css')}" /> 
	<link rel="stylesheet" type="text/css" href="${common.resource('/style/yui/base/base.css')}" />
	
	<link rel="stylesheet" type="text/css" href="${common.resource('/style/layout/07.grid.css')}" />
	<link rel="stylesheet" type="text/css" href="${common.resource('/style/main.css')}" />

	<@inplace.callbacks>
		addRiotEditCallback(function() {
			myLightbox.updateImageList();
		});
	</@inplace.callbacks>

	<#-- Txt2Img -->
    <@riot.script src="prototype/prototype.js" />
    <script src="${common.resource('/riot-utils/txt2img.js?locale=' + .locale)}" type="text/javascript"></script>

	<#-- Lightbox -->
	<@riot.script src="scriptaculous/effects.js" />
	<link href="${common.resource('/style/lightbox/css/lightbox.css')}" rel="stylesheet" type="text/css" media="screen" />
    <script type="text/javascript" src="${common.resource('/style/lightbox/js/lightbox.js')}"></script>
    <script>
    	fileLoadingImage = "${common.resource('/style/lightbox/images/loading.gif')}";
		fileBottomNavCloseImage = "${common.resource('/style/lightbox/images/closelabel.gif')}";
    </script>

</head>
<body>
<div id="container" class="container">
	<div id="header" class="header">
		<div class="padding">
			<@common.include header />
		</div>
	</div>
	<div id="wrapper" class="wrapper">
		<div id="content" class="content">
			<div class="padding">
				<@common.include content />
			</div>
		</div>
	</div>
	<div id="navigation" class="navigation">
		<div class="padding">
			<@common.include navigation />
		</div>
	</div>
	<div id="extra" class="extra">
		<div class="padding">
			<@common.include extra />
		</div>
	</div>
	<div id="footer" class="footer">
		<div class="padding">
			<span class="poweredby">Powered by</span><span class="riot">Riot</span>
		</div>
	</div>
</div>

<@inplace.toolbar />
</body>
</html>
