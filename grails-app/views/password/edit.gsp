<%@ page import="com.pvardanega.User" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>

    <g:form method="post" class="form-horizontal" action="update">
        <g:hiddenField name="id" value="${userInstance?.id}" />
        <g:hiddenField name="version" value="${userInstance?.version}" />

        <div class="control-group ${hasErrors(bean: userInstance, field: 'password', 'error')}">
            <label for="password" class="control-label"><g:message code="user.password.label"/></label>
            <div class="controls">
                <g:passwordField name="password" class="span3"/>
                <span class='help-inline'>
                    <g:eachError bean="${userInstance}" field="password">
                        <g:message error="${it}"/>
                    </g:eachError>
                </span>
            </div>
        </div>

        <div class="control-group ${hasErrors(bean: userInstance, field: 'confirmation', 'error')}">
            <label for="confirmation" class="control-label"><g:message code="user.confirmation.label"/></label>
            <div class="controls">
                <g:passwordField name="confirmation" class="span3"/>
                <span class='help-inline'>
                    <g:eachError bean="${userInstance}" field="confirmation">
                        <g:message error="${it}"/>
                    </g:eachError>
                </span>
            </div>
        </div>
        <fieldset class="form-actions">
            <button type="submit" name="create" class="btn btn-primary"><i class="icon-edit icon-white"></i> <g:message code="default.button.update.label"/></button>
        </fieldset>
    </g:form>

</body>
</html>
