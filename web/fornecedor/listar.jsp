
<%@page import="br.com.fatecpg.cadastro.BD"%>
<%@page import="br.com.fatecpg.cadastro.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../style.css">
        <title>Listar Fornecedores</title>
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
                        <a class="nav-link" href="../cliente/listar.jsp">Listar Clientes</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="listar.jsp">Listar Fornecedores</a>
                    </li>
                </ul>
            </div>
        </nav>
      
        <h1 class="titulo2">Lista - Fornecedores</h1>
        <button type="button" class="btn btn-success" id="buttonAddFornecedor"><a href="adicionar.jsp">Adicionar Fornecedor</a></button>
        
        <table class="table table-dark table-sm" border="1">
            <tr>
                <th>Índice</th>
                <th>Nome</th>
                <th>Razão Social</th>
                <th>CNPJ</th>
                <th>Endereço</th>
                <th>E-mail</th>
                <th>Telefone</th>
                
                <th>Comandos</th>
            </tr>
            
            <% for(Fornecedor c: BD.getFornecedor()){ %>
                <% int index = BD.getFornecedor().indexOf(c); %>
                <tr>
                    <td><%=index%></td>
                    <td><%=c.getNome()%></td>
                    <td><%=c.getRazaoSocial()%></td>
                    <td><%=c.getCnpj()%></td>
                    <td><%=c.getEndereco()%></td>
                    <td><%=c.getEmail()%></td>
                    <td><%=c.getTelefone()%></td>
                    
                    <td>
                        <a href="alterar.jsp?index=<%=index%>">           Alterar    |</a>
                        <a href="excluir.jsp?index=<%=index%>">   Excluir</a>
                    </td>
                </tr>
            <% } %>
        </table>
        <br><br>
        <hr/>
        <br><br>
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>

<%
    if(request.getParameter("adicionarFornecedor")!=null){
        if(request.getParameter("adicionarFornecedor").equals("Sim")){
            Fornecedor fornecedor = new Fornecedor();
            fornecedor.setNome(request.getParameter("nomeFornecedor"));
            fornecedor.setRazaoSocial(request.getParameter("razaoSocialFornecedor"));
            fornecedor.setCnpj(request.getParameter("cnpjFornecedor"));
            fornecedor.setEndereco(request.getParameter("enderecoFornecedor"));
            fornecedor.setEmail(request.getParameter("emailFornecedor"));
            fornecedor.setTelefone(request.getParameter("telefoneFornecedor"));
            BD.getFornecedor().add(fornecedor);
        }
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("alterarFornecedor")!=null){
        if(request.getParameter("alterarFornecedor").equals("Sim")){
            int index = Integer.parseInt(request.getParameter("index"));
             Fornecedor fornecedor = new Fornecedor();
            fornecedor.setNome(request.getParameter("nomeFornecedor"));
            fornecedor.setRazaoSocial(request.getParameter("razaoSocialFornecedor"));
            fornecedor.setCnpj(request.getParameter("cnpjFornecedor"));
            fornecedor.setEndereco(request.getParameter("enderecoFornecedor"));
            fornecedor.setEmail(request.getParameter("emailFornecedor"));
            fornecedor.setTelefone(request.getParameter("telefoneFornecedor"));
            BD.getFornecedor().set(index, fornecedor);
        }
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("excluirFornecedor")!=null){
        if(request.getParameter("excluirFornecedor").equals("Sim")){
            int index = Integer.parseInt(request.getParameter("index"));
            BD.getFornecedor().remove(index);
        }
        response.sendRedirect(request.getRequestURI());
    }
%>