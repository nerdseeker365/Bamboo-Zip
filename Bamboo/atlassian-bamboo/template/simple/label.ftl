<span[#rt/]
[#if (parameters.id)?has_content]
 id="${parameters.id?html}"[#rt/]
[/#if]
[#if parameters.cssClass?exists]
 class="${parameters.cssClass?html}"[#rt/]
[/#if]
[#if parameters.cssStyle?exists]
 style="${parameters.cssStyle?html}"[#rt/]
[/#if]
[#if parameters.title?exists]
 title="${parameters.title?html}"[#rt/]
[/#if]
[#if parameters.for?exists]
 for="${parameters.for?html}"[#rt/]
[/#if]
>[#rt/]
[#if parameters.nameValue?exists]
[#if parameters.dateValue?exists]
    [#if parameters.dateFormat?exists]
        [@ww.date name='parameters.dateValue' format='${parameters.dateFormat}' /][#t/]
    [#else]
        [@ww.date name='parameters.dateValue' /]
    [/#if]
[#elseif parameters.escape??]
    [@ww.property value="parameters.nameValue" escapeHtml=parameters.escape/][#t/]
[#elseif parameters.escapeHtml??]
    [@ww.property value="parameters.nameValue" escapeHtml=parameters.escapeHtml/][#t/]
[#else]
    [@ww.property value="parameters.nameValue" /][#t/]
[/#if]
[/#if]
</span>