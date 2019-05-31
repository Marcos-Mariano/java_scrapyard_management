

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.jdbc.fornecedor.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file ="../WEB-INF/jspf/header.jspf"%>



<h2>Cadastro de Fornecedores</h2>
<table class="table table-dark table-striped text-center">
            <thead>
            <th> #</th>
            <th> Nome </th>
            <th>Comandos</th>
            </thead>
            
            <%Fornecedor fornecedor = new Fornecedor();%>
            <% for(Fornecedor c: fornecedor.getList()){ %>
                <tr>
                    <td><%=c.getId()%></td>
                    <td><%=c.getNome()%></td>
                        
                    <td>
                        <a href="alterar.jsp?index=<%=c.getId()%>">Alterar</a>
                        <a href="excluir.jsp?index=<%=c.getId()%>&name=<%=c.getNome()%>">Excluir</a>    
                    </td>
                </tr>
            <% } %>
        </table>
       <button type="button" class="btn text-light btn-dark float-right" id="buttonAddFornecedor"><a href="adicionar.jsp">Adicionar Novo</a></button>
  
        
    </body>
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</html>

<%
    if(request.getParameter("adicionarFornecedor")!=null){
        if(request.getParameter("adicionarFornecedor").equals("Enviar")){
            
            Fornecedor.incluirFornecedor(request.getParameter("txtnm"));
        }
        response.sendRedirect(request.getRequestURI());
    }
    
    if(request.getParameter("alterarFornecedor")!=null){
        if(request.getParameter("alterarFornecedor").equals("Alterar")){
            int index = Integer.parseInt(request.getParameter("index"));
            Fornecedor.alterarFornecedor(index, request.getParameter("txtnm"));
        }
        response.sendRedirect(request.getRequestURI());
    }    
    
    if(request.getParameter("excluirFornecedor")!=null){
        if(request.getParameter("excluirFornecedor").equals("Excluir")){
            int index = Integer.parseInt(request.getParameter("index"));
            Fornecedor.removerFornecedor(index);
        }
        response.sendRedirect(request.getRequestURI());
    }
    %>
