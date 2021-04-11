package exemplo.buscar

class Trabalho {

    Boolean empregado = "true"
    String nome 

    static belongsTo = [pessoa:Pessoa]
    static constraints = {
        nome nullable:true, unique:true
        empregado nullable:false
    }
}
