
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
        <tr>
            <td class="span2"><g:message code="user.enabled.label" /></td>
            <td><g:formatBoolean boolean="${userInstance?.enabled}" /></td>
        </tr>
    </table>

    <!-- Edit & delete -->
    <sec:ifLoggedIn>
        <g:set var="loggedInUser" value="${User.get(sec.loggedInUserInfo(field: 'id').toLong())}"/>

        <g:if test="${loggedInUser.id == userInstance.id || loggedInUser.isAdmin()}">
            <fieldset class="form-actions">
                <div class="btn-group">
                    <g:link controller="user" action="edit" id="${userInstance.id}" class="btn btn-primary"><i class="icon-edit icon-white"></i> <g:message code="default.button.edit.label"/></g:link>
                    <!-- Modal windows to confirm deletion -->
                    <g:if test="${loggedInUser.isAdmin()}">
                        <div id="deleteUserModal" class="modal hide fade">
                            <div class="modal-header">
                                <h5><g:message code="default.delete.popup.title"/></h5>
                            </div>

                            <div class="modal-body">
                                <p><g:message code="default.delete.popup.message"/></p>
                            </div>
                            <div class="modal-footer">
                                <g:form>
                                    <g:hiddenField name="id" value="${userInstance?.id}" />
                                    <g:actionSubmit controller="user" action="delete" class="btn btn-primary" value="${message(code:'default.button.ok.label')}"/>
                                    <a href="#" class="btn" data-dismiss="modal" ><g:message code="default.button.cancel.label"/></a>
                                </g:form>
                            </div>
                        </div>
                        <a data-toggle="modal" href="#deleteUserModal" class="btn btn-danger"><i class="icon-trash icon-white"></i> <g:message code="default.button.delete.label"/></a>
                    </g:if>
                </div>
            </fieldset>
        </g:if>
    </sec:ifLoggedIn>

</body>
</html>
