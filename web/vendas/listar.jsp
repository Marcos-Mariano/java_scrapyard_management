

<%@page import="br.com.fatecpg.jdbc.vendas.Venda"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file ="../WEB-INF/jspf/header.jspf"%>



<h2>Vendas</h2>
<table class="table table-dark table-striped text-center">
            <thead>
            <th> #</th>
           
            <th> Produto </th>
             <th> Valor </th>
            <th> Vendedor </th>
            <th>Comandos</th>
            </thead>
            
            <%Venda venda = new Venda();%>
            <% for(Venda v: venda.getList()){ %>
                <tr>
                    <td><%=v.getId()%></td>
                     <td><%=v.getValor()%></td>
                    <td>R$  <%=v.getNome()%></td>
                   
                    <td><%=v.getVendedor()%></td>
                        
                    <td>
                        <a href="alterar.jsp?index=<%=v.getId()%>&name=<%=v.getNome()%>&valor=<%=v.getValor()%>&vendedor=<%=v.getVendedor()%>">Alterar</a>
                        <a href="excluir.jsp?index=<%=v.getId()%>&name=<%=v.getNome()%>&valor=<%=v.getValor()%>&vendedor=<%=v.getVendedor()%>">Excluir</a>    
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
    if(request.getParameter("adicionarVenda")!=null){
        if(request.getParameter("adicionarVenda").equals("Enviar")){
            String nomeProduto = request.getParameter("txtnm");
            String valor = request.getParameter("txtvalor");
            String vendedor = request.getParameter("txtvendedor");
            
            Venda.incluirVenda(nomeProduto,valor,vendedor);
        }
        response.sendRedirect(request.getRequestURI());
    }
    
    if(request.getParameter("alterarVenda")!=null){
        if(request.getParameter("alterarVenda").equals("Alterar")){
            int index = Integer.parseInt(request.getParameter("index"));
            String nomeProduto = request.getParameter("txtnm");
            String valor = request.getParameter("txtvalor");
            String vendedor = request.getParameter("txtvendedor");
            Venda.alterarVenda(index,nomeProduto,valor,vendedor);
        }
        response.sendRedirect(request.getRequestURI());
    }    
    
    if(request.getParameter("excluirVenda")!=null){
        if(request.getParameter("excluirVenda").equals("Excluir")){
            int index = Integer.parseInt(request.getParameter("index"));
            Venda.removerVenda(index);
        }
        response.sendRedirect(request.getRequestURI());
    }
    %>
