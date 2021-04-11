
<%@ page import="exemplo.buscar.TipoPessoa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoPessoa.label', default: 'TipoPessoa')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tipoPessoa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tipoPessoa" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tipoPessoa">
			
				<g:if test="${tipoPessoaInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="tipoPessoa.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${tipoPessoaInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoPessoaInstance?.ativo}">
				<li class="fieldcontain">
					<span id="ativo-label" class="property-label"><g:message code="tipoPessoa.ativo.label" default="Ativo" /></span>
					
						<span class="property-value" aria-labelledby="ativo-label"><g:formatBoolean boolean="${tipoPessoaInstance?.ativo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoPessoaInstance?.pessoa}">
				<li class="fieldcontain">
					<span id="pessoa-label" class="property-label"><g:message code="tipoPessoa.pessoa.label" default="Pessoa" /></span>
					
						<span class="property-value" aria-labelledby="pessoa-label"><g:link controller="pessoa" action="show" id="${tipoPessoaInstance?.pessoa?.id}">${tipoPessoaInstance?.pessoa?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:tipoPessoaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${tipoPessoaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
