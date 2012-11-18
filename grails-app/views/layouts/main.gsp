<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><g:layoutTitle/></title>
    <r:require modules="bootstrap"/>
    <r:require modules="application"/>
</head>
<body>

    <sec:ifLoggedIn>
        <g:set var="loggedInUserId" value="${sec.loggedInUserInfo(field: 'id')}"/>

        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#"><g:message code="app.name"/></a>
                    <div class="nav-collapse collapse">
                        <p class="navbar-text pull-right">
                            <g:message code="app.menu.logged.in"/> <g:link action="show" id="${loggedInUserId}" class
                            ="navbar-link"><sec:username/></g:link>
                            | <g:link controller="logout"><i class="icon-off icon-white"></i></g:link>
                        </p>
                        <ul class="nav">
                            <li><a href=""><g:message code="app.menu.my.wishes"/></a></li>
                            <li><a href=""><g:message code="app.menu.friends.wishes"/></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3">
                    <div class="well sidebar-nav">
                        <ul class="nav nav-list">
                            <li class="nav-header">Sidebar</li>
                            <li class="active"><a href="#">Link</a></li>
                            <li><a href="#">Link</a></li>
                            <li><a href="#">Link</a></li>
                            <li><a href="#">Link</a></li>
                            <li class="nav-header">Sidebar</li>
                            <li><a href="#">Link</a></li>
                            <li><a href="#">Link</a></li>
                            <li><a href="#">Link</a></li>
                            <li><a href="#">Link</a></li>
                            <li><a href="#">Link</a></li>
                            <li><a href="#">Link</a></li>
                            <li class="nav-header">Sidebar</li>
                            <li><a href="#">Link</a></li>
                            <li><a href="#">Link</a></li>
                            <li><a href="#">Link</a></li>
                        </ul>
                    </div><!--/.well -->
                </div><!--/span-->
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