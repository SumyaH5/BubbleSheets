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
    @State var enabled = true
    @State var comp = "complete"
    @State var text:String
    @State var text2 = "Enable Answer Key"
    @State var clicks = 0
    @State var hours:Int
    @State var minutes:Int
    @State var seconds:Int
    @State var timerIsPaused: Bool = true
    @State var timer: Timer? = nil
    @State var ts = true
    let b = ["A", "B", "C", "D"]
    var c = Answer("boi")
    var body: some View
    {
        var tim = c.stopTest(minutes, hours, seconds)
        NavigationView
        {
            VStack()
            {
                ZStack
                {
                    Rectangle().multilineTextAlignment(.center).frame(width: 140, height: 35).cornerRadius(15).foregroundColor(Color.pink)
                    HStack() {
                        
                        Text("\(hours):\(minutes):\(seconds)").multilineTextAlignment(.trailing).foregroundColor(Color.white)
                        
                        if timerIsPaused {
                            HStack(spacing: 0)  {
                                Button(action:{
                                    self.startTimer()
                                    ts = false
                                    print("START")
                                }){
                                    Image(systemName: "play.fill").foregroundColor(Color.white)
                                    
                                }
                            }
                        } else {
                            Button(action:{
                                print("STOP")
                                self.stopTimer()
                            }){
                                Image(systemName: "stop.fill").foregroundColor(Color.white)
                            }.disabled(true)
                        }
                    }
                }.padding(.leading, 250)
                ScrollView()
                {
                    ScrollViewReader
                    {value in
                        LazyHStack()
                        {
                            
                            VStack
                            {
                                Text(text)
                                    .padding(.horizontal, 25).foregroundColor(tim || disabled || ts ? .white : .black)
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
                                            }.disabled(tim || disabled || ts)
                                        }
                                    }
                                }.padding(.horizontal, 25).foregroundColor(tim || disabled || ts ? .white : .black)
                            }
                            
                            VStack
                            {
                                Text("Fill in the answer key:").foregroundColor(enabled ? .white : .black).padding(.horizontal, 25).id(1)
                                
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
                                            }.disabled(enabled)
                                        }
                                    }
                                }.padding(.horizontal, 25).foregroundColor(enabled ? .white : .black)
                            }
                            
                            
                        }
                    }
                    
                    
                }
                Spacer()
                    Button (
                        action:
                            {
                                clicks+=1
                                if clicks == 2
                                {
                                    disabled = true
                                    enabled = true
                                    text2 = "⇩"
                                }
                                else if clicks == 1
                                {
                                    disabled = true
                                    enabled = false
                                    text2 = "⇩"
                                }
                                else if clicks >= 3
                                {
                                    text2 = "⇩"
                                }
                                //value.scrollTo(1)
                            }, label: {
                                ZStack
                                {
                                    Rectangle().multilineTextAlignment(.center).frame(width: 395, height: 45).cornerRadius(17).foregroundColor(Color.pink)
                                    Text(text2).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                                }.padding(.horizontal)
                            }
                        
                    )
                
                NavigationLink(destination: ResultsView(sai: selectedAnswerIndices, sai2: selectedAnswerIndices2, total: arraySize)) {
                    ZStack
                    {
                        Rectangle().multilineTextAlignment(.center).frame(width: 395, height: 45).cornerRadius(17).foregroundColor(Color.pink)
                        Text("Show Results").fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    }.padding(.horizontal)
                    
                }.navigationBarTitle("Bubble Away")
                
                //                <Label: View, ResultsView>(destination: ResultsView(), label: Text("Show Results").fontWeight(.bold).multilineTextAlignment(.center).padding(.horizontal, 95.0).padding(.vertical, 10.0).background(Color.green).foregroundColor(Color.white).cornerRadius(15 as! () -> Label))
                
                
                Spacer()
                
                
            }
        }
        
    }
    func startTimer(){
        timerIsPaused = false
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            if self.seconds == 0 {
                self.seconds = 59
                if self.minutes == 0 {
                    self.minutes = 59
                    self.hours = self.hours - 1
                } else {
                    self.minutes = self.minutes - 1
                }
            } else {
                self.seconds = self.seconds - 1
            }
            if self.seconds == 0 && self.minutes == 0 && self.hours == 0
            {
                timerIsPaused = true
                timer?.invalidate()
                timer = nil
            }
        }
    }
    
    func stopTimer(){
        timerIsPaused = true
        timer?.invalidate()
        timer = nil
    }
    
    func restartTimer(){
        hours = 0
        minutes = 0
        seconds = 0
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView(arraySize: 52, text:"Select your answers: ", hours: 1, minutes: 2, seconds: 3)
    }
}

