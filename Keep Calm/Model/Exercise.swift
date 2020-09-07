import SwiftUI

struct Exercise {
    var naCama: Activity {
        return Activity(
            name: "Na Cama",
            description: "Ainda em posição reta na cama, flexione um dos joelhos, e puxe-os com as duas mãos até a altura do peito, e mantenha por 1 minuto. Não se esqueça de manter a outra perna bem esticada. Depois de 1 minuto, troque a perna flexionada. Uma outra alternativa é flexionar os dois joelhos ao mesmo tempo, abraçando-os com os dois braços, por 2 minutos.Esse você pode fazer deitado ou em pé. Estique um dos braços para cima, como se fosse alcançar o teto. Pode forçar mesmo, sem vergonha. Mantenha essa posição por 5 minutos, depois troque para o outro braço, e mantenha por mais 5 minutos.",
            color: Color("customBlack"),
            avatar: "girlOnBed",
            source: "https://blog.beard.com.br/exercicios-matinais-comecar-o-dia/"
        )
    }
               
    var alongamento: Activity {
        return Activity(
            name: "Alongamento",
            description: "Para começar, comece alongando braços e pernas. Estique bem, buscando principalmente manter o corpo reto. Quando se acostumar a fazer esse exercício, comece a alongar partes específicas, para ser mais preciso as áreas do corpo que você vai usar com mais frequência nos seus trabalhos. Por exemplo, pessoas que trabalham no computador o dia inteiro pode considerar o alongamento para os pulsos, punhos e ombros.A ideia do alongamento é deixar o corpo relaxado de uma forma diferente de como ele está na cama. Envolve estimular os músculos, prepará-los para as atividades do dia, mesmo que elas não sejam tão intensas.",
            color: Color("customBlack"),
            avatar: "girlStandUp",
            source: "https://blog.beard.com.br/exercicios-matinais-comecar-o-dia/"
        )
    }
        
    var activities: [Activity] {
        return [alongamento, naCama]
    }

    var exerciseMotivation: String {
        return "É comprovado cientificamente que ao praticarmos exercícios, o nosso organismo libera várias substâncias, como a endorfina, que promovem o nosso bem-estar que aumenta nossa motivação, alegria e disposição. Esses hormônios fazem a sensação de bem-estar durar por horas após a prática de exercício. Lembrando que é muito importante praticar, mas se você não pratica com frequência não tem problema, o importante é reconhecer que precisa praticar e dar o primeiro passo! Pensando nisso, separei alguns exercícios básicos que podem serem feitos facilmente na sua casa e após criar o hábito, procure novos exercícios e vá aumentando gradativamente."
    }
    
}

struct Activity {
    var name: String
    var description: String
    var color: Color
    var avatar: String
    var source: String
}
