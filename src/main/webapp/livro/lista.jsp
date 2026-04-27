<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>

<html>
<head>
<title>Livraria Virtual</title>
</head>
<body>
    <fmt:setLocale value="pt_BR" />

    <div align="center">
        <h1>Gerenciamento de Livros</h1>
        <h2>
            <a href="/${requestScope.contextPath}">Menu Principal</a> &nbsp;&nbsp;&nbsp;
            <a href="/${requestScope.contextPath}/livros/cadastro">Adicione Novo Livro</a>
        </h2>
    </div>

    <div align="center">
        <table border="1">
            <caption>Lista de Livros</caption>
            <tr>
                <th>ID</th>
                <th>Titulo</th>
                <th>Editora</th>
                <th>Autor</th>
                <th>Ano</th>
                <th>Preco</th>
                <th>Acoes</th>
            </tr>
            <c:forEach var="livro" items="${requestScope.listaLivros}">
                <tr>
                    <td>${livro.id}</td>
                    <td>${livro.titulo}</td>
                    <td>${livro.editora.nome}</td>
                    <td>${livro.autor}</td>
                    <td>${livro.ano}</td>
                    <td>R$ <fmt:formatNumber value="${livro.preco}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>
                        <a href="/${requestScope.contextPath}/livros/edicao?id=${livro.id}">Edicao</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="/${requestScope.contextPath}/livros/remocao?id=${livro.id}"
                            onclick="return confirm('Tem certeza de que deseja excluir este item?');">Remocao</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
