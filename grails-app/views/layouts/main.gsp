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
                <div class="container">
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
                            <li class="active"><a href="#"><i class="icon-home"></i></a></li>
                            <li><a href=""><g:message code="app.menu.my.wishes"/></a></li>
                            <li><a href=""><g:message code="app.menu.friends.wishes"/></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </sec:ifLoggedIn>

    <div class="container">
        <g:layoutBody/>
    </div>

    <r:layoutResources/>

</body>
</html>