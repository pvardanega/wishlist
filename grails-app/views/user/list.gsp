
<%@ page import="com.pvardanega.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
<body>

        <g:if test="${flash.message}">
            <div class="alert alert-error" >${flash.message}</div>
        </g:if>

        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <g:sortableColumn property="username" title="${message(code: 'user.username.label')}" />
                    <g:sortableColumn property="enabled" title="${message(code: 'user.enabled.label')}" />
                </tr>
            </thead>
            <tbody>
            <g:each in="${userInstanceList}" status="i" var="userInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>

                    <td><g:formatBoolean boolean="${userInstance.enabled}" /></td>

                </tr>
            </g:each>
            </tbody>
        </table>

</body>
</html>
