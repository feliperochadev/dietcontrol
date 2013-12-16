

<%@ page contentType="text/html;charset=UTF-8" %>


<g:select name="alimentos" from="${dietadani.Alimento.list(sort: "nome")}" optionKey="id" size="1" value="${alimento?.id}" class="many-to-many"/>

<input type="button" value="Adicionar Alimento" onclick="${remoteFunction(
        controller:'alimento',
        action: 'addAlimento'
)}" />
