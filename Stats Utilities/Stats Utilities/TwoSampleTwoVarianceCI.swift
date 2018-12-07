//
//  main.swift
//  Two Sample Confidence Interval
//
//  Created by Andrew Finke on 11/11/18.
//  Copyright © 2018 Andrew Finke. All rights reserved.
//

import Foundation

struct TwoSampleTwoVarianceCI: Formula {

    static func run() {
        printProgramTitle("Two Sample Confidence Interval")

        let sampleOneAverage: Double = getInput("Enter x-bar for sample 1:")
        let sampleOneSD: Double = getInput("Enter standard deviation for sample 1:")
        let sampleOneSampleCount: Double = getInput("Enter number of samples for sample 1:")

        let sampleTwoAverage: Double = getInput("Enter x-bar for sample 2:")
        let sampleTwoSD: Double = getInput("Enter standard deviation for sample 2:")
        let sampleTwoSampleCount: Double = getInput("Enter number of samples for sample 2:")

        let sampleOneSDSquaredOverCount = pow(sampleOneSD, 2) / sampleOneSampleCount
        let sampleTwoSDSquaredOverCount = pow(sampleTwoSD, 2) / sampleTwoSampleCount

        let topOfDegreesOfFreedomForumla = pow(sampleOneSDSquaredOverCount + sampleTwoSDSquaredOverCount, 2)
        let bottomOfDegreesOfFreedomForumla = pow(sampleOneSDSquaredOverCount, 2) / (sampleOneSampleCount - 1)
            + pow(sampleTwoSDSquaredOverCount, 2) / (sampleTwoSampleCount - 1)

        let degreesOfFreedom = topOfDegreesOfFreedomForumla / bottomOfDegreesOfFreedomForumla
        let freedomBar = String(repeating: "-", count: maxDecimals + 2)

        printResultSectionTitle("Degrees of Freedom")

        print("Formula: ")
        print(topOfDegreesOfFreedomForumla)
        print(freedomBar)
        print(bottomOfDegreesOfFreedomForumla)

        print("\nSimple Formula: ")
        print(trimmedDecimalNumber(topOfDegreesOfFreedomForumla))
        print(freedomBar)
        print(trimmedDecimalNumber(bottomOfDegreesOfFreedomForumla))
        print("\n\nApprox equals: " + trimmedDecimalNumber(degreesOfFreedom))

        let startOfConfidenceInterval = sampleOneAverage - sampleTwoAverage
        let endOfConfidenceInterval = sqrt(sampleOneSDSquaredOverCount + sampleTwoSDSquaredOverCount)
        let showWorkString = "Formula: "
            + trimmedDecimalNumber(startOfConfidenceInterval)
            + " ± Talpha/2,"
            + Int(degreesOfFreedom).description
            + " * "
            + trimmedDecimalNumber(endOfConfidenceInterval)

        printResultSectionTitle("Confidence Interval")
        print(showWorkString)

        let tString = "\nEnter enter the T table value for alpha/2, " + Int(degreesOfFreedom).description + ": "
        let tTableValue: Double = getInput(tString)

        let lowerBound = startOfConfidenceInterval - tTableValue * endOfConfidenceInterval
        let upperBound = startOfConfidenceInterval + tTableValue * endOfConfidenceInterval

        print("\nBounds:")
        printTrimmedBounds(lowerBound, upperBound)
    }
}
