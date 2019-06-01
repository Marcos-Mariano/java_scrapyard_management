

<%@page import="br.com.fatecpg.jdbc.produtos.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file ="../WEB-INF/jspf/header.jspf"%>



<h2>VENDAS</h2>
<table class="table table-dark table-striped text-center">
            <thead>
            <th> #</th>
            <th> Valor </th>
            <th> Produto </th>
            <th> Vendedor </th>
            <th>Comandos</th>
            </thead>
            
            <%Produto produto = new Produto();%>
            <% for(Produto v: produto.getList()){ %>
                <tr>
                    <td><%=v.getId()%></td>
                    <td><%=v.getNome()%></td>
                    <td><%=v.getValor()%></td>
                    <td><%=v.getQuantidade()%></td>
                        
                    <td>
                        <a href="alterar.jsp?index=<%=v.getId()%>&name=<%=v.getNome()%>&valor=<%=v.getValor()%>&vendedor=<%=v.getQuantidade()%>">Alterar</a>
                        <a href="excluir.jsp?index=<%=v.getId()%>&name=<%=v.getNome()%>&valor=<%=v.getValor()%>&vendedor=<%=v.getQuantidade()%>">Excluir</a>    
                    </td>
                </tr>
            <% } %>
        </table>
       <button type="button" class="btn text-light btn-dark float-right" id="buttonAddCliente"><a href="adicionar.jsp">Adicionar Novo</a></button>
  
        
    </body>
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</html>

<%
    if(request.getParameter("adicionarProduto")!=null){
        if(request.getParameter("adicionarProduto").equals("Enviar")){
            String nomeProduto = request.getParameter("txtnm");
            String valor = request.getParameter("txtvalor");
            String quantidade = request.getParameter("txtquantidade");
            String unidade = request.getParameter("txtunidade");
            
            Produto.incluirProduto(nomeProduto,valor,quantidade,unidade);
        }
        response.sendRedirect(request.getRequestURI());
    }
    
    if(request.getParameter("alterarProduto")!=null){
        if(request.getParameter("alterarProduto").equals("Alterar")){
            int index = Integer.parseInt(request.getParameter("index"));
            String nomeProduto = request.getParameter("txtnm");
            String valor = request.getParameter("txtvalor");
            String quantidade = request.getParameter("txtquantidade");
            String unidade = request.getParameter("txtunidade");
            Produto.alterarProduto(index,nomeProduto,valor,quantidade,unidade);
        }
        response.sendRedirect(request.getRequestURI());
    }    
    
    if(request.getParameter("excluirProduto")!=null){
        if(request.getParameter("excluirProduto").equals("Excluir")){
            int index = Integer.parseInt(request.getParameter("index"));
            Produto.removerProduto(index);
        }
        response.sendRedirect(request.getRequestURI());
    }
    %>
