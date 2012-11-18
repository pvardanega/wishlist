
<%@ page import="com.pvardanega.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
<body>

    <g:if test="${flash.message}">
        <div class="alert alert-success">${flash.message}</div>
    </g:if>

    <table class="table">
        <tr>
            <td class="span2"><g:message code="user.firstname.label" /></td>
            <td><g:fieldValue bean="${userInstance}" field="firstname" /></td>
        </tr>
        <tr>
            <td class="span2"><g:message code="user.lastname.label" /></td>
            <td><g:fieldValue bean="${userInstance}" field="lastname" /></td>
        </tr>
        <tr>
            <td class="span2"><g:message code="user.email.label" /></td>
            <td><g:fieldValue bean="${userInstance}" field="email" /></td>
        </tr>
    </table>

</body>
</html>
