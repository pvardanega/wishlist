<%@ page import="com.pvardanega.UserAccount" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
<body>

    <g:if test="${flash.message}">
        <div class="alert alert-success">${flash.message}</div>
    </g:if>

    <table class="table table-hover">
        <thead>
            <tr>
                <th>${message(code: 'user.id.label')}</th>
                <th>${message(code: 'user.firstname.label')}</th>
                <th>${message(code: 'user.lastname.label')}</th>
                <th>${message(code: 'user.email.label')}</th>
                <th>${message(code: 'user.username.label')}</th>
                <th>${message(code: 'user.enabled.label')}</th>
                <th>${message(code: 'user.accountLocked.label')}</th>
                <th>&nbsp;</th>
            </tr>
        </thead>
        <tbody>
        <g:each in="${userInstanceList}" status="i" var="userInstance">
            <tr>
                <td>${fieldValue(bean: userInstance, field: "id")}</td>
                <td>${fieldValue(bean: userInstance, field: "firstname")}</td>
                <td>${fieldValue(bean: userInstance, field: "lastname")}</td>
                <td>${fieldValue(bean: userInstance, field: "email")}</td>
                <td>${fieldValue(bean: userInstance, field: "username")}</td>
                <td><g:formatBoolean boolean="${userInstance.enabled}" /></td>
                <td><g:formatBoolean boolean="${userInstance.accountLocked}" /></td>
                <td>
                    <g:link controller="user" action="edit" id="${userInstance.id}"><i class="icon-edit"></i></g:link>
                    <div id="deleteUserModal${userInstance.id}" class="modal hide fade">
                        <div class="modal-header">
                            <h5><g:message code="user.delete.popup.title"/></h5>
                        </div>
                        <div class="modal-body">
                            <p><g:message code="user.delete.popup.message"/></p>
                        </div>
                        <div class="modal-footer">
                            <g:form>
                                <g:hiddenField name="id" value="${userInstance.id}" />
                                <g:actionSubmit controller="user" action="delete" class="btn btn-primary" value="${message(code:'default.button.ok.label')}"/>
                                <button class="btn" data-dismiss="modal" aria-hidden="true"><g:message code="default.button.cancel.label"/></button>
                            </g:form>
                        </div>
                    </div>
                    <a href="#deleteUserModal${userInstance.id}" role="button" data-toggle="modal"><i class="icon-trash"></i></a>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

</body>
</html>
