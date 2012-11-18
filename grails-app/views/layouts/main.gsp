<%@ page import="com.pvardanega.User" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><g:layoutTitle/></title>
    <r:require modules="bootstrap"/>
    <r:require modules="application"/>
    <r:layoutResources/>
</head>
<body>

    <sec:ifLoggedIn>
        <g:set var="loggedInUserId" value="${sec.loggedInUserInfo(field: 'id')}"/>

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
                            <li class="nav-header"><g:message code="app.menu.title.lists"/></li>
                            <li>
                                <g:link controller="product" action="list" params="${[userId: loggedInUserId]}">
                                    <i class="icon-tag"></i> <g:message code="app.menu.lists.mine"/>
                                </g:link>
                            </li>
                            <%
                                // TODO : bien moche !
                                def users = User.findByIdNotEqual(loggedInUserId.toLong())
                                users.each {
                            %>
                            <li>
                                <g:link controller="product" action="list" params="${[userId: it.id]}">
                                    <i class="icon-tag"></i> ${it.username}
                                </g:link>
                            </li>
                            <%
                                }
                            %>
                            <li class="nav-header"><g:message code="app.menu.title.personal"/></li>
                            <li>
                                <g:link controller="user" action="edit" id="${loggedInUserId}">
                                    <i class="icon-pencil"></i> <g:message code="app.menu.personal.infos"/>
                                </g:link>
                            </li>
                            <li>
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