
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
                    %{--<g:sortableColumn property="firstname" title="${message(code: 'user.firstname.label')}" />--}%
                    %{--<g:sortableColumn property="lastname" title="${message(code: 'user.lastname.label')}" />--}%
                    %{--<g:sortableColumn property="email" title="${message(code: 'user.email.label')}" />--}%
                    <th><g:message code="user.firstname.label"/></th>
                    <th><g:message code="user.lastname.label"/></th>
                    <th><g:message code="user.email.label"/></th>
                </tr>
            </thead>
            <tbody>
            <g:each in="${userInstanceList}" status="i" var="userInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "firstname")}</g:link></td>
                    <td><g:fieldValue bean="${userInstance}" field="lastname"/></td>
                    <td><g:fieldValue bean="${userInstance}" field="email"/></td>

                </tr>
            </g:each>
            </tbody>
        </table>

</body>
</html>
