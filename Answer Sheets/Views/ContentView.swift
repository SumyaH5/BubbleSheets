//
//  ContentView.swift
//  Answer Sheets
//
//  Created by Sumya Hoque on 10/9/22.
//

import SwiftUI
import AVKit

struct TabOneView: View {
    @ObservedObject var model = AnswerModel()
    var arraySize:Int
    @State var selectedAnswerIndices = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @State var selectedAnswerIndices2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var instance = Answer("hhoi")
    //    @State var selectedAnswerIndices:[Int]
    //    @State var selectedAnswerIndices2:[Int]
    @State var audioPlayer: AVAudioPlayer!
    @State var submitted = false
    @State var correctAnswers = 0
    @State var disabled = false
    @State var abled = false
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
    @State var testName:String
    let b = ["A", "B", "C", "D"]
    var c = Answer("boi")
    var body: some View
    {
        let cP = instance.changePage(selectedAnswerIndices2, arraySize)
        let tim = c.stopTest(minutes, hours, seconds)
        NavigationView
        {
            
            VStack()
            {
                HStack
                {
                        ZStack
                        {
                            Rectangle().multilineTextAlignment(.center).frame(width: 120, height: 35).cornerRadius(15).foregroundColor(Color.pink)
                            HStack() {
                                if hours < 10 && minutes < 10 && seconds < 10
                                {
                                    Text("0\(hours):0\(minutes):0\(seconds)").multilineTextAlignment(.trailing).foregroundColor(Color.white)
                                }
                                else if hours < 10 && minutes < 10
                                {
                                    Text("0\(hours):0\(minutes):\(seconds)").multilineTextAlignment(.trailing).foregroundColor(Color.white)
                                }
                                else if hours < 10
                                {
                                    Text("0\(hours):\(minutes):\(seconds)").multilineTextAlignment(.trailing).foregroundColor(Color.white)
                                }
                                else if hours < 10 && seconds < 10
                                {
                                    Text("0\(hours):\(minutes):0\(seconds)").multilineTextAlignment(.trailing).foregroundColor(Color.white)
                                }
                                else if minutes < 10 && seconds < 10
                                {
                                    Text("\(hours):0\(minutes):0\(seconds)").multilineTextAlignment(.trailing).foregroundColor(Color.white)
                                }
                                else if minutes < 10
                                {
                                    Text("\(hours):0\(minutes):\(seconds)").multilineTextAlignment(.trailing).foregroundColor(Color.white)
                                }
                                else if seconds < 10
                                {
                                    Text("\(hours):\(minutes):0\(seconds)").multilineTextAlignment(.trailing).foregroundColor(Color.white)
                                }
                                if timerIsPaused {
                                    HStack(spacing: 0)  {
                                        Button(action:{
                                            self.startTimer()
                                            ts = false
                                            abled = true
                                            print("START")
                                        }){
                                            Image(systemName: "play.fill").foregroundColor(abled ? .pink : .white)
                                            
                                        }.disabled(abled)
                                    }
                                } else {
                                    Button(action:{
                                        print("STOP")
                                        self.stopTimer()
                                    }){
                                        Image(systemName: "stop.fill").foregroundColor(Color.pink)
                                    }.disabled(true)
                                }
                            }
                        }
                        ZStack
                        {
                            Rectangle().multilineTextAlignment(.center).frame(width: 200, height: 35).cornerRadius(15).foregroundColor(Color.pink)
                            HStack {
                                Text("Play White Noise:").foregroundColor(Color.white)
                                HStack {
                                    
                                    Button(action: {
                                        self.audioPlayer.play()
                                    }) {
                                        Image(systemName: "play.fill").foregroundColor(Color.white)
                                    }
                                    
                                    Button(action: {
                                        self.audioPlayer.pause()
                                    }) {
                                        Image(systemName: "pause.fill").foregroundColor(Color.white)
                                    }
                                    
                                }
                            }
                        .onAppear {
                            let sound = Bundle.main.path(forResource: "song", ofType: "mp3")
                            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                        }
                        }
                }.padding(.trailing, 35)
                LazyVStack(alignment: .leading)
                {
                    Text(text)
                        .padding(.leading)
                }
                ScrollView()
                {
                    ScrollViewReader
                    {value in
                        LazyVStack(alignment: .leading)
                        {
                            if (tim || disabled || ts) == false
                            {
                                VStack
                                {
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
                            }
                            
                            else if enabled == false
                            {
                                VStack
                                {
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
                    
                    
                }
                Spacer()
                if disabled == false
                {
                    Button (
                        action:
                            {
                                clicks+=1
                                text = "Fill in the answer key:"
                                self.stopTimer()
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
                                    Rectangle().multilineTextAlignment(.center).frame(width: 360, height: 45).cornerRadius(17).foregroundColor(Color.pink)
                                    Text(text2).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                                }.padding(.horizontal)
                            }
                        
                    )
                }
                
                if cP == true
                {
                    NavigationLink(destination: ResultsView(sai: selectedAnswerIndices, sai2: selectedAnswerIndices2, total: arraySize)) {
                        ZStack
                        {
                            Rectangle().multilineTextAlignment(.center).frame(width: 360, height: 45).cornerRadius(17).foregroundColor(Color.pink)
                            Text("Show Results").fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                        }.padding(.horizontal)
                        
                    }
                }
                
                Text("Bismillah").foregroundColor(Color.white).navigationBarTitle(testName)
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
                enabled = false
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

struct TabOneView_Previews: PreviewProvider {
    static var previews: some View {
        TabOneView(arraySize: 20, text:"Select your answers: ", hours: 0, minutes: 1, seconds: 5, testName: "Bubble Away")
    }
}

