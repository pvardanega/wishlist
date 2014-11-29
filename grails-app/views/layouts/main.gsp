<%@ page import="com.pvardanega.UserAccount" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><g:layoutTitle/></title>
    <link rel="icon" href="${request.contextPath + '/static/images/favicon.ico'}" type="image/x-icon" />
    <link rel="shortcut icon" href="${request.contextPath + '/static/images/favicon.ico'}" type="image/x-icon" />
    <r:require modules="bootstrap"/>
    <r:require modules="application"/>
    <r:layoutResources/>
</head>
<body>


    <sec:ifLoggedIn>
        <g:set var="loggedInUserId" value="${sec.loggedInUserInfo(field: 'id').toLong()}"/>

        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="brand" href="#"><g:message code="app.name"/></a>
                    <div class="nav-collapse collapse">
                        <p class="navbar-text pull-right">
                            <g:message code="app.navbar.logged.in"/> <sec:username/>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3">
                    <div class="well sidebar-nav">
                        <ul class="nav nav-list">
                            <g:set var="userIdToShow"
                                   value="${request.parameterMap.get("userId") == null ? null :
                                            request.parameterMap.get("userId")[0]?.toLong()}"/>
                            <li class="nav-header"><g:message code="app.menu.title.lists"/></li>
                            <li class="${userIdToShow == loggedInUserId ? "active" : ""}">
                                <g:link controller="product" action="list" params="${[userId: loggedInUserId]}">
                                    <i class="icon-list-alt"></i> <g:message code="app.menu.lists.mine"/>
                                </g:link>
                            </li>

                            <g:each in="${UserAccount.findAllByIdNotEqual(loggedInUserId.toLong())}" var="user">
                                <li class="${userIdToShow == user.id ? "active" : ""}">
                                    <g:link controller="product" action="list" params="${[userId: user.id]}">
                                        <i class="icon-list-alt"></i> ${user.username}
                                    </g:link>
                                </li>
                            </g:each>

                            <li class="nav-header"><g:message code="app.menu.title.personal"/></li>
                            <li class="${request.requestURI.contains(createLink(controller: "user", action:
                                    "edit", id: loggedInUserId)) ? "active" : ""}">
                                <g:link controller="user" action="edit" id="${loggedInUserId}">
                                    <i class="icon-pencil"></i> <g:message code="app.menu.personal.infos"/>
                                </g:link>
                            </li>
                            <li class="${request.requestURL.contains(createLink(controller: "password", action:
                                            "edit", id: loggedInUserId)) ? "active":""}">
                                <g:link controller="password" action="edit" id="${loggedInUserId}">
                                    <i class="icon-pencil"></i> <g:message code="app.menu.personal.password"/>
                                </g:link>
                            </li>
                            <li>
                                <g:link controller="logout">
                                    <i class="icon-off"></i> <g:message code="app.menu.personal.logout"/>
                                </g:link>
                            </li>
                            <li>
                                <div id="deleteUserModal" class="modal hide fade">
                                    <div class="modal-header">
                                        <h5><g:message code="user.delete.popup.title"/></h5>
                                    </div>
                                    <div class="modal-body">
                                        <p><g:message code="user.delete.popup.message"/></p>
                                    </div>
                                    <div class="modal-footer">
                                        <g:form>
                                            <g:hiddenField name="id" value="${loggedInUserId}" />
                                            <g:actionSubmit controller="user" action="delete" class="btn btn-primary" value="${message(code:'default.button.ok.label')}"/>
                                            <button class="btn" data-dismiss="modal" aria-hidden="true"><g:message code="default.button.cancel.label"/></button>
                                        </g:form>
                                    </div>
                                </div>
                                <a href="#deleteUserModal" role="button" data-toggle="modal"><i class="icon-trash"></i> <g:message code="app.menu.personal.delete"/></a>
                            </li>
                            <g:if test="${UserAccount.findById(loggedInUserId.toLong()).isAdmin()}">
                                <li class="nav-header"><g:message code="app.menu.title.admin"/></li>
                                <li class="${request.requestURL.contains(createLink(controller: "user", action:"list")) ? "active":""}">
                                    <g:link controller="user" action="list">
                                        <i class="icon-user"></i> <g:message code="app.menu.admin.list.users"/>
                                    </g:link>
                                </li>
                                <li class="${request.requestURL.contains(createLink(controller: "user", action:"create")) ? "active":""}">
                                    <g:link controller="user" action="create">
                                        <i class="icon-plus"></i> <g:message code="app.menu.admin.add.user"/>
                                    </g:link>
                                </li>
                            </g:if>
                        </ul>
                    </div>
                </div>
                <div class="span9">
    </sec:ifLoggedIn>
                    <g:layoutBody/>
    <sec:ifLoggedIn>
                </div>
            </div>

            <hr>

            <footer>
                <p>&copy; Wishlist 2012
                    <%
                        int startingYear = 2012
                        String thisYear = new Date().format("yyyy")
                        if (startingYear < (thisYear as int)) {
                            print(" - " + thisYear)
                        }
                    %>
                    / <a href="https://github.com/pvardanega/wishlist">github</a>
                    / <a href="https://twitter.com/pvardanega">@pvardanega</a>
                </p>
            </footer>

        </div>

    </sec:ifLoggedIn>

    <r:layoutResources/>

</body>
</html>
