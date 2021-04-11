package exemplo.buscar

class Pessoa {

    String nome
    String identidade
    int idade

    String toString() {
        this.nome
    }

    static hasMany = [tipoPessoa:TipoPessoa, trabalho:Trabalho]
    static constraints = {
        nome nullable:false, blank:false, unique:false, maxSize:128
        identidade nullable:false, blank:false, unique:true, maxSize:32
        idade nullable:true
    }
}
