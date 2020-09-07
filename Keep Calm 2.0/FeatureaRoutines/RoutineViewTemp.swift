import SwiftUI

struct RoutineViewTemp: View {
    var model: Model

    init(model: Model) {
        self.model = model
    }
    
    var body: some View {
        Text("Routine")
    }
}

struct RoutineViewTemp_Previews: PreviewProvider {
    static var previews: some View {
        RoutineViewTemp(model: .init(routine: Routine()))
    }
}
