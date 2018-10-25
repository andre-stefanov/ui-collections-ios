import UIKit

struct ColorSection {
    var name : String
    var colors : [UIColor]
}

class Content {
    
    static var sections : [ColorSection] {
        get {
            var tmp : [ColorSection] = []
            for index in 1...10 {
                var colors : [UIColor] = []
                for _ in 1...9 {
                    colors.append(UIColor.random())
                }
                tmp.append(ColorSection(name: "Section \(index)", colors: colors))
            }
            return tmp
        }
    }
    
}
