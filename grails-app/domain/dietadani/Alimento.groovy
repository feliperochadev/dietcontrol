package dietadani

class Alimento {
    String nome
    double calorias
    static belongsTo=[Refeicao]
    static hasMany=[refeicaos:Refeicao]

    static constraints = {
        nome nullable:false
        calorias nullable:false
    }

    String toString()
    {
        nome
    }


}
