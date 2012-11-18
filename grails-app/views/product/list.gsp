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

    <strong><g:message code="product.list.count" args="${[productsTotal, productsTotal > 1 ? "s" : ""]}"/></strong>
    <span class="pull-right">
        <g:link controller="product" action="create">
            <i class="icon-plus"></i> <g:message code="product.add"/>
        </g:link>
    </span>

    <ul>
    <g:each in="${products}" var="product">
        <li>${product.title}</li>
    </g:each>
    </ul>

</body>
</html>
