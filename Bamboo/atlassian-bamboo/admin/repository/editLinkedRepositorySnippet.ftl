[#-- @ftlvariable name="" type="com.atlassian.bamboo.configuration.repository.EditLinkedRepository" --]
<html>
<head>
    [#if repositoryId > 0]
        [@ui.header pageKey="sharedRepositories.edit.title" title=true/]
    [#else]
        [@ui.header pageKey="sharedRepositories.create.title" title=true/]
    [/#if]
    <meta name="decorator" content="linkedRepository">
</head>
<body>
[#import "/build/common/repositoryCommon.ftl" as rc/]

[#assign cancelUri][#if repositoryDashboardOn]/vcs/viewAllRepositories.action[#else]/admin/editLinkedRepository.action[/#if][/#assign]

[@ww.form  action=submitAction
    method='POST'
    enctype='multipart/form-data'
    namespace="/admin"
    submitLabelKey="repository.update.button"
    cancelUri=cancelUri
]

    [@ww.hidden name="repositoryId" value=repositoryId /]

    [#if repositoryId > 0]
        <div class="toolbar aui-toolbar inline share-repository-toolbar">
            <ul class="toolbar-group">
                <li class="toolbar-item">
                    <a class="viewRepositoryUsagesTrigger toolbar-trigger"
                            href="[@s.url action='viewPlansUsingLinkedRepository' namespace='/admin' repositoryId=repositoryId /]">
                        [@s.text name="repository.shared.view.usages"/]
                    </a>
                </li>
                <li class="toolbar-item">
                    <a class="toolbar-trigger repositoryTools"
                            href="[@s.url action='configureLinkedRepositoryPermissions' namespace='/admin' repositoryId=repositoryId /]">
                        [@s.text name="repository.shared.permissions.edit"/]
                    </a>
                </li>
            </ul>
        </div>
    [/#if]

    <h2>
        [#if repositoryId > 0]
            [@s.text name="repository.shared.edit.title" /]
        [#else]
            [@s.text name="vcs.create.new.title" /]
        [/#if]
    </h2>

    [#if successMessage?has_content]
        [@ui.messageBox type="success" title=successMessage?html /]
    [/#if]

    [@dj.simpleDialogForm
        triggerSelector="#viewPlansTrigger_${repositoryId}"
        width=600
        height=300
        headerKey="repository.shared.view.usages"/]

    [#if currentVcsTypeSelector?has_content]
        [#assign repo=currentVcsTypeSelector/]
        [@s.hidden name="selectedRepository" id="selectedRepository" value=repo.key/]

        [@s.label labelKey="repository.type" value=repo.name /]
        [#if repo.optionDescription??]
            <div class="description">${repo.optionDescription}</div>
        [/#if]

        [@ui.bambooSection id='repository-id']
            [@ww.textfield labelKey="repository.name" name="repositoryName" id="repositoryName" maxlength="${repositoryNameMaxLength}" required=true/]
            ${repo.htmlFragments.ciHtml!}
        [/@ui.bambooSection]

        [@ui.bambooSection id='repository-configuration']
            ${repo.htmlFragments.locationHtml!}
            [@rc.branchEdit vcsTypeSelector=repo/]
            [#if repo.supportsConnectionTesting]
                [@rc.testRepositoryConnectionButton id="test-connection-" + repo.key?replace('[^a-zA-Z0-9]', '-', 'r') /]
            [/#if]
            [@rc.branchDetectionOptionsEdit vcsTypeSelector=repo/]
            [@rc.advancedRepositoryEdit vcsTypeSelector=repo /]
            [@rc.changeDetectionOptionsEdit vcsTypeSelector=repo /]
            [@rc.webRepositoryViewerEdit vcsTypeSelector=repo /]
        [/@ui.bambooSection]
    [/#if]
[/@ww.form]

<script type="text/javascript">
    BAMBOO.REPOSITORY.viewUsages.init({
                                          labelsDialog: {
                                              header: "[@ww.text name='repository.shared.view.usages' /]"
                                          }
                                      });
</script>
</body>
</html>