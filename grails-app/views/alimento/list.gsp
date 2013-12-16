
<%@ page import="dietadani.Alimento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alimento.label', default: 'Alimento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-alimento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="Cadastrar Alimento" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-alimento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'alimento.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="calorias" title="${message(code: 'alimento.calorias.label', default: 'Calorias')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${alimentoInstanceList}" status="i" var="alimentoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="edit" id="${alimentoInstance.id}">${fieldValue(bean: alimentoInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: alimentoInstance, field: "calorias")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${alimentoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
