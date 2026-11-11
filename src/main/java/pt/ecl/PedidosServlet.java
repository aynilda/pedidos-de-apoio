package pt.ecl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Set;

@WebServlet("/pedidos")
public class PedidosServlet extends HttpServlet {

    private static final Set<String> TIPOS =
            Set.of("Equipamento", "Software", "Rede");

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String sala = request.getParameter("sala");
        String tipoAvaria = request.getParameter("tipoAvaria");
        String descricao = request.getParameter("descricao");

        sala = sala == null ? "" : sala.trim();
        tipoAvaria = tipoAvaria == null ? "" : tipoAvaria.trim();
        descricao = descricao == null ? "" : descricao.trim();

        String erroSala = "";
        String erroTipo = "";
        String erroDescricao = "";

        if (sala.isEmpty()) {
            erroSala = "O campo sala é obrigatório.";
        }

        if (!TIPOS.contains(tipoAvaria)) {
            erroTipo = "Seleciona um tipo de avaria válido.";
        }

        if (descricao.length() < 10) {
            erroDescricao =
                    "A descrição deve ter pelo menos 10 caracteres.";
        }

        request.setAttribute("sala", sala);
        request.setAttribute("tipoAvaria", tipoAvaria);
        request.setAttribute("descricao", descricao);

        request.setAttribute("erroSala", erroSala);
        request.setAttribute("erroTipo", erroTipo);
        request.setAttribute("erroDescricao", erroDescricao);

        if (!erroSala.isEmpty()
                || !erroTipo.isEmpty()
                || !erroDescricao.isEmpty()) {

            request.getRequestDispatcher("/formulario.jsp")
                    .forward(request, response);
            return;
        }

        request.getRequestDispatcher("/confirmacao.jsp")
                .forward(request, response);
    }
}
