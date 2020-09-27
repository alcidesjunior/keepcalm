import UIKit

struct Food {
    var id = UUID()
    var foodItem: [FoodItem] {
        return [vitaminaB, triptofano]
    }
    var motivationalText:String {
        return"Manter uma boa alimentação ajuda a ter um dia produtivo e evitar estresse e ansiedade, na medida do possível. Pensando nisso, reuni alguns alimentos ricos em vitamina B e triptofano que ajudam no combate ao estresse e ansiedade."
    }
        
    let alface = FoodType(name: "Alface", foodImage: "alface")
    let abacate = FoodType(name: "Abacate", foodImage: "abacate")
    let castanha = FoodType(name: "Castanha", foodImage: "castanha")
    let uva = FoodType(name: "Uva", foodImage: "uva")
    let frango = FoodType(name: "Frango", foodImage: "frango")
    let melancia = FoodType(name: "Melancia", foodImage: "melancia")

    var vitaminaB: FoodItem {
        return FoodItem(
            foodCategory: "Vitamina B",
            foodType: [
                alface,
                abacate,
                castanha,
                uva,
                frango,
                melancia
            ]
        )
    }

    let banana = FoodType(name: "Banana", foodImage: "banana")
    let ovo = FoodType(name: "Ovo", foodImage: "ovo")
    let queijo = FoodType(name: "Queijo", foodImage: "queijo")
    let soja = FoodType(name: "Soja", foodImage: "soja")
    let peixe = FoodType(name: "Peixe", foodImage: "peixe")
    let aveia = FoodType(name: "Aveia", foodImage: "aveia")

    var triptofano:FoodItem {
        return FoodItem(
            foodCategory: "Triptofano",
            foodType: [
                banana,
                ovo,
                queijo,
                soja,
                peixe,
                aveia
            ]
        )
    }
}

struct FoodItem {
    var foodCategory: String
    var foodType: [FoodType]
}

struct FoodType {
    var id = UUID()
    var name: String
    var foodImage: String
}
