<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'refeicao.label', default: 'Refeicao')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-refeicao" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" controller="alimento" action="create"><g:message code="Cadastrar Alimento"/></g:link></li>
    </ul>
</div>

<div id="list-refeicao" class="content scaffold-list" role="main">
    <h1 style="text-align: center">Refeições do dia <g:formatDate date="${refeicaoInstanceList.first().data}"
                                                                  format="dd-MM-yyyy"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

        </tr>
        </thead>
        <tbody>
        <g:each in="${refeicaoInstanceList}" status="i" var="refeicaoInstance">
            <tr class="odd2">
                <td><h2 class="linkTitulo"><g:link action="edit"
                                    id="${refeicaoInstance.id}">${fieldValue(bean: refeicaoInstance, field: "nome")}</g:link></h2>
                </td>
                <td></td>
            </tr>
            <g:each in="${refeicaoInstance.alimentos}" status="x" var="alimentoInstance">
                <g:if test="${x == 0}">
                    <tr>
                        <td><strong>Alimento:</strong></td>
                        <td><strong>Calorias:</strong></td>
                    </tr>
                </g:if>
                <tr>
                    <td><p>${alimentoInstance.nome}</p></td>
                    <td><p>${alimentoInstance.calorias}</p></td>
                </tr>
            </g:each>
            <tr class="totalCalorias">
            <td><strong>Total de calorias da refeição:</strong></td>
            <td><strong>${refeicaoInstance.alimentos*.calorias.sum()}</strong></td>
            </tr>
        </g:each>
        <tr>
            <td>
                <h3>Total de Calorias do dia: </h3>
            </td>
            <td>
                <h3>${totalCalorias}</h3>
            </td>
        </tr>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${refeicaoInstanceTotal}"/>
    </div>
</div>

</body>
</html>