//
//  Grader.swift
//  Answer Sheets
//
//  Created by Sumya Hoque on 10/15/22.
//

import Foundation
class Grader
{
    var arr:[Int]
    var incrementer:Int
    
    init(_ a:[Int], _ i:Int)
    {
        arr = a
        incrementer = i
        
    }
    
    func grade()
    {
        for i in 0..<arr.count
        {
            incrementer+=1
        }
    }
}
