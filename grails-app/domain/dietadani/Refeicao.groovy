package dietadani

class Refeicao {
    String nome
    Date data
    static hasMany=[alimentos:Alimento]
    static constraints = {
        nome nullable:false
    }
}
