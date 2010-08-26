<#--
@icon comments
@name Twitter
@defaults { id: 'riotfamily' }
-->
<div class="box">
	<ul>
		<#list beans.twitter.getTimeline(id) as tweet>
			<li>
				${tweet.text}
			</li>
		</#list>
	</ul>
</div>