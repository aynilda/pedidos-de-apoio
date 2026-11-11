<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="pt.ecl.Html" %>

<%
String sala = (String) request.getAttribute("sala");
String tipo = (String) request.getAttribute("tipoAvaria");
String descricao = (String) request.getAttribute("descricao");

String erroSala = (String) request.getAttribute("erroSala");
String erroTipo = (String) request.getAttribute("erroTipo");
String erroDescricao = (String) request.getAttribute("erroDescricao");

if (sala == null) sala = "";
if (tipo == null) tipo = "";
if (descricao == null) descricao = "";

if (erroSala == null) erroSala = "";
if (erroTipo == null) erroTipo = "";
if (erroDescricao == null) erroDescricao = "";
%>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registar pedido | Apoio Escolar</title>
    <link rel="stylesheet" href="estilo.css">
</head>

<body>

<header class="topo">
    <div class="marca">APOIO<span>+</span></div>
    <span class="etiqueta">SUPORTE ESCOLAR</span>
</header>

<main class="container">

    <section class="introducao">
        <span class="sobretitulo">CENTRO DE ASSISTÊNCIA</span>
        <h1>Registar pedido de apoio</h1>
        <p>
            Comunica uma avaria ou problema informático
            existente numa sala da escola.
        </p>
    </section>

    <section class="painel">

        <div class="painel-titulo">
            <div>
                <h2>Dados do pedido</h2>
                <p>Preenche todos os campos obrigatórios.</p>
            </div>
            <span class="icone">+</span>
        </div>

        <form action="pedidos" method="post">

            <div class="campo">
                <label for="sala">Sala <span>*</span></label>

                <input
                    type="text"
                    id="sala"
                    name="sala"
                    placeholder="Ex.: B12"
                    value="<%= Html.escape(sala) %>"
                    maxlength="30"
                    required
                >

                <% if (!erroSala.isEmpty()) { %>
                    <small class="erro">
                        <%= Html.escape(erroSala) %>
                    </small>
                <% } %>
            </div>

            <div class="campo">
                <label for="tipoAvaria">
                    Tipo de avaria <span>*</span>
                </label>

                <select id="tipoAvaria" name="tipoAvaria" required>
                    <option value="">Seleciona uma opção</option>

                    <option value="Equipamento"
                        <%= "Equipamento".equals(tipo) ? "selected" : "" %>>
                        Equipamento
                    </option>

                    <option value="Software"
                        <%= "Software".equals(tipo) ? "selected" : "" %>>
                        Software
                    </option>

                    <option value="Rede"
                        <%= "Rede".equals(tipo) ? "selected" : "" %>>
                        Rede
                    </option>
                </select>

                <% if (!erroTipo.isEmpty()) { %>
                    <small class="erro">
                        <%= Html.escape(erroTipo) %>
                    </small>
                <% } %>
            </div>

            <div class="campo">
                <label for="descricao">
                    Descrição do problema <span>*</span>
                </label>

                <textarea
                    id="descricao"
                    name="descricao"
                    rows="5"
                    maxlength="1000"
                    placeholder="Descreve o problema com o máximo de detalhe possível..."
                    required
                ><%= Html.escape(descricao) %></textarea>

                <small class="ajuda">
                    Mínimo de 10 caracteres.
                </small>

                <% if (!erroDescricao.isEmpty()) { %>
                    <small class="erro">
                        <%= Html.escape(erroDescricao) %>
                    </small>
                <% } %>
            </div>

            <button type="submit">
                Enviar pedido <span>→</span>
            </button>

            <p class="nota">
                * Campos de preenchimento obrigatório
            </p>

        </form>
    </section>

    <footer>
        Suporte Informático Escolar · 2026
    </footer>

</main>

</body>
</html>
