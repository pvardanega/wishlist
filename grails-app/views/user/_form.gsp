<%@ page import="com.pvardanega.User" %>

<div class="control-group ${hasErrors(bean: userInstance, field: 'firstname', 'error')}">
    <label for="firstname" class="control-label">
        <g:message code="user.firstname.label"/>
        <span>*</span>
    </label>
    <div class="controls">
        <g:textField name="firstname" value="${userInstance.firstname}"/>
        <span class='help-inline'>
            <g:eachError bean="${userInstance}" field="firstname">
                <g:message error="${it}"/>
            </g:eachError>
        </span>
    </div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'lastname', 'error')}">
    <label for="lastname" class="control-label">
        <g:message code="user.lastname.label"/>
        <span>*</span>
    </label>
    <div class="controls">
        <g:textField name="lastname" value="${userInstance.lastname}"/>
        <span class='help-inline'>
            <g:eachError bean="${userInstance}" field="lastname">
                <g:message error="${it}"/>
            </g:eachError>
        </span>
    </div>
</div>

<div class="control-group ${hasErrors(bean: userInstance ,field: 'email', 'error')}">
    <label for="email" class="control-label">
        <g:message code="user.email.label"/>
        <span>*</span>
    </label>
    <div class="controls">
        <div class="input-prepend">
            <span class="add-on"><i class="icon-envelope"></i></span>
            <g:textField name="email" value="${userInstance.email}"/>
            <span class='help-inline'>
                <g:eachError bean="${userInstance}" field="email">
                    <g:message error="${it}"/>
                </g:eachError>
            </span>
        </div>
    </div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'password', 'error')}">
    <label for="password" class="control-label">
        <g:message code="user.password.label"/>
        <span>*</span>
    </label>
    <div class="controls">
        <g:passwordField name="password"/>
        <span class='help-inline'>
            <g:eachError bean="${userInstance}" field="password">
                <g:message error="${it}"/>
            </g:eachError>
        </span>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="confirmation"><g:message code="user.confirmation.label"/><span>*</span></label>
    <div class="controls">
        <g:passwordField name="confirmation"/>
    </div>
</div>
