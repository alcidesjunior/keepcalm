//
//  Exercise.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class Exercise {
    
    var activities: [Activity]
    var exerciseMotivation: String
    
    init() {
        
        let naCama = Activity(activityName: "Na Cama", description: "Ainda em posição reta na cama, flexione um dos joelhos, e puxe-os com as duas mãos até a altura do peito, e mantenha por 1 minuto. Não se esqueça de manter a outra perna bem esticada. Depois de 1 minuto, troque a perna flexionada. Uma outra alternativa é flexionar os dois joelhos ao mesmo tempo, abraçando-os com os dois braços, por 2 minutos.Esse você pode fazer deitado ou em pé. Estique um dos braços para cima, como se fosse alcançar o teto. Pode forçar mesmo, sem vergonha. Mantenha essa posição por 5 minutos, depois troque para o outro braço, e mantenha por mais 5 minutos.", color: UIColor(named: "customBlack")!, avatar: #imageLiteral(resourceName: "naCama"), source: "https://blog.beard.com.br/exercicios-matinais-comecar-o-dia/")
               
       let alongamento = Activity(activityName: "Alongamento", description: "Para começar, comece alongando braços e pernas. Estique bem, buscando principalmente manter o corpo reto. Quando se acostumar a fazer esse exercício, comece a alongar partes específicas, para ser mais preciso as áreas do corpo que você vai usar com mais frequência nos seus trabalhos. Por exemplo, pessoas que trabalham no computador o dia inteiro pode considerar o alongamento para os pulsos, punhos e ombros.A ideia do alongamento é deixar o corpo relaxado de uma forma diferente de como ele está na cama. Envolve estimular os músculos, prepará-los para as atividades do dia, mesmo que elas não sejam tão intensas.", color: UIColor(named: "customBlack")!, avatar: UIImage(named: "alongamento")!, source: "https://blog.beard.com.br/exercicios-matinais-comecar-o-dia/")
       
//       let games = Activity(activityName: "Games", description: "Sente na cama como se sentaria normalmente. Não precisa fazer o exercício de respiração como vamos descrever abaixo, apenas feche os olhos, coloque em ordem todas as tarefas que pretende fazer no dia, e levante. Faça pequenas massagens nas mãos, pés, no fronte (as extremidades da testa), ou mesmo no céu da boca, com a língua. Não pense em mais nada, apenas faça os exercícios e se concentre neles. Você vai perceber com o tempo que sua concentração ficará melhor, além de conseguir mais ânimo.", color: UIColor(named: "customBlack")!, avatar: UIImage(), source: "https://blog.beard.com.br/exercicios-matinais-comecar-o-dia/")
       
       let respiracao = Activity(activityName: "Respiração", description: "O exercício de respiração é bem simples. Puxe o ar pelo nariz devagar e em grande quantidade. Pode estufar o peito mesmo, não tem problema. Segure o suficiente para não ficar sufocado, e solte na mesma velocidade que puxou, mas com a boca. Faça por aproximadamente 10 minutos, com o tempo você vai se sentir muito mais calmo no dia a dia.", color: UIColor(named: "customBlack")!, avatar: UIImage(), source: "https://blog.beard.com.br/exercicios-matinais-comecar-o-dia/")
        
        self.activities = [naCama, alongamento]//, games]
        self.exerciseMotivation = "É comprovado cientificamente que ao praticarmos exercícios, o nosso organismo libera várias substâncias, como a endorfina, que promovem o nosso bem-estar que aumentando nossa motivação, alegria e disposição. Esses hormônios fazem a sensação de bem-estar durar por horas após a prática de exercício. Aqui estão alguns exercícios que podem ser feitos dentro de casa."
    }
    
}

struct Activity {
    
    var activityName: String
    var description: String
    var color: UIColor
    var avatar: UIImage
    var source: String
}
