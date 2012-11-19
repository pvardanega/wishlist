<%@ page import="com.pvardanega.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
<body>

    <g:if test="${flash.message}">
        <div class="alert alert-error">${flash.message}</div>
    </g:if>

    <g:form method="post" class="form-horizontal" action="update">
        <g:hiddenField name="id" value="${userInstance?.id}" />
        <g:hiddenField name="version" value="${userInstance?.version}" />
        <div class="control-group ${hasErrors(bean: userInstance, field: 'firstname', 'error')}">
            <label for="firstname" class="control-label"><g:message code="user.firstname.label"/></label>
            <div class="controls">
                <g:textField name="firstname" value="${userInstance.firstname}" class="span3"/>
                <span class='help-inline'>
                    <g:eachError bean="${userInstance}" field="firstname">
                        <g:message error="${it}"/>
                    </g:eachError>
                </span>
            </div>
        </div>

        <div class="control-group ${hasErrors(bean: userInstance, field: 'lastname', 'error')}">
            <label for="lastname" class="control-label"><g:message code="user.lastname.label"/></label>
            <div class="controls">
                <g:textField name="lastname" value="${userInstance.lastname}" class="span3"/>
                <span class='help-inline'>
                    <g:eachError bean="${userInstance}" field="lastname">
                        <g:message error="${it}"/>
                    </g:eachError>
                </span>
            </div>
        </div>

        <div class="control-group ${hasErrors(bean: userInstance ,field: 'email', 'error')}">
            <label for="email" class="control-label"><g:message code="user.email.label"/></label>
            <div class="controls">
                <div class="input-prepend">
                    <span class="add-on">@</span>
                    <g:textField name="email" value="${userInstance.email}" class="span12"/>
                </div>
                <span class='help-inline'>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <g:eachError bean="${userInstance}" field="email">
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
