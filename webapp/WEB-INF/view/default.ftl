<@template.root>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Riot Project Skeleton - ${(currentPage.title)!}</title>
	<@c.stylesheets [
		"/style/yui.reset.css",
		"/style/grid.css",
		"/style/main_" + ((currentSite.theme)!"default") + ".css",
		"/style/shadowbox/css/shadowbox.css",
		txt2img.styleSheet()
	] />
	
	<@c.scripts srcs=[
		"/style/prototype/prototype.js",
		"/style/scriptaculous/effects.js",
		"/style/shadowbox/js/adapter/shadowbox-prototype.js",
		"/style/shadowbox/js/shadowbox.js"		
	] />
	
	<@inplace.callbacks>
		function onRiotToolbarClick(button) {
			if (button == 'browse') {
				Shadowbox.setup();
			}
			else {
				Shadowbox.clearCache();
				$$('.gallery-image').each(function(el) {delete el.shadowboxCacheKey});
			}
		} 
	</@inplace.callbacks>

	<#-- Shadowbox (see http://mjijackson.com/shadowbox) -->
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
<body class="${template.vars.bodyClass!"default"} noscript">
	<@c.removeNoscriptClass />
	<div id="container" class="container">
		<div id="header" class="header">
			<div class="padding">
				<@template.block name="header">
					<div id="topnav">
						<#assign activePage = currentPage.ancestors[0] />
						<#list activePage.siblings as page>
							<#if page == activePage>
								<@pages.link page=page class="active" />
							<#else>
								<@pages.link page=page />
							</#if>
							<#if page_has_next>|</#if>
						</#list>
					</div>
				</@template.block>
			</div>
		</div>
		<div id="wrapper" class="wrapper">
			<div id="content" class="content">
				<div class="padding">
					<@template.block name="content">
						<@pages.use>
							<@inplace.componentList key="content" 
								initial=["headline","paragraph"] 
								valid=["paragraph","headline","image","gallery","table"] />
						</@pages.use>		
					</@template.block>
				</div>
			</div>
		</div>
		<#if currentPage??>
			<div id="navigation" class="navigation">
				<div class="padding">
					<@template.block name="navigation">
						<#include "inc/navigation.ftl" />
					</@template.block>
				</div>
			</div>
		</#if>
		<#if template.vars.bodyClass! != "wide">
			<div id="extra" class="extra">
				<div class="padding">
					<@template.block name="extra">
						<@pages.use>
							<@inplace.componentList key="extra" valid=["extra-box"] />
						</@pages.use>	
					</@template.block>
				</div>
			</div>
		</#if>
		<div id="footer" class="footer">
			<div class="padding">
				<span class="poweredby">Powered by</span><span class="riot">Riot</span>
			</div>
		</div>
	</div>
	
	<#if (currentSite.googleAnalyticsCode)??>
		<script type="text/javascript">
			var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
			document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
		</script>
		<script type="text/javascript">
			var pageTracker = _gat._getTracker("${currentSite.googleAnalyticsCode}");
			pageTracker._initData();
			pageTracker._trackPageview();
		</script>
	</#if>
	
	<@txt2img.init />
	<@inplace.toolbar />
</body>
</html>
</@template.root>