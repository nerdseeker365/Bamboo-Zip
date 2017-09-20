[#import "/fragments/decorator/decorators.ftl" as decorators/]
[#import "/fragments/breadCrumbs.ftl" as bc]

[@decorators.displayHtmlHeader requireResourcesForContext=["atl.general", "ace.editor", "specs.config.view"] withHeader=true /]

[#assign headerMainContent]
    [#if project?? && immutablePlan??]
        [@s.url var='projectUrl' value='/browse/${project.key}' /]
        [@s.url var='planUrl' value='/browse/${immutablePlan.key}' /]

        <ol id="breadcrumb" class="aui-nav aui-nav-breadcrumbs">[#t]
                    [@bc.showCrumb link=projectUrl id=project.key text=project.name /]
                    [@bc.showCrumb link=planUrl current=true id=immutablePlan.key text=immutablePlan.buildName /]
        </ol>[#t]

        [#assign configHeaderText]
            [@s.text name="specs.config.export.view.title"]
                [@s.param]
                ${immutablePlan.buildName}
                [/@s.param]
            [/@s.text]
        [/#assign]
        [@bc.showCrumb link=planUrl current=true id=immutablePlan.key text=configHeaderText tagName="h1"/]
    [#elseif deploymentProject??]
        [@s.url var='allDeploymentProjectsUrl' value='/deploy/viewAllDeploymentProjects.action' /]
        [@s.url var='deploymentProjectUrl' value='/deploy/viewDeploymentProjectEnvironments.action?id=${deploymentProject.id}' /]

        <ol id="breadcrumb" class="aui-nav aui-nav-breadcrumbs">[#t]
                        [@bc.showCrumb link=allDeploymentProjectsUrl text=i18n.getText("deployment.breadcrumb.allProjects") /]
                        [@bc.showCrumb link=deploymentProjectUrl current=true text=deploymentProject.name /]
        </ol>[#t]
        [#assign configHeaderText]
            [@s.text name="specs.config.export.view.title"]
                [@s.param]
                ${deploymentProject.name}
                [/@s.param]
            [/@s.text]
        [/#assign]
        <h1>${configHeaderText}</h1>
    [/#if]
[/#assign]

[#assign headerExtraContent]
    <div class="specs-hll-export-beta-warning">
        <div class="aui-help aui-help-text">
            <div class="aui-help-content">
                <p> ${i18n.getText("specs.config.export.view.warning.message")}
                </p>
                <ul class="aui-nav-actions-list">
                    <li>[@help.url pageKey="specs.config.export.view.help"]${i18n.getText("specs.config.export.view.learn.more")}[/@help.url]</li>
                </ul>
            </div>
        </div>
    </div>
[/#assign]


${soy.render("bamboo.layout.base", {
    "headerMainContent": headerMainContent!,
    "headerExtraContent": headerExtraContent,
    "content": body
})}

[#include "/fragments/decorator/minimalFooter.ftl"]


