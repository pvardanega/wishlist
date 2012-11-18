<%@ page import="com.pvardanega.Product" %>

<div id="picturediv" class="control-group pull ${hasErrors(bean: productInstance, field: 'pictureUrl', 'error')} ${productInstance?.pictureUrl ? 'visible' : 'unvisible'}">
    <div class="controls">
        %{--<img src="${productInstance.pictureUrl}" width="70" class="img-polaroid"/>--}%
        <img src="http://images.mortderire.com/images/chat-dans-le-bocal.jpg" width="70" class="img-polaroid"/>
        <span class='help-inline'>
            <g:eachError bean="${productInstance}" field="pictureUrl">
                <g:message error="${it}"/>
            </g:eachError>
        </span>
    </div>
</div>

<div class="control-group ${hasErrors(bean: productInstance, field: 'title', 'error')}">
    <label for="title" class="control-label"><g:message code="product.title.label"/></label>
    <div class="controls">
        <div class="input-append">
            <g:textField name="title" value="${productInstance.title}" class="span12" maxlength="256"
                         placeholder="${message(code: 'product.title.placeholder')}"/>
            <button class="btn" type="button"><i class="icon-search"></i> Trouver une image</button>
        </div>
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
        <g:textField id="picture" name="picture" value="${productInstance?.pictureUrl}" class="span8"/>
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
            <g:textField name="price"
                         value="${formatNumber(number: productInstance?.price)}"
                         class="span5"
                         placeholder="${message(code: 'product.price.placeholder')}"
                         maxlength="7" />
            <span class="add-on"><g:message code="default.currency.symbol"/></span>
        </div>
        <span class='help-inline'>
            <g:eachError bean="${productInstance}" field="price">
                <g:message error="${it}"/>
            </g:eachError>
        </span>
    </div>
</div>

<g:hiddenField name="pictureUrl" value="http://images.mortderire.com/images/chat-dans-le-bocal.jpg"/>

<script type="text/javascript">
    $(document).ready(function () {
        $("#picture").change(function() {
            if (this.value == "") {
                $("#picturediv").removeClass("visible").addClass("unvisible");
            } else {
                $("#picturediv").removeClass("unvisible").addClass("visible");
            }
        });
    });
</script>