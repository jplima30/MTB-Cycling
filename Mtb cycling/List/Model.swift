
import Foundation

struct Model {
    let title: String
}

extension Model {
    static func getExercises() -> [Model]{
        let exercises: [Model] = [
            Model(title: "MTB"),
            Model(title: "Speed"),
            Model(title: "Gravel")
        ]
        return exercises
    }
}
