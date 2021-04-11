
<%@ page import="exemplo.buscar.Trabalho" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'trabalho.label', default: 'Trabalho')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-trabalho" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-trabalho" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'trabalho.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="empregado" title="${message(code: 'trabalho.empregado.label', default: 'Empregado')}" />
					
						<th><g:message code="trabalho.pessoa.label" default="Pessoa" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${trabalhoInstanceList}" status="i" var="trabalhoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${trabalhoInstance.id}">${fieldValue(bean: trabalhoInstance, field: "nome")}</g:link></td>
					
						<td><g:formatBoolean boolean="${trabalhoInstance.empregado}" /></td>
					
						<td>${fieldValue(bean: trabalhoInstance, field: "pessoa")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${trabalhoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
