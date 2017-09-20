[#-- @ftlvariable name="action" type="com.atlassian.bamboo.configuration.repository.ConfigureLinkedRepositoryPermissions" --]
[#-- @ftlvariable name="" type="com.atlassian.bamboo.configuration.repository.ConfigureLinkedRepositoryPermissions" --]

[#import "/fragments/permissions/permissions.ftl" as permissions/]

[@ww.text var="title" name="repository.shared.edit.permissions.title"]
    [@ww.param][#if vcsRepositoryData??]${vcsRepositoryData.name?html}[#else]Unknown[/#if][/@ww.param]
[/@ww.text]
<html>
<head>
    [@ui.header page=title title=true/]
    <meta name="decorator" content="linkedRepository">
</head>
<body>
[@ui.header page=title descriptionKey="repository.shared.edit.permissions.description"/]
[#if repositoryDashboardOn]
    [@ww.url var="cancelUri" namespace='admin/repository' action="editLinkedRepository"  repositoryId=repositoryId/]
[#else]
    [@ww.url var="cancelUri" namespace='admin' action="configureLinkedRepositories"  repositoryId=repositoryId/]
[/#if]

[@ww.form action='updateLinkedRepositoryPermissions' submitLabelKey='global.buttons.update' id='permissions' cancelUri='${cancelUri}' cssClass='top-label']
    [@permissions.permissionsEditor entityId=repositoryId anonymousAllowed=false editablePermissions=editablePermissions /]
    [@ww.hidden name='repositoryId' /]
[/@ww.form]
</body>
</html>
