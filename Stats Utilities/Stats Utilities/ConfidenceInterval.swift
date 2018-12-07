//
//  ConfidenceInterval.swift
//  Stats Utilities
//
//  Created by Andrew Finke on 11/11/18.
//  Copyright © 2018 Andrew Finke. All rights reserved.
//

import Foundation

struct ConfidenceInterval: Formula {

    static func run() {
        printProgramTitle("Confidence Interval")

        let average: Double = getInput("Enter x-bar:")
        let sd: Double = getInput("Enter standard deviation:")
        let sampleCount: Double = getInput("Enter number of samples:")
        let tValue: Double = getInput("Enter t value:")

        let endOfConfidenceInterval = tValue * sd / sqrt(sampleCount)
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
