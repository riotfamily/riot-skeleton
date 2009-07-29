<@template.extend file="bare.ftl">

	<@template.set title = currentPage.title />
	
	<@template.block name="header">
		<div id="topnav">
			<#assign activePage = currentPage.ancestors[1] />
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
	
	<@template.block name="content">
		<@pages.use>
			<@inplace.componentList key="content"
				initial=["headline","paragraph"] 
				valid=["paragraph","headline","image"] />
		</@pages.use>		
	</@template.block>
	
	<@template.block name="navigation">
		<#-- 
		  For better readability, the navigation code is sourced out into
		  another file:
		-->
		<#include "navigation.ftl" />
	</@template.block>
	
	<@template.block name="extra">
		<@pages.use>
			<@inplace.componentList key="extra" valid=["extra-box","twitter"] />
		</@pages.use>	
	</@template.block>

</@template.extend>