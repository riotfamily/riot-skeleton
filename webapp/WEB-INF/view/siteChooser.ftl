<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Riot Project Skeleton</title>
	<@c.stylesheets [
		"/style/yui.reset.css",
		"/style/grid.css",
		"/style/main.css"
	] />
	
	<@c.txt2img />
</head>
<body>
<div id="container" class="container">
	<div id="header" class="header">
		<div class="padding">
			
		</div>
	</div>
	<div id="wrapper" class="wrapper">					
		<div style="margin-left: 174px">
			<h1><@c.message "choose.site">Choose your Site</@c.message></h1>
			<ul class="country-chooser">
				<#list sites as site>
					<li style="background-image:url(${c.urlForHandler('countryFlagController', site)})">
						<a href="${c.url(site.makeAbsolute(""))}/">${site.name!}</a>
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
