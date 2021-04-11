package exemplo.buscar



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TrabalhoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Trabalho.list(params), model:[trabalhoInstanceCount: Trabalho.count()]
    }

    def show(Trabalho trabalhoInstance) {
        respond trabalhoInstance
    }

    def create() {
        respond new Trabalho(params)
    }

    @Transactional
    def save(Trabalho trabalhoInstance) {
        if (trabalhoInstance == null) {
            notFound()
            return
        }

        if (trabalhoInstance.hasErrors()) {
            respond trabalhoInstance.errors, view:'create'
            return
        }

        trabalhoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'trabalho.label', default: 'Trabalho'), trabalhoInstance.id])
                redirect trabalhoInstance
            }
            '*' { respond trabalhoInstance, [status: CREATED] }
        }
    }

    def edit(Trabalho trabalhoInstance) {
        respond trabalhoInstance
    }

    @Transactional
    def update(Trabalho trabalhoInstance) {
        if (trabalhoInstance == null) {
            notFound()
            return
        }

        if (trabalhoInstance.hasErrors()) {
            respond trabalhoInstance.errors, view:'edit'
            return
        }

        trabalhoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Trabalho.label', default: 'Trabalho'), trabalhoInstance.id])
                redirect trabalhoInstance
            }
            '*'{ respond trabalhoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Trabalho trabalhoInstance) {

        if (trabalhoInstance == null) {
            notFound()
            return
        }

        trabalhoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Trabalho.label', default: 'Trabalho'), trabalhoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'trabalho.label', default: 'Trabalho'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
