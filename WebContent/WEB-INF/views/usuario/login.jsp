<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>

    <style type="text/css">
        @import url("resources/css/stylesheet.css");
    </style>
</head>
<body>
    <div class="login-page">
        <div class="form">
            <form class="login-form" action="efetuaLogin" method="POST">
                <input type="text" placeholder="Usuário" name="login"/>
                <input type="password" placeholder="Senha" name="senha"/>
                <input id="button" type="submit" value="Entrar">
            </form>
        </div>
    </div>
</body>
</html>