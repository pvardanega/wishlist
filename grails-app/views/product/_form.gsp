<%@ page import="com.pvardanega.Product" %>

<div class="control-group ${hasErrors(bean: productInstance, field: 'title', 'error')}">
    <label for="title" class="control-label"><g:message code="product.title.label"/></label>
    <div class="controls">
        <g:textField name="title" value="${productInstance.title}" class="span8" maxlength="256" placeholder="Appareil photo"/>
        <span class='help-inline'>
            <g:eachError bean="${productInstance}" field="title">
                <g:message error="${it}"/>
            </g:eachError>
        </span>
    </div>
</div>

<div class="control-group ${hasErrors(bean: productInstance, field: 'description', 'error')}">
    <label for="description" class="control-label"><g:message code="product.description.label"/></label>
    <div class="controls">
        <g:textArea name="description" cols="40" rows="5" maxlength="2048" value="${productInstance?.description}" class="span8"/>
        <span class='help-inline'>
            <g:eachError bean="${productInstance}" field="description">
                <g:message error="${it}"/>
            </g:eachError>
        </span>
    </div>
</div>

<div class="control-group ${hasErrors(bean: productInstance, field: 'owner', 'error')}">
    <label for="owner" class="control-label"><g:message code="product.owner.label"/></label>
    <div class="controls">
        <g:select id="owner" name="owner.id" from="${com.pvardanega.User.list()}" optionKey="id" required="" value="${productInstance?.owner?.id}" class="many-to-one"/>
        <span class='help-inline'>
            <g:eachError bean="${productInstance}" field="owner">
                <g:message error="${it}"/>
            </g:eachError>
        </span>
    </div>
</div>

<div class="control-group ${hasErrors(bean: productInstance, field: 'link', 'error')}">
    <label for="link" class="control-label"><g:message code="product.link.label"/></label>
    <div class="controls">
        <g:textField name="link" value="${productInstance?.link}" class="span8" placeholder="http://www.google.fr"/>
        <span class='help-inline'>
            <g:eachError bean="${productInstance}" field="link">
                <g:message error="${it}"/>
            </g:eachError>
        </span>
    </div>
</div>

<div class="control-group ${hasErrors(bean: productInstance, field: 'pictureUrl', 'error')}">
    <label for="pictureUrl" class="control-label"><g:message code="product.picture.label"/></label>
    <div class="controls">
        <g:textField name="pictureUrl" value="${productInstance?.pictureUrl}" class="span8"/>
        <span class='help-inline'>
            <g:eachError bean="${productInstance}" field="pictureUrl">
                <g:message error="${it}"/>
            </g:eachError>
        </span>
    </div>
</div>

<div class="control-group ${hasErrors(bean: productInstance, field: 'price', 'error')}">
    <label for="price" class="control-label"><g:message code="product.price.label"/></label>
    <div class="controls">
        <div class="input-append">
            <g:textField name="price" value="${productInstance?.price}" class="span5" placeholder="10.00" maxlength="7"/>
            <span class="add-on">€</span>
        </div>
        <span class='help-inline'>
            <g:eachError bean="${productInstance}" field="price">
                <g:message error="${it}"/>
            </g:eachError>
        </span>
    </div>
</div>
