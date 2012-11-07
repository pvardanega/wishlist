<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
</head>

<body>

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

    <script type='text/javascript'>
        <!--
        (function() {
            document.forms['loginForm'].elements['j_username'].focus();
        })();
        // -->
    </script>

</body>
</html>
