//
//  SavedView.swift
//  Answer Sheets
//
//  Created by Sumya Hoque on 10/16/22.
//

import SwiftUI

struct SavedView: View {
  
  @State var hours:Int
  @State var minutes:Int
  @State var seconds:Int
  @State var timerIsPaused: Bool = true
  @State var timer: Timer? = nil
  
  var body: some View {
    VStack {
      Text("\(hours):\(minutes):\(seconds)")
      if timerIsPaused {
        HStack {
          Button(action:{
            print("RESTART")
            self.restartTimer()
          }){
            Image(systemName: "backward.end.alt")
              .padding(.all)
          }
          .padding(.all)
          Button(action:{
            self.startTimer()
            print("START")
          }){
            Image(systemName: "play.fill")
              .padding(.all)
          }
          .padding(.all)
        }
      } else {
        Button(action:{
          print("STOP")
          self.stopTimer()
        }){
          Image(systemName: "stop.fill")
            .padding(.all)
        }
        .padding(.all)
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

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    SavedView(hours: 0, minutes: 0, seconds: 5)
      
  }
}
