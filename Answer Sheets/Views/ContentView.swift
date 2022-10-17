//
//  ContentView.swift
//  Answer Sheets
//
//  Created by Sumya Hoque on 10/9/22.
//

import SwiftUI

struct TabView: View {
    @ObservedObject var model = AnswerModel()
    var arraySize:Int
    @State var selectedAnswerIndices = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @State var selectedAnswerIndices2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
//    @State var selectedAnswerIndices:[Int]
//    @State var selectedAnswerIndices2:[Int]
    @State var submitted = false
    @State var correctAnswers = 0
    @State var disabled = false
    @State var comp = "complete"
    
    let b = ["A", "B", "C", "D"]
    var body: some View
    {
        NavigationView
        {
            VStack()
            {
                ScrollView()
                {
                    LazyVStack(alignment: .leading)
                    {
                        Text("Select your answers:")
                            .padding(.horizontal, 25)
                        ForEach(0..<arraySize) { i in
                            HStack(spacing:2)
                            {
                                Text("\(i+1). ")
                                ForEach(1..<5)
                                {index in
                                    let a = Answer(b[index-1])
                                    //var c = model.answerChoices[index]
                                    
                                    Button {
                                        // Track the selected index
                                        selectedAnswerIndices[i] = index
                                        
                                    } label: {
                                        
                                        ZStack {
                                            if submitted == false {
                                                Image(systemName: index == selectedAnswerIndices[i] ? "circle.fill" : "circle" ).font(.title)
                                                    .frame(height: 48)
                                            }
                                            Text(a.choice)
                                        }.accentColor(Color.black)
                                    }.disabled(disabled)
                                }
                            }
                        }.padding(.horizontal, 25)
                        
                        
                        Text("Fill in the answer key:")
                            .padding(.horizontal, 25)
                        
                        ForEach(0..<arraySize) { i in
                            HStack(spacing:2)
                            {
                                Text("\(i+1). ")
                                ForEach(1..<5)
                                {index in
                                    let a = Answer(b[index-1])
                                    //var c = model.answerChoices[index]
                                    
                                    Button {
                                        // Track the selected index
                                        selectedAnswerIndices2[i] = index
                                        
                                    } label: {
                                        
                                        ZStack {
                                            if submitted == false {
                                                Image(systemName: index == selectedAnswerIndices2[i] ? "circle.fill" : "circle" ).font(.title)
                                                    .frame(height: 48)
                                            }
                                            Text(a.choice)
                                        }.accentColor(Color.black)
                                    }.disabled(disabled)
                                }
                            }
                        }.padding(.horizontal, 25)
                    }
                    
                }
                Spacer()
                Button (
                    action:
                        {
                            disabled = true
                        }, label: {
                            Text("Complete").fontWeight(.bold).multilineTextAlignment(.center).padding(.horizontal, 155.0).padding(.vertical, 10.0).background(Color.blue).foregroundColor(Color.white).cornerRadius(15)
                        }
                    
                )
                NavigationLink(destination: ResultsView(sai: selectedAnswerIndices, sai2: selectedAnswerIndices2, total: arraySize)) {
                    Text("Show Results").fontWeight(.bold).multilineTextAlignment(.center).padding(.horizontal, 140.0).padding(.vertical, 10.0).background(Color.green).foregroundColor(Color.white).cornerRadius(15)
                }.navigationBarTitle("Bubble Away")
                
//                <Label: View, ResultsView>(destination: ResultsView(), label: Text("Show Results").fontWeight(.bold).multilineTextAlignment(.center).padding(.horizontal, 95.0).padding(.vertical, 10.0).background(Color.green).foregroundColor(Color.white).cornerRadius(15 as! () -> Label))
        
                
                Spacer()
                
                
            }
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            TabView(arraySize: 52)
        }
    }
}
