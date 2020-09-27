//
//  Routine.swift
//  Keep Calm
//
//  Created by Alcides Junior on 12/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class Routine {
    
    var routineDescription: String
    var routineImage: UIImage
    
    init() {
        self.routineDescription = "Existe um frase bastante interessante que diz: “Nós somos o que fazemos repetidamente”. Muitas vezes, fazemos coisas no automático e muita das vezes, não nos damos conta mas poderíamos ser mais produtivos se nos organizássemos melhor. Cerca de 40% das nossas ações diárias são movidas por hábitos que, muita das vezes, desenvolvemos e levamos de modo automático. Quantas vezes você postergou algo que deveria ter feito e acabou prejudicando outras coisas que você precisou fazer porque tinha que dar prioridade a algo que realmente tinha que ser feito naquele momento. Uma boa solução para organizar essas coisas é criar uma rotina. Isso mesmo! Uma dica bem simples de como criar uma rotina básica é analisar as coisas que tem de ser feitas no dia, geralmente, isso vale para a semana e até mesmo para o mês. Portanto, pegue papel e caneta, ou se preferir faça de forma digital; Enumere tudo que você tem de fazer naquele dia e estipule um tempo para realizar cada coisa, feito isso, reveja sua lista e veja os níveis de prioridade e se necessário, reorganize-a. Inclua cada mínima coisa. Isso mesmo, coisas como: Horário para dormir, acordar,  tomar café da manhã, ler notícias, acessar redes sociais etc. Após isso, passe a criar o hábito de olhar sua lista de coisas e tente seguir. Você verá a diferença muito em breve e sairá quase que automático realizar suas atividades. Você pode até mesmo otimizar o seu tempo e até incluir mais coisas. Mas vá com calma! Uma longa caminhada começa sempre com o primeiro passo. Ah! Não esqueça das pausas, elas são muito importantes para o seu dia!"
        self.routineImage = #imageLiteral(resourceName: "routineImage")
    }
}

struct RoutineData:Decodable {
    var id: Int?
    var activity, hour, activityDescription: String
    var day: [WeekDay]
}

struct WeekDay:Decodable {
    
    var day: Int
}
