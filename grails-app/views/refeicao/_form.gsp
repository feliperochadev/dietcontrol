<%@ page import="dietadani.Refeicao" %>
<script>
    function adicionarAlimento()
    {
        var novoDiv = $('#alimentos').html();
        var idNovoDiv = 'novoAlimento'+($('#divAlimentos > div').size() + 1);
        novoDiv = ('<div id='+idNovoDiv+' class="novoDivAlimento" ><select name="alimentos" size="1" class="many-to-many" id="alimentos">'+novoDiv+'</select><input title="Remover Alimento" type="button" class="buttonRemoverAlimento" onclick="remover('+idNovoDiv+')" /></div>');
        $(novoDiv).appendTo('#divAlimentos');
    }

    function remover(div)
    {
        $(div).remove();
    }
</script>


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
    <g:select name="nome" from="${['Café da manha', 'Lanche da manha', 'Almoço', 'Café da tarde','Jantar','Lanche da noite']}"
        value="${refeicaoInstance?.nome}" />
</div>

<div id="divAlimentos" class="fieldcontain ${hasErrors(bean: refeicaoInstance, field: 'alimentos', 'error')} required">
	<label for="alimentos">
		<g:message code="refeicao.alimentos.label" default="Alimentos" />
		
	</label>
	<g:select name="alimentos" from="${dietadani.Alimento.list(sort: "nome")}" optionKey="id" size="1" value="${refeicaoInstance?.alimentos*.id}" class="many-to-many"/>
    <input title="Adicionar Alimento" type="button" class="buttonAddAlimento" onclick="adicionarAlimento()" />
</div>




