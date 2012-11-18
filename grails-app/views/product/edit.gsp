<%@ page import="com.pvardanega.Product" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'product.label')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>

    <g:if test="${flash.message}">
        <div class="alert alert-error">${flash.message}</div>
    </g:if>

    <g:form method="post" action="update" class="form-horizontal">
        <g:hiddenField name="id" value="${productInstance?.id}" />
        <g:hiddenField name="version" value="${productInstance?.version}" />
        <fieldset>
            <g:render template="form"/>
        </fieldset>
        <fieldset class="form-actions">
            <button type="submit" name="create" class="btn btn-primary"><i class="icon-pencil icon-white"></i> <g:message code="default.button.update.label"/></button>
            <button type="reset" name="cancel" class="btn"><g:message code="default.button.cancel.label"/></button>
        </fieldset>
    </g:form>

</body>
</html>