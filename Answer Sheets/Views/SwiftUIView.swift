//
//  SwiftUIView.swift
//  Answer Sheets
//
//  Created by Sumya Hoque on 10/12/22.
//

import SwiftUI

struct SwiftUIView: View {
    
    @ObservedObject var model = AnswerModel()
    @State var selectedIndex = 0
    @State var indices=[Int]()
    var body: some View {
        
            NavigationView
            {
                VStack
                {
                    Spacer()
                    Spacer()
                    Spacer()
                    VStack
                    {
                        VStack(spacing:20)
                        {
                            Text("Select your test section:")
                            Text("OR")
                            Text("Choose a number of questions:")
                        }
                        
                        Picker("Tap Me", selection: $selectedIndex) {
                            
                            Text("SAT Reading Test").tag(52)
                            Text("SAT Writing and Language Test").tag(35)
                            Text("SAT Math Test - No Calculator").tag(20)
                            Text("SAT Math Test - Calculator").tag(38)
                            ForEach(0..<100)
                            {i in
                                Text("\(i+1)").tag(i+1)
                            }
                            
                        }.pickerStyle(MenuPickerStyle())
                    }
                    Spacer()
                    var a = selectedIndex + 0
                    NavigationLink(
                        destination:
                            TabView(arraySize: selectedIndex),
                        label: {
                            Text("Take the test").fontWeight(.bold).multilineTextAlignment(.center).padding(.horizontal, 100.0).padding(.vertical, 10.0).background(Color.blue).foregroundColor(Color.white).cornerRadius(15)
                        })
                    Spacer()
                    Spacer()
                    Spacer()
                    
                }
                
            }.navigationBarHidden(true)
        }
        
        
    }


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

