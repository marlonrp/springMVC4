<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista de Contas</title>

    <script src="resources/js/jquery.js"></script>
    <script type="text/javascript">

        function pagaAgora(id) {
            //$.get("pagaConta?id=" + id, pagamentoOK)
            $.post("pagaConta",{"id": id}, ()=> {
                alert("Pagamento realizado com sucesso!");
                $("#conta_"+id).html("Sim");

                let now = new Date();
                let data = now.getDate() + "/" + (now.getMonth()+1) + "/" + now.getFullYear();
                $("#pagamento_"+id).html(data);

                $('#buttonPagar_'+id).css({'display':'none'});
            })
        }

        function logout() {
            console.log('logout');

            $.post("logout");
        }

    </script>
</head>
<body>
    <h3>Lista de Contas</h3>
    <table>
        <tr>
            <th>Código</th>
            <th>Descrição</th>
            <th>Valor</th>
            <th>Tipo</th>
            <th>Pago</th>
            <th>Data do Pagamento</th>
            <th>Ações</th>
        </tr>
        <c:forEach items="${contas}" var="conta">
        <tr>
            <td>${conta.id}</td>
            <td>${conta.descricao}</td>
            <td>${conta.valor}</td>
            <td>${conta.tipo}</td>
            <td id="conta_${conta.id}">
                <c:if test="${conta.paga eq false}">
                Não
            </c:if>
            <c:if test="${conta.paga eq true}">
            Sim
        </c:if>
    </td>
    <td id="pagamento_${conta.id}"><fmt:formatDate value="${conta.dataPagamento.time}" pattern="dd/MM/yyyy"></fmt:formatDate></td>
    <td>
        <a href="removeConta?id=${conta.id}">Deletar</a>
        <c:if test="${conta.paga eq false}">
        <a href="#" id="buttonPagar_${conta.id}" onclick="pagaAgora(${conta.id})">Pagar</a>
    </c:if>
</td>
</tr>
</c:forEach>
</table>
<button onclick="logout()">Logout</button>
</body>
</html>