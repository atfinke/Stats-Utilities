//
//  PorportionsConfidenceInterval.swift
//  Stats Utilities
//
//  Created by Andrew Finke on 12/1/18.
//  Copyright © 2018 Andrew Finke. All rights reserved.
//

import Foundation

struct PorportionsConfidenceInterval: Formula {

    static func run() {
        printProgramTitle("Porportions Confidence Interval")

        let zValue: Double = getInput("Enter z-value (probs 1.96):")

        let p: Double = getInput("Enter p:")
        let q = 1 - p
        let sampleCount: Double = getInput("Enter number of samples:")

        let startTopOfConfidenceInterval = p + (pow(zValue, 2) / (2 * sampleCount))
        let startBottomOfConfidenceInterval = 1 + (pow(zValue, 2) / (sampleCount))
        let pHat = startTopOfConfidenceInterval / startBottomOfConfidenceInterval

        let freedomBar = String(repeating: "-", count: maxDecimals + 2)

        print("\nStart of Formula (P Hat): ")
        print(trimmedDecimalNumber(startTopOfConfidenceInterval))
        print(freedomBar)
        print(trimmedDecimalNumber(startBottomOfConfidenceInterval))
        print("\n\nApprox equals: " + trimmedDecimalNumber(pHat))

        let endTopOfConfidenceInterval = (p * q / sampleCount) + (pow(zValue, 2) / (4 * pow(sampleCount, 2)))
        let endBottomOfConfidenceInterval = startBottomOfConfidenceInterval
        var endOfConfidenceInterval = endTopOfConfidenceInterval / endBottomOfConfidenceInterval

        print("\nEnd of Formula (P Hat +- t * sqrt[this]): ")
        print(trimmedDecimalNumber(endTopOfConfidenceInterval))
        print(freedomBar)
        print(trimmedDecimalNumber(endBottomOfConfidenceInterval))
        print("\n\nApprox equals: " + trimmedDecimalNumber(endOfConfidenceInterval))

        endOfConfidenceInterval = zValue * sqrt(endOfConfidenceInterval)
        let showWorkString = "Formula: "
            + trimmedDecimalNumber(pHat)
            + " ± "
            + trimmedDecimalNumber(endOfConfidenceInterval)

        printResultSectionTitle("Interval")
        print(showWorkString)

        let lowerBound = pHat - endOfConfidenceInterval
        let upperBound = pHat + endOfConfidenceInterval

        print("\nBounds:")
        printTrimmedBounds(lowerBound, upperBound)
    }
}
