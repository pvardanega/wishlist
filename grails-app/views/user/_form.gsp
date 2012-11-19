<%@ page import="com.pvardanega.User" %>

<div class="control-group ${hasErrors(bean: userInstance, field: 'firstname', 'error')}">
    <label for="firstname" class="control-label"><g:message code="user.firstname.label"/></label>
    <div class="controls">
        <g:textField name="firstname" value="${userInstance?.firstname}" class="span4" maxlength="64"/>
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
        <g:textField name="lastname" value="${userInstance?.lastname}" class="span4" maxlength="64"/>
        <span class='help-inline'>
            <g:eachError bean="${userInstance}" field="lastname">
                <g:message error="${it}"/>
            </g:eachError>
        </span>
    </div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'email', 'error')}">
    <label for="email" class="control-label"><g:message code="user.email.label"/></label>
    <div class="controls">
        <g:textField name="email" value="${userInstance?.email}" class="span6" maxlength="128"/>
        <span class='help-inline'>
            <g:eachError bean="${userInstance}" field="email">
                <g:message error="${it}"/>
            </g:eachError>
        </span>
    </div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'password', 'error')}">
    <label for="password" class="control-label"><g:message code="user.password.label"/></label>
    <div class="controls">
        <g:passwordField name="password" value="${userInstance?.password}" class="span4" maxlength="32"/>
        <span class='help-inline'>
            <g:eachError bean="${userInstance}" field="password">
                <g:message error="${it}"/>
            </g:eachError>
        </span>
    </div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'confirmation', 'error')}">
    <label for="confirmation" class="control-label"><g:message code="user.confirmation.label"/></label>
    <div class="controls">
        <g:passwordField name="confirmation" value="${userInstance?.confirmation}" class="span4" maxlength="32"/>
        <span class='help-inline'>
            <g:eachError bean="${userInstance}" field="confirmation">
                <g:message error="${it}"/>
            </g:eachError>
        </span>
    </div>
</div>