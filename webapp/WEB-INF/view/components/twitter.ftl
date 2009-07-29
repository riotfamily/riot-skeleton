<#--
@icon comments
@name Twitter
@defaults { id: 'riotfamily' }
-->
<@cache.block key="twitter-"+id ttl="60s">
	<div class="box">
		<ul>
			<#list beans.twitter.getTimeline(id) as tweet>
				<li>
					${tweet.text}
				</li>
			</#list>
		</ul>
	</div>
</@cache.block>