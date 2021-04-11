<%@ page import="exemplo.buscar.Pessoa" %>



<div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="pessoa.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="nome" cols="40" rows="5" maxlength="256" required="" value="${pessoaInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'identidade', 'error')} required">
	<label for="identidade">
		<g:message code="pessoa.identidade.label" default="Identidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="identidade" maxlength="32" required="" value="${pessoaInstance?.identidade}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'idade', 'error')} required">
	<label for="idade">
		<g:message code="pessoa.idade.label" default="Idade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="idade" type="number" value="${pessoaInstance.idade}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'tipoPessoa', 'error')} ">
	<label for="tipoPessoa">
		<g:message code="pessoa.tipoPessoa.label" default="Tipo Pessoa" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${pessoaInstance?.tipoPessoa?}" var="t">
    <li><g:link controller="tipoPessoa" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="tipoPessoa" action="create" params="['pessoa.id': pessoaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tipoPessoa.label', default: 'TipoPessoa')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'trabalho', 'error')} ">
	<label for="trabalho">
		<g:message code="pessoa.trabalho.label" default="Trabalho" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${pessoaInstance?.trabalho?}" var="t">
    <li><g:link controller="trabalho" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="trabalho" action="create" params="['pessoa.id': pessoaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'trabalho.label', default: 'Trabalho')])}</g:link>
</li>
</ul>


</div>

