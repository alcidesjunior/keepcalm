//
//  Anxiety.swift
//  Keep Calm
//
//  Created by Alcides Junior on 08/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class Anxiety {
    
    var activities: [AnxietyActivity]
    var anxietyMotivation: String
    
    init() {
        
        
        // BREATHE
        let respiracaoExercicio = AnxietyMovie(title: "", description: "Respirar tem um impacto emocional e, da mesma forma que o estado de espírito interfere na velocidade da respiração, é possível controlá-la para acalmar o corpo e a mente. Isso acontece pois a inspiração está relacionada ao lado ativo do sistema nervoso autônomo, enquanto a expiração conecta-se com o lado calmante.Logo, a respiração atua de duas maneiras para aliviar momentos tensos:\n1. A primeira é fisiológica, pois a ansiedade nos faz respirar rápido de forma rasa e, ao controlar a inspiração, o corpo volta ao equilíbrio.\n2. A segunda é emocional, visto que ao prestar a atenção na respiração, a pessoa foca no momento presente e a ansiedade é minimizada.\n\nFaça o exercício com o vídeo abaixo, respire e inspire na velocidade que é mostrada. Repita isso durante sua rotina sempre que sentir ser necessário e veja a diferença acontecer.", url: "vXZ5l7G6T2I")
        
        let respiracao = AnxietyActivity(activityName: "Respiração", color: UIColor(named: "customDarkGreen")!, avatar: #imageLiteral(resourceName: "naCama"), source: "https://blog.beard.com.br/exercicios-matinais-comecar-o-dia/", anxietyMovie: [respiracaoExercicio])
        
        //TEAS
        let chaCamomila = AnxietyMovie(title: "Chá de Camomila", description: "Esses são alguns dos benefícios do chá de camomila:\nDiminui a hiperatividade, ajuda a acalma e a relaxar, alivia o estresse,  auxilia no tratamento da ansiedade,  ajuda no tratamento de problemas no estômago, a controlar a má digestão e a tratar as úlceras no estômago, ajuda a aliviar o enjoo, alivia cólicas menstruais, ajuda no tratamento de feridas e inflamações, acalma e remove as impurezas da pele.\n\nVeja abaixo como preparar o seu:", url: "qMUCVXIxXSM")
        
        let chaCidreira = AnxietyMovie(title: "Chá de erva cidreira", description: "Esses são alguns dos benefícios do chá de erva-cidreira:\nMelhorar a qualidade do sono, aliviar as dores de cabeça, combater os gases, prevenir distúrbios digestivos, aliviar as cólicas menstruais e intestinais, prevenir distúrbios renais, promover o alívio da tosse, promover o bem-estar e a tranquilidade.\n\nVeja abaixo como preparar o seu:", url: "aX48jhLjuiM")
        
        let chaAlecrim = AnxietyMovie(title: "Chá de alecrim", description: "Esses são alguns dos benefícios do chá de alecrim:\nCombate à tosse, gripe e asma, equilibra a pressão arterial, auxilia o tratamento de dores reumáticas e contusões, é diurético e ajuda a digestão, auxilia a menstruação, reduz gases intestinais, combate o stress.\n\nVeja abaixo como preparar o seu:", url: "Yy233oABUvA")
        
        let chas = AnxietyActivity(activityName: "Chás", color: UIColor(named: "customDarkGreen")!, avatar: UIImage(), source: "", anxietyMovie: [chaCamomila, chaCidreira, chaAlecrim])
        
        //MUSICS
        let msc1 = AnxietyMovie(title: "1.Weighless (Marconi Union)", description: "", url: "UfcAVejslrU")
        let msc2 = AnxietyMovie(title: "2.Electra (Airstream)", description: "", url: "FTvZ8a2gHFc")
        let msc3 = AnxietyMovie(title: "3.Mellomaniac – Chill Out Mix (DJ Shah)", description: "", url: "EcRXlM6edrM")
        let msc4 = AnxietyMovie(title: "4.Watermark (Enya)", description: "", url: "NO5tb20qQnA")
        let msc5 = AnxietyMovie(title: "5.Strawberry Swing (Coldplay)", description: "", url: "isH1yy8I_dc")
        
        let musicas = AnxietyActivity(activityName: "Músicas", color: UIColor(named: "customDarkGreen")!, avatar: UIImage(), source: "", anxietyMovie: [msc1, msc2, msc3, msc4, msc5])
        
        self.activities = [respiracao, chas, musicas]//, chas, musicas, meditacao]
        self.anxietyMotivation = "É comprovado cientificamente que ao praticarmos exercícios, o nosso organismo libera várias substâncias, como a endorfina, que promovem o nosso bem-estar que aumentando nossa motivação, alegria e disposição. Esses hormônios fazem a sensação de bem-estar durar por horas após a prática de exercício. Aqui estão alguns exercícios que podem ser feitos dentro de casa."
    }
    
}

struct AnxietyActivity {
    
    var activityName: String
    var color: UIColor
    var avatar: UIImage
    var source: String
    var anxietyMovie: [AnxietyMovie]
}

struct AnxietyMovie {
    
    var title: String
    var description: String
    var url: String
}
