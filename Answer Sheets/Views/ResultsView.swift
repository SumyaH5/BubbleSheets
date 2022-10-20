//
//  ResultsView.swift
//  Answer Sheets
//
//  Created by Sumya Hoque on 10/13/22.
//


import SwiftUI

struct ResultsView: View {
    @State var sai:[Int]
    @State var sai2:[Int]
    @State var total:Int
    var a = Answer("hhoi")
    
    var body: some View {
//        NavigationView
//        {
        let wr = a.startGrading(sai, arr2: sai2)
        let corr = a.stopGrading(sai, arr2: sai2, ter: total)
        VStack
            {
                HStack
                {
                    Text("Your Answers:")//.padding(.leading, 40)
                    Text("Answer Key:").padding(.leading, 25)
                    Text("Questions to work on:").padding(.leading, 30)
                    
                }
            
                ScrollView()
                {
                    HStack
                    {
                        LazyVStack(alignment: .leading)
                        {
                            //Text("Your Answers:").padding(.leading, 30)
                            VStack
                            {
                                ForEach(0..<total)
                                {i in
                                    
                                    HStack
                                    {
                                        Text("\(i+1). ")
                                        ZStack
                                        {
                                            Image(systemName: "circle").font(.title)
                                            
                                            if sai[i] == 1
                                            {
                                                Text("A")
                                            }
                                            if sai[i] == 2
                                            {
                                                Text("B")
                                            }
                                            if sai[i] == 3
                                            {
                                                Text("C")
                                            }
                                            if sai[i] == 4
                                            {
                                                Text("D")
                                            }
                                            if sai[i] == 5
                                            {
                                                Text("E")
                                            }
                                        }
                                        if sai[i] == sai2[i]
                                        {
                                            Image(systemName: "checkmark").foregroundColor(Color.blue)
                                        }
                                        else
                                        {
                                            Image(systemName: "xmark").foregroundColor(Color.pink)
                                        }
                                    }
                                }
                            }
                        }.padding(.leading, 25)
                        LazyVStack(alignment: .leading)
                        {
                            //Text("Answer Key:").padding(.leading, 30)
                            VStack
                            {
                                ForEach(0..<total)
                                {i in
                                    HStack
                                    {
                                        Text("\(i+1). ").foregroundColor(Color.white)
                                        ZStack
                                        {
                                            Image(systemName: "circle").font(.title)
                                            
                                            if sai2[i] == 1
                                            {
                                                Text("A")
                                            }
                                            if sai2[i] == 2
                                            {
                                                Text("B")
                                            }
                                            if sai2[i] == 3
                                            {
                                                Text("C")
                                            }
                                            if sai2[i] == 4
                                            {
                                                Text("D")
                                            }
                                            if sai2[i] == 5
                                            {
                                                Text("E")
                                            }
                                        }
                                        if sai[i] == sai2[i]
                                        {
                                            Image(systemName: "checkmark").foregroundColor(Color.white)
                                        }
                                        else
                                        {
                                            Image(systemName: "xmark").foregroundColor(Color.white)
                                        }
                                        
                                    }
                                    
                                }
                            }
                        }
                        LazyVStack
                        {
                                ForEach(0..<wr.count)
                                {i in
                                    Text("\(wr[i]).").fontWeight(.bold)
                                }.foregroundColor(Color.black)
                        }
                    }
                    
                }
                
                LazyVStack(alignment: .leading)
                {
                    let pS = (Double(corr)/Double(total)*100)
                    let percentScore = round(pS * 10) / 10.0
                    // roundedValue is 5.5
                    
                    ZStack
                    {
                        Rectangle().multilineTextAlignment(.center).padding(.horizontal, 80.0).padding(.vertical, 15.0).background(Color.pink).cornerRadius(15).foregroundColor(Color.pink)
                        Text("\(corr) out of \(total) answers correct").fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    }
                    ZStack
                    {
                        Rectangle().multilineTextAlignment(.center).padding(.horizontal, 80.0).padding(.vertical, 15.0).background(Color.pink).cornerRadius(15).foregroundColor(Color.pink)
                        Text("Score: \(Int(percentScore))%").fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
                    }
                    
                }.padding(.horizontal)
                
                
                LazyVStack(alignment: .center)
                {
                    Button (
                        action:
                            {
                                //disabled = true
                            }, label: {
                                Text("Save Results").fontWeight(.bold).multilineTextAlignment(.center).padding(.horizontal, 90.0).padding(.vertical, 10.0).background(Color.blue).foregroundColor(Color.white).cornerRadius(15)
                            }
                    )
                }.padding()
            //}.navigationBarTitle("Your Results")
        
        
    }
    
    }
    struct ResultsView_Previews: PreviewProvider {
        static var previews: some View {
            ResultsView(sai: [1,2,3,5,5], sai2: [1,2,3,4,5], total: 5)
        }
    }
}
