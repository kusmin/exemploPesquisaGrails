<%@ page import="exemplo.buscar.Trabalho" %>



<div class="fieldcontain ${hasErrors(bean: trabalhoInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="trabalho.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${trabalhoInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: trabalhoInstance, field: 'empregado', 'error')} ">
	<label for="empregado">
		<g:message code="trabalho.empregado.label" default="Empregado" />
		
	</label>
	<g:checkBox name="empregado" value="${trabalhoInstance?.empregado}" />

</div>

<div class="fieldcontain ${hasErrors(bean: trabalhoInstance, field: 'pessoa', 'error')} required">
	<label for="pessoa">
		<g:message code="trabalho.pessoa.label" default="Pessoa" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pessoa" name="pessoa.id" from="${exemplo.buscar.Pessoa.list()}" optionKey="id" required="" value="${trabalhoInstance?.pessoa?.id}" class="many-to-one"/>

</div>

