//
//  SaihanView.swift
//  Answer Sheets
//
//  Created by Sumya Hoque on 10/21/22.
//

import SwiftUI
extension Color {
    static let scarf = Color(red: 139 / 255, green: 169 / 255, blue: 93 / 255)
}
extension Color {
    static let robin = Color(red: 132 / 255, green: 25 / 255, blue: 38 / 255)
}
extension Color {
    static let john = Color(red: 2 / 255, green: 56 / 255, blue: 122 / 255)
}
extension Color {
    static let tiramisu = Color(red: 205 / 255, green: 163 / 255, blue: 112 / 255)
}
struct SaihanView: View {
    var Batman = "I am tired"
    //let listColors: [UIColor] = [scarf, robin, john, tiramisu]
    var body: some View {
        
        //Text("Hello, World!")
        ZStack
        {
            Rectangle().ignoresSafeArea().foregroundColor(Color.purple)
            VStack
            {
                Text("Sumya is awesome ")
                Text(Batman)
            }.padding().background(Color.blue).foregroundColor(Color.white).cornerRadius(70)
        
        }
        
        
    
    }
}

struct SaihanView_Previews: PreviewProvider {
    static var previews: some View {
        SaihanView()
    }
}



//    var scarf = UIColor(displayP3Red: 139/255.0, green: 169/255.0, blue: 93/255.0, alpha: 1)
//    var robin = UIColor(displayP3Red: 132/255.0, green: 25/255.0, blue: 38/255.0, alpha: 1)
//    var john = UIColor(displayP3Red: 2/255.0, green: 56/255.0, blue: 122/255.0, alpha: 1)
//    var tiramisu = UIColor(displayP3Red: 2/255.0, green: 2/255.0, blue: 2/255.0, alpha: 1)
//   let listColors: [UIColor] = [scarf, robin, john, tiramisu]
//randomnum syntax:
