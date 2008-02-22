<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Riot Project Skeleton</title>

	<link rel="stylesheet" type="text/css" href="${common.resource('/style/yui/reset/reset.css')}" /> 
	<link rel="stylesheet" type="text/css" href="${common.resource('/style/layout/07.grid.css')}" />
	<link rel="stylesheet" type="text/css" href="${common.resource('/style/main.css')}" />

	<@inplace.callbacks>
		// Register a callback that is invoked when an element is updated,
		// to update Shadowbox links contained in this element.
		addRiotEditCallback(function(el) {
			Shadowbox.clearCache();
			Shadowbox.setup();
		});
	</@inplace.callbacks>

	<#--
	  - NOTE: Though the Riot toolbar uses prototype.js and scriptaculous 
	  - internally you don't have to load these libraries manually, unless
	  - you want to use either Txt2Img or Shadowbox. 
	  -->

	<#-- Txt2Img -->
    <@riot.script src="prototype/prototype.js" />
    <script src="${common.resource('/riot-utils/txt2img.js?locale=' + .locale)}" type="text/javascript"></script>

	<#-- Shadowbox (see http://mjijackson.com/shadowbox) -->
	<link href="${common.resource('/style/shadowbox/css/shadowbox.css')}" rel="stylesheet" type="text/css" media="screen" />
	<@riot.script src="scriptaculous/effects.js" />
    <script type="text/javascript" src="${common.resource('/style/shadowbox/js/adapter/shadowbox-prototype.js')}"></script>
    <script type="text/javascript" src="${common.resource('/style/shadowbox/js/shadowbox.js')}"></script>
    <script type="text/javascript">
		document.observe('dom:loaded', function() {
			Shadowbox.init({
				assetURL: '${request.contextPath}/style/shadowbox/',
				fadeDuration: 0.15,
				resizeDuration: 0.15
			})
		});
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
