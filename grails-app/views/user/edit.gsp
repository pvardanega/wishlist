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
        <fieldset>
            <g:render template="form"/>
        </fieldset>
        <fieldset class="form-actions">
            <button type="submit" name="create" class="btn btn-primary"><i class="icon-edit icon-white"></i> <g:message code="default.button.update.label"/></button>
        </fieldset>
    </g:form>

</body>
</html>
