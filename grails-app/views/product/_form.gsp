<%@ page import="com.pvardanega.Product" %>

<div id="picturediv" class="control-group pull ${hasErrors(bean: productInstance, field: 'pictureUrl', 'error')} ${productInstance?.pictureUrl ? 'visible' : 'unvisible'}">
    <div class="controls">
        <a href="${productInstance?.pictureUrl}" id="apicture" target="_blank">
            <img id="picture" src="${productInstance?.pictureUrl}" width="70" class="img-polaroid"/>
        </a>
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
        <g:textField name="title" value="${productInstance.title}" class="span8" maxlength="256"
                     placeholder="${message(code: 'product.title.placeholder')}"/>
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

<div class="control-group">
    <div class="controls">
        <a href="#searchPicture" role="button" data-toggle="modal" title="${message(code:
            'default.button.delete.label')}" class="btn"><i class="icon-search"></i> Chercher une image</a>
        <g:hiddenField id="pictureUrl" name="pictureUrl" value="${productInstance?.pictureUrl}" />
    </div>

    <div id="searchPicture" class="modal hide fade">
        <div class="modal-header">
            <h5><g:message code="product.image.search.label"/></h5>
            <div class="input-append">
                <input class="span12" id="searchQuery" type="text">
                <button id="btnSearch" class="btn" type="button"><g:message code="product.image.search"/></button>
            </div>
        </div>
        <div class="modal-body">
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal" aria-hidden="true"><g:message code="default.button.ok.label"/></button>
            <button type="button" id="cancel" class="btn" data-dismiss="modal" aria-hidden="true"><g:message code="default.button.cancel.label"/></button>
        </div>
    </div>
</div>

<div class="control-group ${hasErrors(bean: productInstance, field: 'owner', 'error')}">
    <label for="owner" class="control-label"><g:message code="product.owner.label"/></label>
    <div class="controls">
        <g:select id="owner" name="owner.id" from="${com.pvardanega.User.list()}" optionKey="id" required="" value="${sec.loggedInUserInfo(field: 'id')}" class="many-to-one"/>
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

<script type="text/javascript">

    $(document).ready(function () {

        $('body').keypress(function(event) {
            if ( event.keyCode == 13 ) {
                if ($('#searchPicture').css("display") == "block") {
                    event.preventDefault();
                    $('#btnSearch').click();
                }
            }
        });

        $('#cancel').click(function() {
            $('#pictureUrl').attr("value", "");
            $("#picture").attr("src", "");
            $("#picturediv").removeClass("visible").addClass("unvisible");
        })

        $('#btnSearch').click(function() {
            $('#searchQuery').html("");
            $('.modal-body').html("");
            var query = 'https://ajax.googleapis.com/ajax/services/search/images?v=1.0&callback=?&start=';
            var params = "&q=" + $('#searchQuery').attr("value");
            for (var i = 0 ; i < 12 ; i += 4) {
                $.getJSON(query + i + params, function(data) {
                    if (data.responseStatus == 200) {
                        $.each(data.responseData.results, function() {
                            $('.modal-body').append("<img src=\"" + this.url + "\" width=\"70\" class=\"img-polaroid\"/> ");
                        })
                        $('.modal-body img').click(function() {
                            $('#pictureUrl').attr("value", this.getAttribute("src"));
                            $("#apicture").attr("href", this.getAttribute("src"));
                            $("#picture").attr("src", this.getAttribute("src"));
                            $("#picturediv").removeClass("unvisible").addClass("visible");
                        });
                    } else {
                        $('.modal-body').html("Erreur");
                    }
                });
            }
        });
    });

</script>