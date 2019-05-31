
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.jdbc.produtos.Produtos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file ="../WEB-INF/jspf/header.jspf"%>

 
          

<h1 class="text-center">Cadastro de Produtos</h1>
<form action="listar.jsp">
<div class="form-content ">
  <div class="form-group ">
    <label for="exampleInputEmail1">ID</label>
      <input type="number" name="txtid" min="1" value="" placeholder="Auto Gerado" readonly class="form-control">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Nome</label>
      <input type="text" name="txtnm" maxlength="100" value="" class="form-control" required >
  </div>
  <div class="text-center">
    <input class="btn btn-primary mr-2" type="submit" name="adicionarProduto" value="Enviar"/>
    <input class="btn btn-danger mr-2" type="reset" name="adicionarProduto" value="Limpar"/>
    <a href="listar.jsp" class="btn btn-info">Voltar</a>
  </div></div>
    </form>