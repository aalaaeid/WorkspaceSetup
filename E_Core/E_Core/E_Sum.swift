//
//  File.swift
//  E_Core
//
//  Created by Alaa Eid on 12/02/2024.
//

import Foundation

public class SumValues {
    
    public init() { }
    public func sum(numbers: [Int]) -> Int {
        var result: Int = 0
        numbers.forEach {
            result += $0
        }
        return result
    }
    
}
