<%@ page import="dietadani.Refeicao" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'refeicao.label', default: 'Refeicao')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
    <script>
        function adicionarAlimento() {
            var novoDiv = $('#alimentos').html();
            var idNovoDiv = 'novoAlimento' + ($('#divAlimentos > div').size() + 1);
            novoDiv = ('<div id=' + idNovoDiv + ' style="margin-left: 223px; margin-top: 20px;" ><select name="alimentos" size="1" class="many-to-many" id="alimentos">' + novoDiv + '</select><input title="Remover Alimento" type="button" class="buttonRemoverAlimento" onclick="remover(' + idNovoDiv + ')" /></div>');
            $(novoDiv).appendTo('#divAlimentos');
        }

        function remover(div) {
            $(div).remove();
        }
    </script>
</head>

<body>
<a href="#edit-refeicao" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" controller="alimento" action="list"><g:message code="Alimentos"/></g:link></li>
    </ul>
</div>

<div id="edit-refeicao" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${refeicaoInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${refeicaoInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form method="post">
        <g:hiddenField name="id" value="${refeicaoInstance?.id}"/>
        <g:hiddenField name="version" value="${refeicaoInstance?.version}"/>
        <fieldset class="form">
            <div class="fieldcontain ${hasErrors(bean: refeicaoInstance, field: 'data', 'error')} required">
                <label for="data">
                    <g:message code="refeicao.data.label" default="Data"/>
                </label>
                <g:datePicker name="data" precision="day" value="${refeicaoInstance?.data}"/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: refeicaoInstance, field: 'nome', 'error')} ">
                <label for="nome">
                    <g:message code="refeicao.nome.label" default="Nome"/>

                </label>
                <g:select name="nome"
                          from="${['Café da manha', 'Lanche da manha', 'Almoço', 'Café da tarde', 'Jantar', 'Lanche da noite']}"
                          value="${refeicaoInstance?.nome}"/>
            </div>

            <div id="divAlimentos"
                 class="fieldcontain ${hasErrors(bean: refeicaoInstance, field: 'alimentos', 'error')} required">
                <label for="alimentos">
                    <g:message code="refeicao.alimentos.label" default="Alimentos"/>

                </label>
                <g:each in="${refeicaoInstance.alimentos}" status="i" var="alimento">
                    <g:if test="${i == 0}">
                            <g:select name="alimentos" from="${dietadani.Alimento.list(sort: "nome")}" optionKey="id"
                                      size="1" value="${alimento.id}" class="many-to-many"/>
                            <input title="Adicionar Alimento" type="button" class="buttonAddAlimento"
                                   onclick="adicionarAlimento()"/>
                    </g:if>
                    <g:else>
                        <div id="${i}" class="novoDivAlimento">
                            <g:select name="alimentos" from="${dietadani.Alimento.list(sort: "nome")}" optionKey="id"
                                      size="1" value="${alimento.id}"/>
                            <input title="Remover Alimento" type="button" class="buttonRemoverAlimento"
                                   onclick="remover('#' +${i})"/>
                        </div>
                    </g:else>
                </g:each>

            </div>

        </fieldset>
        <fieldset class="buttons">
            <g:actionSubmit class="save" action="update"
                            value="${message(code: 'default.button.update.label', default: 'Update')}"/>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate=""
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
