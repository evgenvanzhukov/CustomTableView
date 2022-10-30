
import Foundation

struct Model {
    var gas: Element
    var electricity: Element
    var water: Element
    var month: String
}

struct Element {
    var name: String
    var value: Decimal
    var units: String
    
    init(_ name: String, _ value: Decimal, _ units: String) {
        self.name = name
        self.value = value
        self.units = units
    }
}

class DataService {
    
    static func getData() -> [Model] {
        
        return [
            Model(gas: Element("gas",44,"m3"), electricity: Element("electro",175,"kW h"), water: Element("water",121,"m3"), month: "Jan"),
            Model(gas: Element("gas",108,"m3"), electricity: Element("electro",348,"kW h"), water: Element("water",133,"m3"), month: "Feb"),
            Model(gas: Element("gas",155,"m3"), electricity: Element("electro",666,"kW h"), water: Element("water",161,"m3"), month: "Mar"),
            Model(gas: Element("gas",197,"m3"), electricity: Element("electro",932,"kW h"), water: Element("water",178,"m3"), month: "May")
        ]
        
    }
}
