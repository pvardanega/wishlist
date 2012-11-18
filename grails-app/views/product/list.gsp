<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'product.label')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

    <g:if test="${flash.message}">
        <div class="alert alert-success" >${flash.message}</div>
    </g:if>

    MA LISTE

</body>
</html>
