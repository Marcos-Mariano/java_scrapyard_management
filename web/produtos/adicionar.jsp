
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.jdbc.cliente.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file ="../WEB-INF/jspf/header.jspf"%>

 
          <% int i = 0;
              for(Cliente c: Cliente.getList()){ %>
                <% int index = Cliente.getList().indexOf(c); 
                i++;



               }    
            i = i+ 1;%>


<h1 class="text-center">Cadastro de Clientes</h1>
<form>
<div class="form-content ">
  <div class="form-group ">
    <label for="exampleInputEmail1">ID</label>
      <input type="number" name="txtid" min="1" value="" placeholder="<%=i%>" readonly class="form-control">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Nome</label>
      <input type="text" name="txtnm" maxlength="100" pattern="" value="" class="form-control">
  </div>
  
   <div class="form-group">
    <label for="exampleInputEmail1">Valor</label>
      <input type="text" name="txtvalor" maxlength="100" pattern="" value="" class="form-control">
  </div>
  
   <div class="form-group">
    <label for="exampleInputEmail1">Quantidade</label>
      <input type="text" name="txtquantidade" maxlength="100" pattern="" value="" class="form-control">
  </div>
  
   <div class="form-group">
    <label for="exampleInputEmail1">Unidade de medida</label>
      <input type="text" name="txtunidademedidas" maxlength="100" pattern="" value="" class="form-control">
  </div>
  
  
  
  <div class="text-center">
    <input class="btn btn-primary mr-2" type="submit" value="Enviar"/>
    <input class="btn btn-danger mr-2" type="reset" value="Limpar"/>
    <a href="listar.jsp" class="btn btn-info">Voltar</a>
  </div></div>
    </form>
  
  