<!doctype html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'product.label')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

    <g:if test="${flash.message}">
        <div class="alert alert-success" >${flash.message}</div>
    </g:if>

    <strong><g:message code="product.list.count" args="${[productsTotal, productsTotal > 1 ? "s" : ""]}"/></strong>
    <span class="pull-right">
        <g:link controller="product" action="create">
            <i class="icon-plus"></i> <g:message code="product.add"/>
        </g:link>
    </span>

    <br/>

    <g:each in="${products}" var="product">

        <div class="media well ">
            <g:if test="${product?.pictureUrl}">
                <a class="pull-left" href="${product?.pictureUrl}" target="_blank">
                    <img src="${product?.pictureUrl}" width="70" class="img-polaroid"/>
                </a>
            </g:if>
            <div class="media-body">
                <g:if test="${product?.price > 0}">
                    <span class="pull-right">
                        <strong>
                            <g:formatNumber number="${product?.price}" type="currency" currencyCode="${message(code: 'default.currency')}"/>
                        </strong>
                    </span>
                </g:if>
                <h4 class="media-heading">
                    <g:if test="${!myList && product?.offeredBy}">
                        <span class="label label-success">
                            <g:message code="product.reserved" args="${[product?.offeredBy?.username]}"/>
                        </span>
                    </g:if>
                    ${product?.title}
                    <g:if test="${product?.createdBy != product?.owner}">
                        <small><g:message code="product.created.by" args="${[product?.createdBy]}"/></small>
                    </g:if>
                </h4>
                <p>
                    <span class="pull-right">
                        <g:if test="${product?.link}">
                            <a href="${product?.link}" title="${message(code: 'product.see')}" target="_blank"><i class="icon-search"></i></a>
                        </g:if>
                        <g:if test="${myList || product?.createdBy?.equals(me)}">
                            <g:link controller="product" action="edit" id="${product?.id}" title="${message(code: 'default.button.edit.label')}">
                                <i class ="icon-edit"></i>
                            </g:link>
                            <a href="#deleteProduct${product?.id}" role="button" data-toggle="modal" title="${message(code: 'default.button.delete.label')}"><i class="icon-trash"></i></a>
                        </g:if>
                        <g:if test="${!myList}">
                            <g:if test="${!product?.offeredBy}">
                                <g:link controller="product" action="offerBy" id="${product?.id}" title="${message(code: 'product.assign')}"><i class="icon-shopping-cart"></i></g:link>
                            </g:if>
                            <g:elseif test="${product?.offeredBy?.equals(me)}">
                                <g:link controller="product" action="release" id="${product?.id}" title="${message(code: 'product.release')}"><i class="icon-ban-circle"></i></g:link>
                            </g:elseif>
                        </g:if>
                    </span>
                    ${product?.description?.replaceAll("\n", "<br/>")}
                </p>
            </div>
        </div>

        <div id="deleteProduct${product?.id}" class="modal hide fade">
            <div class="modal-header">
                <h5><g:message code="product.delete.popup.title"/></h5>
            </div>
            <div class="modal-body">
                <p><g:message code="product.delete.popup.message"/></p>
            </div>
            <div class="modal-footer">
                <g:form>
                    <g:hiddenField name="id" value="${product?.id}" />
                    <g:actionSubmit controller="user" action="delete" class="btn btn-primary" value="${message(code:'default.button.ok.label')}"/>
                    <button class="btn" data-dismiss="modal" aria-hidden="true"><g:message code="default.button.cancel.label"/></button>
                </g:form>
            </div>
        </div>
    </g:each>

</body>
</html>
