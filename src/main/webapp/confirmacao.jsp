<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="pt.ecl.Html" %>

<%
String sala = (String) request.getAttribute("sala");
String tipo = (String) request.getAttribute("tipoAvaria");
String descricao = (String) request.getAttribute("descricao");

if (sala == null || tipo == null || descricao == null) {
    response.sendRedirect("formulario.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pedido confirmado | Apoio Escolar</title>
    <link rel="stylesheet" href="estilo.css">
</head>

<body>

<header class="topo">
    <div class="marca">APOIO<span>+</span></div>
    <span class="etiqueta">SUPORTE ESCOLAR</span>
</header>

<main class="container">

    <section class="painel sucesso">

        <div class="simbolo">✓</div>

        <span class="sobretitulo">PEDIDO REGISTADO</span>

        <h1>Pedido validado com sucesso!</h1>

        <p>
            Os dados foram recebidos e passaram todas as validações.
        </p>

        <div class="detalhes">

            <h2>Resumo do pedido</h2>

            <div class="linha">
                <span>Sala</span>
                <strong><%= Html.escape(sala) %></strong>
            </div>

            <div class="linha">
                <span>Tipo de avaria</span>
                <strong><%= Html.escape(tipo) %></strong>
            </div>

            <div class="descricao">
                <span>Descrição</span>
                <p><%= Html.escape(descricao) %></p>
            </div>

        </div>

        <a class="botao-secundario" href="formulario.jsp">
            Voltar ao formulário
        </a>

    </section>

    <footer>
        Suporte Informático Escolar · 2026
    </footer>

</main>

</body>
</html>
