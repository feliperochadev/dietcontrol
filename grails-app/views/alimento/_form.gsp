<%@ page import="dietadani.Alimento" %>



<div class="fieldcontain ${hasErrors(bean: alimentoInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="alimento.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${alimentoInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alimentoInstance, field: 'calorias', 'error')} required">
	<label for="calorias">
		<g:message code="alimento.calorias.label" default="Calorias" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="calorias" value="${fieldValue(bean: alimentoInstance, field: 'calorias')}" required=""/>
</div>

