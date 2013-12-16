<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
    <style type="text/css" media="screen">
    #status {
        background-color: #eee;
        border: .2em solid #fff;
        margin: 2em 2em 1em;
        padding: 1em;
        width: 12em;
        float: left;
        -moz-box-shadow: 0px 0px 1.25em #ccc;
        -webkit-box-shadow: 0px 0px 1.25em #ccc;
        box-shadow: 0px 0px 1.25em #ccc;
        -moz-border-radius: 0.6em;
        -webkit-border-radius: 0.6em;
        border-radius: 0.6em;
    }

    .ie6 #status {
        display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
    }

    #status ul {
        font-size: 0.9em;
        list-style-type: none;
        margin-bottom: 0.6em;
        padding: 0;
    }

    #status li {
        line-height: 1.3;
    }

    #status h1 {
        text-transform: uppercase;
        font-size: 1.1em;
        margin: 0 0 0.3em;
    }

    #page-body {
        margin: 2em 1em 1.25em 18em;
    }

    h2 {
        margin-top: 1em;
        margin-bottom: 0.3em;
        font-size: 1em;
    }

    p {
        line-height: 1.5;
        margin: 0.25em 0;
    }

    #controller-list ul {
        list-style-position: inside;
    }

    #controller-list li {
        line-height: 1.3;
        list-style-position: inside;
        margin: 0.25em 0;
    }

    @media screen and (max-width: 480px) {
        #status {
            display: none;
        }

        #page-body {
            margin: 0 1em 1em;
        }

        #page-body h1 {
            margin-top: 0;
        }
    }
    </style>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="Principal"/></a></li>
        <li><g:link class="create" controller="refeicao" action="create"><g:message
                code="Cadastrar Refeição"/></g:link></li>
        <li><g:link class="list" controller="alimento" action="list"><g:message code="Alimentos"/></g:link></li>
    </ul>
</div>
<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<table>
    <tr>
        <td><strong>Data</strong></td>
        <td><strong>Quantidade de Refeições</strong></td>
        <td> <strong>Quantidade de Calorias</strong></td>
    </tr>
    <g:each in="${refeicoes}" status="i" var="refeicao">
        <tr>
            <td>
                <g:link action="list" controller="refeicao" params="[data1: refeicao[0].toString().substring(0,10).replace('-','/')]"><g:formatDate format="dd/MM/yyyy" date="${refeicao[0]}"/></g:link>
            </td>
            <td>
                <p>${refeicao[1]}</p>
            </td>
            <td>
                <p>${totalCaloriasList[i]}</p>
            </td>
        </tr>
    </g:each>
</table>
</div>
</body>
</html>
