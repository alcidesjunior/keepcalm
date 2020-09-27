import Combine
import SwiftUI

extension FoodView {
    struct ViewModel {
        var food: Food

        init(food: Food) {
            self.food = food
        }
    }
}
