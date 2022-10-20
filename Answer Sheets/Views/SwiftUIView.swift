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
    @State var selectedHours = 0
    @State var selectedMinutes = 0
    @State var selectedSeconds = 0
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
                        Text("Tap Here").tag(0)
                        Text("SAT Reading Test").tag(52)
                        Text("SAT Writing and Language Test").tag(44)
                        Text("SAT Math Test - No Calculator").tag(20)
                        Text("SAT Math Test - Calculator").tag(38)
                        ForEach(0..<100)
                        {i in
                            Text("\(i+1)").tag(i+1)
                        }
                        
                    }.pickerStyle(MenuPickerStyle())
                    if selectedIndex != 52 && selectedIndex != 44 && selectedIndex != 20 && selectedIndex != 38
                    {
                        VStack
                        {
                            Text("Set a timer")
                            HStack
                            {
                                VStack
                                {
                                    Text("Hours:")
                                    Picker("Tap Me", selection: $selectedHours) {
                                        ForEach(0..<24)
                                        {i in
                                            Text("\(i)").tag(i)
                                        }
                                        
                                    }.pickerStyle(MenuPickerStyle())
                                }
                                
                                VStack
                                {
                                    Text("Minutes:")
                                    Picker("Tap Me", selection: $selectedMinutes) {
                                        ForEach(0..<60)
                                        {i in
                                            Text("\(i)").tag(i)
                                        }
                                        
                                    }.pickerStyle(MenuPickerStyle())
                                }
                                VStack
                                {
                                    Text("Seconds:")
                                    Picker("Tap Me", selection: $selectedSeconds) {
                                        ForEach(0..<60)
                                        {i in
                                            Text("\(i)").tag(i)
                                        }
                                        
                                    }.pickerStyle(MenuPickerStyle())
                                }
                            }
                        }
                    }
                    
                    
                }
                Spacer()
                var a = selectedIndex + 0
                if selectedIndex == 52
                {
                    NavigationLink(
                        destination:
                            TabView(arraySize: selectedIndex, text: "Select your answers: ", hours: 1, minutes:5, seconds:0),
                        label: {
                            Text("Take the test").fontWeight(.bold).multilineTextAlignment(.center).padding(.horizontal, 100.0).padding(.vertical, 10.0).background(Color.blue).foregroundColor(Color.white).cornerRadius(15)
                        })
                }
                else if selectedIndex == 44
                {
                    NavigationLink(
                        destination:
                            TabView(arraySize: selectedIndex, text: "Select your answers: ", hours: 0, minutes:35, seconds:0),
                        label: {
                            Text("Take the test").fontWeight(.bold).multilineTextAlignment(.center).padding(.horizontal, 100.0).padding(.vertical, 10.0).background(Color.blue).foregroundColor(Color.white).cornerRadius(15)
                        })
                }
                else if selectedIndex == 20
                {
                    NavigationLink(
                        destination:
                            TabView(arraySize: selectedIndex, text: "Select your answers: ", hours: 0, minutes:25, seconds:0),
                        label: {
                            Text("Take the test").fontWeight(.bold).multilineTextAlignment(.center).padding(.horizontal, 100.0).padding(.vertical, 10.0).background(Color.pink).foregroundColor(Color.white).cornerRadius(15)
                        })
                }
                else if selectedIndex == 38
                {
                    NavigationLink(
                        destination:
                            TabView(arraySize: selectedIndex, text: "Select your answers: ", hours: 0, minutes:55, seconds:0),
                        label: {
                            Text("Take the test").fontWeight(.bold).multilineTextAlignment(.center).padding(.horizontal, 100.0).padding(.vertical, 10.0).background(Color.pink).foregroundColor(Color.white).cornerRadius(15)
                        })
                }
                else
                {
                    NavigationLink(
                        destination:
                            TabView(arraySize: selectedIndex, text: "Select your answers: ", hours: selectedHours, minutes:selectedMinutes, seconds:selectedSeconds),
                        label: {
                            Text("Take the test").fontWeight(.bold).multilineTextAlignment(.center).padding(.horizontal, 100.0).padding(.vertical, 10.0).background(Color.pink).foregroundColor(Color.white).cornerRadius(15)
                        })
                }
                
                
                Spacer()
                Spacer()
                Spacer()
                
            }            
        }.navigationBarHidden(true)
    }
    
    
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()//.preferredColorScheme(.dark)
    }
}

