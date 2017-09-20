

[#-- ========================================================================== @notifications.notificationRecipient --]
[#macro notificationRecipient notificationRule]
    [#-- @ftlvariable name="notificationRule" type="com.atlassian.bamboo.notification.NotificationRule" --]

    [#-- cache notification recipient to avoid multiple evaluation --]
    [#assign ntfctnRecipient = (notificationRule.notificationRecipient)! /]
    [#if ntfctnRecipient?has_content]
        [#-- can't use !default notation because getViewHtml returns empty string and not null --]
        [#assign viewHtml = ntfctnRecipient.getViewHtml() /]
        [#if viewHtml?has_content]
            ${viewHtml}
        [#else]
            ${ntfctnRecipient.description}
        [/#if]
    [#else]
        ${notificationRule.recipientType!}: ${notificationRule.recipient!}
    [/#if]
[/#macro]

[#-- =============================================================================== @notifications.notificationType --]
[#macro notificationType notificationRule]
    [#-- @ftlvariable name="notificationRule" type="com.atlassian.bamboo.notification.NotificationRule" --]

    [#-- cache notification type to avoid multiple evaluation --]
    [#assign ntfctnType = (notificationRule.notificationType)! ]
    [#if ntfctnType?has_content]
        [#-- can't use !default notation because getViewHtml returns empty string and not null --]
        [#assign viewHtml = ntfctnType.getViewHtml() /]
        [#if viewHtml?has_content]
            ${viewHtml}
        [#else]
            ${ntfctnType.name}
        [/#if]
    [#else]
        ${notificationRule.conditionKey}
    [/#if]
[/#macro]