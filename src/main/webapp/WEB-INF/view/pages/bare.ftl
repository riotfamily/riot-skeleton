<#--
  Bare template that defines a simple layout with 5 blocks: header, 
  navigation, content, extra and footer.
  
  The @template.root macro must be used, so that other templates can extend
  this file:
-->
<@template.root>
<!DOCTYPE html>
<html>
<head>
	<#-- 
	  Templates that extend bare.ftl can set a title:
	-->
	<#if template.vars.title??>
		<title>${template.vars.title}</title>
	</#if>
	
	<#-- 
	  The @c.stylesheets macro joins all files into one and compresses it
	  using the YUI compressor.
	  
      The "main_<theme>.css" file is dynamic ands reads CSS constants 
	  from the css.ini file. Hence the page will use a different color theme
	  depending on the "theme" property of the current site.
	-->
	<@c.stylesheets [
		"/style/yui.reset.css",
		"/style/grid.css",
		"/style/main_" + ((currentSite.theme)!"default") + ".css"
	] />

</head>
<body class="${template.vars.bodyClass!"default"} noscript">

	<#--
	  The @c.removeNoscriptClass macro emits a script block that removes
	  the "noscript" class from the body tag. This way you can define
	  CSS rules that only match if scripts are enabled or disabled.
	-->
	<@c.removeNoscriptClass />
	
	<#--
	  Some structural DIVs with empty template blocks inside. These blocks
	  are filled with content by other templates that extend this one, for
	  example default.ftl.  
	-->
	<div id="container" class="container">
		<div id="header" class="header">
			<div class="padding">
				<@template.block name="header" />
			</div>
		</div>
		<div id="wrapper" class="wrapper">
			<div id="content" class="content">
				<div class="padding">
					<@template.block name="content" />
				</div>
			</div>
		</div>
		<div id="navigation" class="navigation">
			<div class="padding">
				<@template.block name="navigation" />
			</div>
		</div>
		
		<#--
		  The template structure can depend on template vars. In this example
		  the extra column is only rendered, when the bodyClass is not set to "wide".
		-->
		<#if template.vars.bodyClass! != "wide">
			<div id="extra" class="extra">
				<div class="padding">
					<@template.block name="extra" />
				</div>
			</div>
		</#if>
		
		
		<div id="footer" class="footer">
			<div class="padding">
				<span class="poweredby">Powered by</span><span class="riot">Riot</span>
				${statics["java.lang.System"].currentTimeMillis()}
			</div>
		</div>
	</div>
	
	<#--
	  Sites can have arbitrary properties, just like pages. To edit these 
	  properties, a corresponding form must be defined in 
	  WEB-INF/content-forms.xml. Take a look at that file and you
	  will see a form called "all-sites" which contains a textfield to enter
	  a Google Analytics Code (used below) and a drop-down to select a theme,
	  which is used at the top of this template to include a parameterized
	  main.css file. 
	-->
	
	<#if (currentSite.googleAnalyticsCode)??>
	<#--
	Asynchronous Google Analytics snippet. 
	@see for documentation as well as optimization 
		 http://mathiasbynens.be/notes/async-analytics-snippet
	-->
	<script>
	var _gaq = [];
	_gaq.push(['_setAccount', '${currentSite.theme.googleAnalyticsCode}']);
	<#-- Anonymizing ip data -->
	_gaq.push(['_gat._anonymizeIp']);
	_gaq.push(['_trackPageview']);
	<#-- Track page load
	_gaq.push(['_trackPageLoadTime']);
	-->
	
	(function() {
	  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();
	</script>
	</#if>	
	
	<@inplace.toolbar />
</body>
</html>
</@template.root>