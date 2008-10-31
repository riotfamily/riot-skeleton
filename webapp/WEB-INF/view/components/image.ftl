<#if caption?has_content>
    <div class="labeled-image<#if class?exists> image-${class}</#if>" style="width:${imageWidth}px<#if clear?if_exists>;clear:both</#if>">
        <@renderImage />
        <div class="caption">${caption}</div>
    </div>
<#else>
    <@renderImage true />
</#if>

<#macro renderImage renderStyleAttrs=false>
    <#if image?exists>
    <img src="${request.contextPath}${image.uri}" alt="${alt?if_exists}"<#if renderStyleAttrs && class?exists> class="image-${class}"</#if><#if renderStyleAttrs && clear?if_exists> style="clear:both"</#if> />
    <#else>
    <div class="riot-noimage">
        <p>
            <a href="javascript://" onclick="riot.editProperties(this)">
            No image set. Click here to upload an image.
            </a>
        </p>
    </div>
    </#if>
</#macro>