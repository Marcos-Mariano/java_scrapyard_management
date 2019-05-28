

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.jdbc.cliente.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file ="../WEB-INF/jspf/header.jspf"%>




        <table>
            <%Cliente cliente = new Cliente();%>
            <% for(Cliente c: cliente.getList()){ %>
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
       <button type="button" class="btn text-light btn-dark float-right" id="buttonAddCliente"><a href="adicionar.jsp">Adicionar Novo</a></button>
  
        
    </body>
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</html>

<%
    if(request.getParameter("adicionarCliente")!=null){
        if(request.getParameter("adicionarCliente").equals("Enviar")){
            
            Cliente.incluirCliente(request.getParameter("txtnm"));
        }
        response.sendRedirect(request.getRequestURI());
    }
    
    if(request.getParameter("alterarCliente")!=null){
        if(request.getParameter("alterarCliente").equals("Alterar")){
            int index = Integer.parseInt(request.getParameter("index"));
            Cliente.alterarCliente(index, request.getParameter("txtnm"));
        }
        response.sendRedirect(request.getRequestURI());
    }    
    
    if(request.getParameter("excluirCliente")!=null){
        if(request.getParameter("excluirCliente").equals("Sim")){
            int index = Integer.parseInt(request.getParameter("index"));
            Cliente.removerCliente(index);
        }
        response.sendRedirect(request.getRequestURI());
    }
    %>
