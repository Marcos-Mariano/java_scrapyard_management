

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.jdbc.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../style.css">
        <title>Listar Clientes</title>
    </head>
    
    <body>
        
        <!-- MENU -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark nav-justify-content-center">

            <div class="collapse navbar-collapse">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="../index.jsp">Página Inicial</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="listar.jsp">Listar Clientes</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="../fornecedor/listar.jsp">Listar Fornecedores</a>
                    </li>
                </ul>
            </div>
        </nav>
        
        <h1 class="titulo2">Lista - Clientes</h1>
        <button type="button" class="btn btn-success" id="buttonAddCliente"><a href="adicionar.jsp">Adicionar Cliente</a></button>
  
        <table class="table table-dark table-sm" border="1">
            <tr>
                <th>Índice</th>
                <th>Nome</th>
         
                <th>Comandos</th>
            </tr>
           

            <% for(Cliente c: Cliente.getList()){ %>
                <% int index = Cliente.getList().indexOf(c); %>
                <tr>
                    <td><%=index%></td>
                    <td><%=c.getNome()%></td>
                        
                    <td>
                        <a href="alterar.jsp?index=<%=index%>">       Alterar    |</a>
                        <a href="excluir.jsp?index=<%=index%>">   Excluir</a>    
                    </td>
                </tr>
            <% } %>
        </table>
        <hr/>
        
    </body>
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</html>

<%
    if(request.getParameter("adicionarCliente")!=null){
        if(request.getParameter("adicionarCliente").equals("Sim")){
            
            Cliente.incluirCliente(request.getParameter("nomeCliente"));
        }
        response.sendRedirect(request.getRequestURI());
    }
    
    if(request.getParameter("alterarCliente")!=null){
        if(request.getParameter("alterarCliente").equals("Sim")){
            int index = Integer.parseInt(request.getParameter("index"));
            Cliente.alterarCliente(index, request.getParameter("nomeCliente"));
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
