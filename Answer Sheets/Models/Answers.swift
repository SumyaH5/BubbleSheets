//
//  Answers.swift
//  Answer Sheets
//
//  Created by Sumya Hoque on 10/9/22.
//

import Foundation
class Answer: Identifiable, Decodable
{
    var choice:String = ""
    var selectedAnswerIndex:Int = 5
    var id = UUID()
    var si = [0]
    var si2 = [0]
    
    init(_ c:String)
    {
        choice = c
        
    }
    init(_ one:[Int], _ two:[Int])
    {
        si = one
        si2 = two
    }
        
    func startGrading(_ arr1:[Int], arr2:[Int]) -> [Int]
    {
        var wrongAns = [Int]()
        for i in 0..<arr1.count
        {
            if arr1[i] != arr2[i]
            {
                wrongAns.append(i+1)
            }
                
        }
        return wrongAns
    }
    func stopGrading(_ arr1:[Int], arr2:[Int], ter:Int) -> Int
    {
        var corrAns = 0
        for i in 0..<ter
        {
            if arr1[i] == arr2[i]
            {
                corrAns+=1
            }
                
        }
        return corrAns
    }
    
    func stopTest(_ min:Int, _ hr:Int, _ sec:Int) -> Bool
    {
        var stawp = false
        if min==0 && hr==0 && sec==0
        {
            stawp = true
        }
        return stawp
    }
    
    func blankAnswers(_ arr1:[Int]) -> Int
    {
        var bA = 0
        for i in 0..<arr1.count
        {
            if arr1[i] == 0
            {
                bA += 1
            }
                
        }
        return bA
    }
    
    func changePage(_ arr1:[Int], _ size:Int) -> Bool
    {
        var cP = true
        for i in 0..<size
        {
            if arr1[i] == 0
            {
                cP = false
            }
                
        }
        return cP
    }
}


