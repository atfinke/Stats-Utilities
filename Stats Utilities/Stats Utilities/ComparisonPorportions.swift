//
//  ComparisonPorportions.swift
//  Stats Utilities
//
//  Created by Andrew Finke on 12/1/18.
//  Copyright © 2018 Andrew Finke. All rights reserved.
//

import Foundation

struct ComparisonPorportions: Formula {

    static func run() {
        printProgramTitle("Comparison Porportions")

        let p1: Double = getInput("Enter p1:")
        let sampleCount1: Double = getInput("Enter number of samples p1:")
        let p2: Double = getInput("Enter p2:")
        let sampleCount2: Double = getInput("Enter number of samples p2:")

        let zValue: Double = getInput("Enter z value:")

        let startOfConfidenceInterval = p1 - p2
        let endEndOfConfidenceInterval = p1 * (1 - p1) / sampleCount1 + p2 * (1 - p2) / sampleCount2
        let endOfConfidenceInterval = zValue * sqrt(endEndOfConfidenceInterval)
        let showEarlierWorkString = "Formula: "
            + trimmedDecimalNumber(p1)
            + " - "
            + trimmedDecimalNumber(p2)
            + " ± "
            + trimmedDecimalNumber(zValue)
            + " * sqrt["
            + trimmedDecimalNumber(endEndOfConfidenceInterval)
            + "]"

        printResultSectionTitle("Work")
        print(showEarlierWorkString)

        let showWorkString = "Formula: "
            + trimmedDecimalNumber(startOfConfidenceInterval)
            + " ± "
            + trimmedDecimalNumber(endOfConfidenceInterval)

        printResultSectionTitle("Interval")
        print(showWorkString)

        let lowerBound = startOfConfidenceInterval - endOfConfidenceInterval
        let upperBound = startOfConfidenceInterval + endOfConfidenceInterval

        print("\nBounds:")
        printTrimmedBounds(lowerBound, upperBound)
    }
}
