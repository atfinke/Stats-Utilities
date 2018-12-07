//
//  main.swift
//  Prediction Interval
//
//  Created by Andrew Finke on 11/11/18.
//  Copyright © 2018 Andrew Finke. All rights reserved.
//

import Foundation

struct PredictionInterval: Formula {

    static func run() {
        printProgramTitle("Prediction Interval")

        let average: Double = getInput("Enter x-bar:")
        let sd: Double = getInput("Enter standard deviation:")
        let sampleCount: Double = getInput("Enter number of samples:")
        let tValue: Double = getInput("Enter t value:")

        let endOfConfidenceInterval = tValue * sd * sqrt(1 + 1.0/sampleCount)
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
