
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.jdbc.produtos.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file ="../WEB-INF/jspf/header.jspf"%>

<%int i = Integer.parseInt(request.getParameter("index"));%>
<%String nomeProduto = request.getParameter("name");%>
<%String valor = request.getParameter("valor");%>
<%String quantidade = request.getParameter("quantidade");%>
<%String unidade = request.getParameter("unidade");%>

<h1 class="text-center vermelho">Exclusão de Produtos</h1>
<form action="listar.jsp">
<div class="form-content ">
  <div class="form-group ">
    <label for="exampleInputEmail1">ID</label>
      <input type="number" name="txtid" min="1" value="" placeholder="<%=i%>" readonly class="form-control" >
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Nome</label>
    <input type="text" name="txtnm" maxlength="100" value="" placeholder="<%=nomeProduto%>" readonly class="form-control">
  </div>
    <div class="form-group">
    <label for="exampleInputEmail1">Valor</label>
      <input type="text" name="txtvalor" maxlength="100" value="" placeholder="<%=valor%>" readonly class="form-control">
  </div>
    <div class="form-group">
    <label for="exampleInputEmail1">Quantiade</label>
      <input type="text" name="txtquantidade" maxlength="100" value="" placeholder="<%=quantidade%>" readonly class="form-control">
  </div>
   <div class="form-group">
    <label for="exampleInputEmail1">unidade</label>
      <input type="text" name="txtunidade" maxlength="100" value="" placeholder="<%=unidade%>" readonly class="form-control">
  </div>
  <div class="text-center">
    <input class="btn btn-primary mr-2" type="submit" name="excluirProduto" value="Excluir"/>
    <input class="btn btn-danger mr-2" type="reset" name="excluirProduto" value="Limpar"/>
    <input type="hidden" name="index" value="<%=i%>">
    <a href="listar.jsp" class="btn btn-info">Voltar</a>
  </div></div>
    </form>