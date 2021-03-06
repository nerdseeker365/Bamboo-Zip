[#-- @ftlvariable name="action" type="com.atlassian.bamboo.ww2.actions.chains.admin.ViewPlanConfiguration" --]
[#-- @ftlvariable name="" type="com.atlassian.bamboo.ww2.actions.chains.admin.ViewPlanConfiguration" --]
[#if selectedRepositories?has_content]
    [#assign repositories=action.getRepositoryDefinitions('com.atlassian.bamboo.plugin.system.repository:svn', selectedRepositories)/]
[/#if]
[#if repositories?has_content]
    [#list repositories as repositoryDefinition]
        [#assign repository=repositoryDefinition.repository/]
        [@s.hidden name="selectedRepositories" value=repositoryDefinition.id /]
        [@s.label labelKey='repository.name' value=repositoryDefinition.name /]
        [#if repository.username?has_content]
            [@s.label labelKey='repository.svn.username' value=repository.username /]
        [#else]
            [@s.label labelKey='repository.svn.username' value="<i>[none specified]</i>" escape='false' /]
        [/#if]
        [@s.label labelKey='repository.svn.authentication' value=repository.authType /]
        [@s.label labelKey='repository.svn.keyFile' value=repository.keyFile hideOnNull='true' /]
    [/#list]
[#else]
    [@s.text name='bulkAction.svn.notSvn' /]
[/#if]