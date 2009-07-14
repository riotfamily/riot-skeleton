<#--
@icon text_heading_1
@name Überschrift
@defaults { headline: 'Lorem Ipsum' }
-->
<#if anchor?has_content><a name="${anchor}"></a></#if>
<@inplace.text key="headline" tag="h1" class=inplace.firstClass()>Headline</@inplace.text>
