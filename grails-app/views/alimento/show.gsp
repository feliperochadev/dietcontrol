
<%@ page import="dietadani.Alimento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alimento.label', default: 'Alimento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-alimento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-alimento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list alimento">
			
				<g:if test="${alimentoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="alimento.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${alimentoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alimentoInstance?.calorias}">
				<li class="fieldcontain">
					<span id="calorias-label" class="property-label"><g:message code="alimento.calorias.label" default="Calorias" /></span>
					
						<span class="property-value" aria-labelledby="calorias-label"><g:fieldValue bean="${alimentoInstance}" field="calorias"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alimentoInstance?.refeicaos}">
				<li class="fieldcontain">
					<span id="refeicaos-label" class="property-label"><g:message code="alimento.refeicaos.label" default="Refeicaos" /></span>
					
						<g:each in="${alimentoInstance.refeicaos}" var="r">
						<span class="property-value" aria-labelledby="refeicaos-label"><g:link controller="refeicao" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${alimentoInstance?.id}" />
					<g:link class="edit" action="edit" id="${alimentoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
