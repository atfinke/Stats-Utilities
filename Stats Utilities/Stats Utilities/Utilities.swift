//
//  Utilities.swift
//  Stats Utilites
//
//  Created by Andrew Finke on 11/11/18.
//  Copyright © 2018 Andrew Finke. All rights reserved.
//

import Foundation

var maxDecimals = 3

let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.maximumFractionDigits = 6
    formatter.minimumIntegerDigits = 1
    return formatter
}()

func trimmedDecimalNumber(_ number: Double) -> String {
    return formatter.string(from: NSNumber(value: number))!
}

func getInput<T: LosslessStringConvertible>(_ prompt: String?) -> T {
    if let prompt = prompt {
        print(prompt)
    }

    let input = readLine()!
    let components = input.components(separatedBy: ".")
    if components.count == 2 {
        maxDecimals = max(maxDecimals, components[1].count)
        formatter.maximumFractionDigits = maxDecimals
    }
    

    return T(input)!
}

func printResultSectionTitle(_ title: String) {
    print("\n------------------------\nResult - " + title + ":\n")
}

func printProgramTitle(_ title: String) {
    print("\n========================\n" + title + "\n")
}

func printBounds(_ lower: Double, _ higher: Double) {
    print("(\(lower), \(higher))")
}

func printTrimmedBounds(_ lower: Double, _ higher: Double) {
    print("(\(trimmedDecimalNumber(lower)), \(trimmedDecimalNumber(higher)))")
}


