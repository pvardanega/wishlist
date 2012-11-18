<%@ page import="com.pvardanega.Product; com.pvardanega.User" %>

<div class="control-group ${hasErrors(bean: productInstance, field: 'title', 'error')}">
    <label for="title" class="control-label"><g:message code="product.title.label"/></label>
    <div class="controls">
        <g:textField name="title" class="span10" value="${productInstance.title}"/>
        <span class='help-inline'>
            <g:eachError bean="${productInstance}" field="title">
                <g:message error="${it}"/>
            </g:eachError>
        </span>
    </div>
</div>

<div class="control-group ${hasErrors(bean: productInstance, field: 'owner', 'error')}">
    <label for="owner" class="control-label"><g:message code="product.owner.label"/></label>
    <div class="controls">
        <g:select id="owner" name="owner.id" from="${User.list()}" optionKey="id" required="" value="${productInstance?.owner?.id}" class="many-to-one"/>
        <span class='help-inline'>
            <g:eachError bean="${productInstance}" field="owner">
                <g:message error="${it}"/>
            </g:eachError>
        </span>
    </div>
</div>
