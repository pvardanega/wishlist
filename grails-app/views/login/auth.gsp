<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><g:message code="springSecurity.login.title"/></title>
    <r:require modules="application"/>
    <r:require modules="bootstrap"/>
</head>

<body style="background-color: #f5f5f5;">

    <div class="container">
        <g:if test='${flash.message}'>
            <div class="alert alert-error">${flash.message}</div>
        </g:if>

        <form class="form-signin" action='${postUrl}' method='POST' autocomplete='off'>
            <h2 class="form-signin-heading"><g:message code="springSecurity.login.title"/></h2>
            <input type='text' class='input-block-level' name='j_username' id='username' placeholder="${message(code: "springSecurity.login.username")}"/>
            <input type='password' class='input-block-level' name='j_password' id='password' placeholder="${message(code: "springSecurity.login.password")}"/>
            <label class="checkbox">
                <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember-me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                <label for='remember-me'><g:message code="springSecurity.login.remember.me.label"/></label>
            </label>
            <button class="btn btn-large btn-primary" type="submit">${message(code: "springSecurity.login.button")}</button>
        </form>
    </div>

    <script type='text/javascript'>
        <!--
        (function() {
            document.forms['loginForm'].elements['j_username'].focus();
        })();
        // -->
    </script>

    <r:layoutResources/>

</body>
</html>
