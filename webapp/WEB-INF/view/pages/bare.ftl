<#--
  Bare template that defines a simple layout with 5 blocks: header, 
  navigation, content, extra and footer.
  
  The @template.root macro must be used, so that other templates can extend
  this file:
-->
<@template.root>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
	  
	  Two things are noteworthy here:
	  
	  (1) The "main_<theme>.css" file is dynamic ands reads CSS constants 
	  from the css.ini file. Hence the page will use a different color theme
	  depending on the "theme" property of the current site.
	  
	  (2) The txt2img.styleSheet() function returns the URL of a stylesheet
	  that hides all elements which will be replaced by txt2img in order to
	  avoid flickering during page load. In order to make this work, the body
	  element must have a "noscript" CSS class (see below).
	-->
	<@c.stylesheets [
		"/style/yui.reset.css",
		"/style/grid.css",
		"/style/main_" + ((currentSite.theme)!"default") + ".css",
		txt2img.styleSheet()
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
			</div>
		</div>
	</div>
	
	<#--
	  Sites can have arbitrary properties, just like pages. To edit these 
	  properties, a corresponding form must be defined in 
	  WEB-INF/riot-config/content-forms.xml. Take a look at that file and you
	  will see a form called "all-sites" which contains a textfield to enter
	  a Google Analytics Code (used below) and a drop-down to select a theme,
	  which is used at the top of this template to include a parameterized
	  main.css file. 
	-->
	
	<#if (currentSite.googleAnalyticsCode)??>
		<script type="text/javascript">
			var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
			document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
		</script>
		<script type="text/javascript">
			var pageTracker = _gat._getTracker("${currentSite.theme.googleAnalyticsCode}");
			pageTracker._initData();
			pageTracker._trackPageview();
		</script>
	</#if>
	
	<#-- 
	   (1) Load prototype.js which is bundled with Riot. We need the prototype.js 
	   library here, because it is used by txt2img. If you don't use txt2img,
	   you can safely remove this line. The Riot toolbar also uses prototype.js,
	   but will automatically load it (in edit mode) if it hasn't been loaded
	   before.
	   
	   (2) The @txt2img.init macro emits a script tag that loads the dynamic
	   txt2img.js file.
	   
	   (3) Finally, the @inplace.toolbar macro emits a script block that 
	   displays the Riot toolbar.   
	-->
	<@c.scripts srcs=[
		riot.resource("prototype/prototype.js"),
		"/riot-utils/error.js",
		"/style/js/project.js"] 
	/>

	<@txt2img.init />
	<@inplace.toolbar />
</body>
</html>
</@template.root>