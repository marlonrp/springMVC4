<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adicionar Contas</title>
</head>
<body>
    <h3>Adicionar Contas</h3>
    <form action="adicionaConta" method="post">
        <p>Descrição</p>
        <textarea name="descricao" id="" cols="100" rows="5" ></textarea>
        <form:errors path="conta.descricao"></form:errors>
        <p>Valor</p>
        <input type="number" name="valor" id="" >
        <p>Tipo</p>
        <select name="tipo" id="">
            <option value="ENTRADA">Entrada</option>
            <option value="SAIDA">Saída</option>
        </select>
        <hr>
        <input type="submit" value="Adicionar">
    </form>
</body>
</html>