<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Riot Project Skeleton</title>

	<link rel="stylesheet" type="text/css" href="${common.resource('/style/yui/reset/reset.css')}" /> 
	<link rel="stylesheet" type="text/css" href="${common.resource('/style/yui/base/base.css')}" />
	
	<link rel="stylesheet" type="text/css" href="${common.resource('/style/layout/07.grid.css')}" />
	<link rel="stylesheet" type="text/css" href="${common.resource('/style/main.css')}" />

	<#-- Txt2Img -->
    <@riot.script src="prototype/prototype.js" />
    <script src="${common.resource('/riot-utils/txt2img.js')}" type="text/javascript"></script>
</head>
<body>
<div id="container" class="container">
	<div id="header" class="header">
		<div class="padding">
			
		</div>
	</div>
	<div id="wrapper" class="wrapper">					
		<div style="margin-left: 174px">
			<h1><@common.message "choose.site" , [], "Choose your Site"/></h1>
			<ul class="country-chooser">
				<#list sites as site>
					<li style="background-image:url(${common.urlForHandler('countryFlagController', site)})">
						<a href="${common.url(site.getAbsoluteUrl(request))}/">${site.name!}</a>
					</li>
				</#list>
			</ul>		
		</div>			
	</div>	
	<div id="footer" class="footer">
		<div class="padding">
			<span class="poweredby">Powered by</span><span class="riot">Riot</span>
		</div>
	</div>
</div>

</body>
</html>
