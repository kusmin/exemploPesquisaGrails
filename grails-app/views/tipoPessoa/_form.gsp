<%@ page import="exemplo.buscar.TipoPessoa" %>



<div class="fieldcontain ${hasErrors(bean: tipoPessoaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="tipoPessoa.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${tipoPessoaInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoPessoaInstance, field: 'ativo', 'error')} ">
	<label for="ativo">
		<g:message code="tipoPessoa.ativo.label" default="Ativo" />
		
	</label>
	<g:checkBox name="ativo" value="${tipoPessoaInstance?.ativo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: tipoPessoaInstance, field: 'pessoa', 'error')} required">
	<label for="pessoa">
		<g:message code="tipoPessoa.pessoa.label" default="Pessoa" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pessoa" name="pessoa.id" from="${exemplo.buscar.Pessoa.list()}" optionKey="id" required="" value="${tipoPessoaInstance?.pessoa?.id}" class="many-to-one"/>

</div>

