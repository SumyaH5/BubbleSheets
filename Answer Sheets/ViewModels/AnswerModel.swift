//
//  AnwerModel.swift
//  Answer Sheets
//
//  Created by Sumya Hoque on 10/9/22.
//

import Foundation
class AnswerModel: ObservableObject {
    
//    var a = Answer([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
//    var b = Answer([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
//    var c = Answer([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
//    var d = Answer([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    @Published var answerChoices = [Answer]()
    init() {
            
            // Find the path to the JSON file in our bundle
            let pathString = Bundle.main.path(forResource: "File", ofType: "json")
            
            if pathString != nil {
                
                // Create a URL object with the string path to our local JSON file
                let url = URL(fileURLWithPath: pathString!)
                
                do {
                    // Create data object, pointing it to our local JSON file
                    let data = try Data(contentsOf: url)
                    
                    let decoder = JSONDecoder()
                    
                    do {
                        // Try to decode the json data into instances of Pizzas
                        let jsonPizzas = try decoder.decode([Answer].self, from: data)
                        
                        
                        // Loop through pizzas and add Ids
                        for index in 0..<jsonPizzas.count {
                            jsonPizzas[index].id = UUID()
                        }
                        
                        // Assign to pizzas property
                        self.answerChoices = jsonPizzas
                    }
                    catch {
                        print("Couldn't parse Pizzas")
                    }
                    
                }
                catch {
                    print("Couldn't create Data object")
                }
                
            }
        }
    
}
