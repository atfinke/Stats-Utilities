//
//  ToleranceInterval.swift
//  Stats Utilities
//
//  Created by Andrew Finke on 11/15/18.
//  Copyright © 2018 Andrew Finke. All rights reserved.
//

import Foundation

struct ToleranceInterval: Formula {

    static func run() {
        printProgramTitle("Tolerance Interval")

        let average: Double = getInput("Enter x-bar:")
        let sd: Double = getInput("Enter standard deviation:")
        let kValue: Double = getInput("Enter k value:")

        let endOfConfidenceInterval = kValue * sd
        let showWorkString = "Formula: "
            + trimmedDecimalNumber(average)
            + " ± "
            + trimmedDecimalNumber(endOfConfidenceInterval)

        printResultSectionTitle("Interval")
        print(showWorkString)

        let lowerBound = average - endOfConfidenceInterval
        let upperBound = average + endOfConfidenceInterval

        print("\nBounds:")
        printTrimmedBounds(lowerBound, upperBound)
    }
}
