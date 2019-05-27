
<%@page import="br.com.fatecpg.cadastro.BD"%>
<%@page import="br.com.fatecpg.cadastro.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../style.css">
        <title>Alterar Cliente</title>
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
           
        <%int i = Integer.parseInt(request.getParameter("index"));%>
        <%Cliente cliente = BD.getClientes().get(i);  %>
            
            <form action="listar.jsp">
                <div class="formulario">
                    <h2 class="titulo">Alterar Cliente</h2>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <label for="nome">Nome</label>
                                <input type="text" class="form-control" id="nome1" name="nomeCliente" value="<%=cliente.getNome()%>">
                            </div>
                            
                            <div class="col-md-3">
                                <label for="cpf">CPF</label>
                                <input type="text" class="form-control" id="cpf1" name="cpfCliente" value="<%=cliente.getCpf()%>">
                            </div>

                            <div class="form-group col-md-3">
                                <label for="rg">RG</label>
                                <input type="text" class="form-control" id="rg1" name="rgCliente" value="<%=cliente.getRg()%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="form-group col-md-5">
                                <label for="email">E-mail</label>
                                <input type="text" class="form-control" id="email1" name="emailCliente" value="<%=cliente.getEmail()%>">
                            </div>
                            
                            <div class="form-group col-md-7">
                                <label for="endereco">Endereço</label>
                                <input type="text" class="form-control" id="endereco1" name="enderecoCliente" value="<%=cliente.getEndereco()%>">
                            </div>
                       </div>

                        <div class="form-group row">
                            <div class="form-group col-md-4">
                                <label for="telefone">Telefone</label>
                                <input type="text" class="form-control" id="telefone1" name="telefoneCliente" value="<%=cliente.getTelefone()%>">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="celular">Celular</label>
                                <input type="text" class="form-control" id="celular1" name="celularCliente" value="<%=cliente.getCelular()%>">
                            </div>
                        </div>

                        <hr/>
                        <h2 class="confirmacao">Deseja alterar cliente?</h2>
                        <input type="submit" name="alterarCliente" value="Não" class="confirmacaoClienteNao btn btn-danger"/>
                        <input type="submit" name="alterarCliente" value="Sim" class="confirmacaoClienteSim btn btn-primary"/>
                        <input type="hidden" name="index" value="<%=i%>">
                        <br><br>
                </div>
            </form>
            
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>

