package exemplo.buscar

class TipoPessoa {

    Boolean ativo = true
    String nome = "fisica"

    static belongsTo = [pessoa:Pessoa]

    static constraints = {
        nome nullable:false, blank:false, unique:true
        ativo nullable:false, blank:false, maxSize: 4
    }
}
