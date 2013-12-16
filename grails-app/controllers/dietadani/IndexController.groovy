package dietadani

import grails.converters.JSON

/**
 * Created by Felipe on 11/12/13.
 */
class IndexController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        def refeicoes = Refeicao.executeQuery("select r.data, count(distinct r.id) from Refeicao r group by r.data")
        def totalCaloriasList = []
        for (refeicao in refeicoes) {
            def totalCalorias = 0;

            def refeicoesArray = Refeicao.findAllByData(refeicao);
            for (refeicaoDoArray in refeicoesArray) {
                for (alimento in refeicaoDoArray.alimentos) {
                    totalCalorias = totalCalorias + alimento.calorias
                }

            }
            totalCaloriasList.add(totalCalorias)
        }
        [refeicoes: refeicoes, totalCaloriasList: totalCaloriasList]
    }
}
