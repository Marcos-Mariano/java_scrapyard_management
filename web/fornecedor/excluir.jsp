
<%@page import="br.com.fatecpg.cadastro.Fornecedor"%>
<%@page import="br.com.fatecpg.cadastro.Cliente"%>
<%@page import="br.com.fatecpg.cadastro.BD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../style.css">
        <title>Excluir Fornecedor</title>
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
        
        <%int i = Integer.parseInt(request.getParameter("index"));%>
        <%Fornecedor forn = BD.getFornecedor().get(i); %>
     
        <form action="listar.jsp">  
            <div class="formulario">
                <h2 class="titulo">Excluir Fornecedor</h2>
                    <div class="form-group row">
                        <div class="col-md-4">
                            <label for="nome">Nome</label>
                            <input type="text" class="form-control" id="nome1" name="nomeFornecedor" value="<%=forn.getNome()%>" disabled>
                        </div>
                        <div class="col-md-5">
                            <label for="razaoSocial">Razão social</label>
                            <input type="text" class="form-control" id="razaoSocial1" name="razaoSocialClienteFornecedor" value="<%=forn.getRazaoSocial()%>" disabled>
                        </div>
                        
                        <div class="col-md-3">
                            <label for="cnpj">CNPJ</label>
                            <input type="text" class="form-control" id="cnpj1" name="cnpjFornecedor" value="<%=forn.getCnpj()%>" disabled>
                        </div>
                    </div>

                    <div class="form-group row">                   
                         <div class="form-group col-md-5">
                            <label for="endereco">Endereço</label>
                            <input type="text" class="form-control" id="endereco1" name="enderecoFornecedor" value="<%=forn.getEndereco()%>" disabled>
                        </div>
                        
                        <div class="form-group col-md-4">
                            <label for="email">E-mail</label>
                            <input type="text" class="form-control" id="email1" name="emailFornecedor" value="<%=forn.getEmail()%>" disabled>
                        </div>
                        
                        <div class="form-group col-md-3">
                            <label for="telefone">Telefone</label>
                            <input type="text" class="form-control" id="telefone1" name="telefoneFornecedor" value="<%=forn.getTelefone()%>" disabled>
                        </div>
                    </div>
                        
                    <hr/>
                   <h2 class="confirmacao">Deseja excluir fornecedor?</h2>
                   <input type="submit" name="excluirFornecedor" value="Não" class="confirmacaoClienteNao btn btn-danger"/>
                   <input type="submit" name="excluirFornecedor" value="Sim" class="confirmacaoClienteSim btn btn-primary"/>
                   <input type="hidden" name="index" value="<%=i%>">
                    <br><br>
            </div>
        </form>
                        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
