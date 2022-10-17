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
                ScrollView()
                {
                    HStack
                    {
                        LazyVStack(alignment: .leading)
                        {
                            Text("Your Answers:").padding(.leading, 30)
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
                                            Image(systemName: "checkmark").foregroundColor(Color.green)
                                        }
                                        else
                                        {
                                            Image(systemName: "xmark").foregroundColor(Color.red)
                                        }
                                    }
                                }
                            }
                        }.padding(.leading, 25)
                        LazyVStack(alignment: .leading)
                        {
                            Text("Answer Key:").padding(.leading, 30)
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
                    }
                    
                }
                
                LazyVStack(alignment: .leading)
                {
                    let percentScore = (Double(corr)/Double(total)*100)
                    Text("\(corr) out of \(total) answers correct").fontWeight(.bold).multilineTextAlignment(.center).padding(.horizontal, 72.0).padding(.vertical, 10.0).background(Color.pink).foregroundColor(Color.white).cornerRadius(15)
                    Text("Score: \(percentScore)%").fontWeight(.bold).multilineTextAlignment(.center).padding(.horizontal, 100.0).padding(.vertical, 10.0).background(Color.pink).foregroundColor(Color.white).cornerRadius(15)
                    ZStack
                    {
                        Rectangle().multilineTextAlignment(.center).padding(.horizontal, 80.0).padding(.vertical, 15.0).background(Color.pink).cornerRadius(15).foregroundColor(Color.pink)
                        HStack
                        {
                            Text("Questions to work on:").fontWeight(.bold).padding(5).background(Color.pink).foregroundColor(Color.white)
                            ForEach(0..<wr.count)
                            {i in
                                if i == sai.count
                                {
                                    Text("\(wr[i])").fontWeight(.bold)
                                }
                                else
                                {
                                    Text("\(wr[i]),").fontWeight(.bold)
                                }
                            }.foregroundColor(Color.white)
                        }
                    }
                    
                }.padding()
                
                
                LazyVStack(alignment: .center)
                {
                    Button (
                        action:
                            {
                                let d = Grader(sai, corr)
                                d.grade()
                                
                            }, label: {
                                Text("Show Grade").fontWeight(.bold).multilineTextAlignment(.center).padding(.horizontal, 90.0).padding(.vertical, 10.0).background(Color.green).foregroundColor(Color.white).cornerRadius(15)
                            }
                    )
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
            ResultsView(sai: [1,2,3,4,5], sai2: [1,2,3,4,5], total: 5)
        }
    }
}
