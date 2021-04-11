package exemplo.buscar



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoPessoaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoPessoa.list(params), model:[tipoPessoaInstanceCount: TipoPessoa.count()]
    }

    def show(TipoPessoa tipoPessoaInstance) {
        respond tipoPessoaInstance
    }

    def create() {
        respond new TipoPessoa(params)
    }

    @Transactional
    def save(TipoPessoa tipoPessoaInstance) {
        if (tipoPessoaInstance == null) {
            notFound()
            return
        }

        if (tipoPessoaInstance.hasErrors()) {
            respond tipoPessoaInstance.errors, view:'create'
            return
        }

        tipoPessoaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoPessoa.label', default: 'TipoPessoa'), tipoPessoaInstance.id])
                redirect tipoPessoaInstance
            }
            '*' { respond tipoPessoaInstance, [status: CREATED] }
        }
    }

    def edit(TipoPessoa tipoPessoaInstance) {
        respond tipoPessoaInstance
    }

    @Transactional
    def update(TipoPessoa tipoPessoaInstance) {
        if (tipoPessoaInstance == null) {
            notFound()
            return
        }

        if (tipoPessoaInstance.hasErrors()) {
            respond tipoPessoaInstance.errors, view:'edit'
            return
        }

        tipoPessoaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoPessoa.label', default: 'TipoPessoa'), tipoPessoaInstance.id])
                redirect tipoPessoaInstance
            }
            '*'{ respond tipoPessoaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoPessoa tipoPessoaInstance) {

        if (tipoPessoaInstance == null) {
            notFound()
            return
        }

        tipoPessoaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoPessoa.label', default: 'TipoPessoa'), tipoPessoaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPessoa.label', default: 'TipoPessoa'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
