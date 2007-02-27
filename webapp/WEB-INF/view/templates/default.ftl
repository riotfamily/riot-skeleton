<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Riot Project Skeleton</title>
	<link rel="stylesheet" type="text/css" href="${stamp('/css/' + springMacroRequestContext.theme.name +'.grid.css')}" title="grid01" media="screen" />
	<link rel="stylesheet" type="text/css" href="${stamp('/css/main.css')}" media="screen" />
	
	<#-- 
	  - JavaScripts for the gallery component. These can be removed if you 
	  - don't want to use Lightbox. We use the prototype and scriptaculous 
	  - versions provided by Riot to avoid conflicts.
	  -->
	<link rel="stylesheet" href="${stamp('/css/lightbox.css')}" type="text/css" media="screen" />
	<script type="text/javascript" src="${stamp('/riot/resources/latest/prototype/prototype.js')}"></script>
	<script type="text/javascript" src="${stamp('/riot/resources/latest/scriptaculous/effects.js')}"></script>
	<script type="text/javascript" src="${stamp('/js/lightbox.js')}"></script>
	
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
				<@riot.include content />
			</div>
		</div>
	</div>
	<div id="navigation" class="navigation">
		<div class="padding">
			<@riot.include navigation />
		</div>
	</div>
	<div id="extra" class="extra">
		<div class="padding">
			<@riot.include extra />
		</div>
	</div>
	<div id="footer" class="footer">
		<div class="padding">
			<p>Powered by Riot</p>
			<form action="?" method="get">
			<select name="theme" onchange="this.form.submit()">
				<#list 1..40 as theme>
					<option value="${theme?string('00')}">${theme?string('00')}</option>
				</#list>
			</select>
			</form>
		</div>
	</div>
</div>

<@riot.toolbar />
</body>
</html>
