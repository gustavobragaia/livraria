<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<fmt:setLocale value="pt_BR" />


<table border="1">
    <caption>
        <c:choose>
            <c:when test="${livro != null}">Edicao</c:when>
            <c:otherwise>Cadastro</c:otherwise>
        </c:choose>
    </caption>
    <c:if test="${livro != null}">
        <input type="hidden" name="id" value="${livro.id}" />
    </c:if>
    <tr>
        <td><label for="titulo">Titulo</label></td>
        <td><input type="text" id="titulo" name="titulo" size="45" required value="${livro.titulo}" /></td>
    </tr>
    <tr>
        <td><label for="autor">Autor</label></td>
        <td><input type="text" id="autor" name="autor" size="45" required value="${livro.autor}" /></td>
    </tr>
    <tr>
        <td><label for="editora">Editora</label></td>
        <td>
            <select id="editora" name="editora">
                <c:forEach items="${editoras}" var="editora">
                    <option value="${editora.key}" ${livro.editora.nome==editora.value ? 'selected' : '' }>${editora.value}</option>
                </c:forEach>
            </select>
        </td>
    </tr>
    <tr>
        <td><label for="ano">Ano</label></td>
        <td><input type="number" id="ano" name="ano" size="5" required min="1500" value="${livro.ano}" /></td>
    </tr>
    <tr>
        <td><label for="preco">Preco</label></td>
        <td>
            <c:if test="${livro != null}">
                <fmt:formatNumber value="${livro.preco}" minFractionDigits="2" maxFractionDigits="2" var="precoFormatado"/>
            </c:if>
            <input type="text" id="preco" name="preco" required size="10"
                placeholder="54,00"
                pattern="^\\d{1,3}(\\.\\d{3})*(,\\d{2})?$|^\\d+(\\.\\d{2})?$"
                value="${livro != null ? precoFormatado : ''}" />
        </td>
                
    </tr>
    <tr>
        <td colspan="2" align="center"><input type="submit" value="Salvar" /></td>
    </tr>
</table>
