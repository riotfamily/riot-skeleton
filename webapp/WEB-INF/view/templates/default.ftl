<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Riot Project Skeleton</title>
	<link rel="stylesheet" type="text/css" href="${common.resource('/css/07.grid.css')}" media="screen" />
	<link rel="stylesheet" type="text/css" href="${common.resource('/css/main.css')}" media="screen" />

	<@component.callbacks>
		addRiotEditCallback(function() {
			myLightbox.updateImageList();
		});
	</@component.callbacks>

	<#-- Txt2Img -->
    <@riot.script src="prototype/prototype.js" />
    <script src="${common.resource('/txt2img.html?locale=' + .locale)}" type="text/javascript"></script>

	<#-- Lightbox -->
	<@riot.script src="scriptaculous/effects.js" />
	<link href="${common.resource('/lightbox/css/lightbox.css')}" rel="stylesheet" type="text/css" media="screen" />
    <script type="text/javascript" src="${common.resource('/lightbox/js/lightbox.js')}"></script>
    <script>
    	fileLoadingImage = "${common.resource('/lightbox/images/loading.gif')}";
		fileBottomNavCloseImage = "${common.resource('/lightbox/images/closelabel.gif')}";
    </script>

</head>
<body>
<div id="container" class="container">
	<div id="header" class="header">
		<div class="padding">
			<h1>Header</h1>
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
			Powered by Riot
		</div>
	</div>
</div>

<@component.toolbar />
</body>
</html>
