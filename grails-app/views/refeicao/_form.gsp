<%@ page import="dietadani.Refeicao" %>

<div class="fieldcontain ${hasErrors(bean: refeicaoInstance, field: 'data', 'error')} required">
    <label for="data">
        <g:message code="refeicao.data.label" default="Data" />
    </label>
    <g:datePicker name="data" precision="day"  value="${refeicaoInstance?.data}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: refeicaoInstance, field: 'nome', 'error')} ">
    <label for="nome">
		<g:message code="refeicao.nome.label" default="Nome" />

	</label>
    <g:select name="nome" from="${['Café da manha', 'Lanche da manha', 'Almoço', 'Café da tarde','Almoço','Lanche da noite']}"
        value="${refeicaoInstance?.nome}" />
</div>

<div class="fieldcontain ${hasErrors(bean: refeicaoInstance, field: 'alimentos', 'error')} ">
	<label for="alimentos">
		<g:message code="refeicao.alimentos.label" default="Alimentos" />
		
	</label>
	<g:select name="alimentos" from="${dietadani.Alimento.list(sort: "nome")}" multiple="multiple" optionKey="id" size="5" value="${refeicaoInstance?.alimentos*.id}" class="many-to-many"/>
</div>


