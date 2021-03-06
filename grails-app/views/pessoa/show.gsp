
<%@ page import="exemplo.buscar.Pessoa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pessoa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pessoa" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pessoa">
			
				<g:if test="${pessoaInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="pessoa.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${pessoaInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pessoaInstance?.identidade}">
				<li class="fieldcontain">
					<span id="identidade-label" class="property-label"><g:message code="pessoa.identidade.label" default="Identidade" /></span>
					
						<span class="property-value" aria-labelledby="identidade-label"><g:fieldValue bean="${pessoaInstance}" field="identidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pessoaInstance?.idade}">
				<li class="fieldcontain">
					<span id="idade-label" class="property-label"><g:message code="pessoa.idade.label" default="Idade" /></span>
					
						<span class="property-value" aria-labelledby="idade-label"><g:fieldValue bean="${pessoaInstance}" field="idade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pessoaInstance?.tipoPessoa}">
				<li class="fieldcontain">
					<span id="tipoPessoa-label" class="property-label"><g:message code="pessoa.tipoPessoa.label" default="Tipo Pessoa" /></span>
					
						<g:each in="${pessoaInstance.tipoPessoa}" var="t">
						<span class="property-value" aria-labelledby="tipoPessoa-label"><g:link controller="tipoPessoa" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${pessoaInstance?.trabalho}">
				<li class="fieldcontain">
					<span id="trabalho-label" class="property-label"><g:message code="pessoa.trabalho.label" default="Trabalho" /></span>
					
						<g:each in="${pessoaInstance.trabalho}" var="t">
						<span class="property-value" aria-labelledby="trabalho-label"><g:link controller="trabalho" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:pessoaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${pessoaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
