//
//  main.swift
//  Stats Utilities
//
//  Created by Andrew Finke on 11/11/18.
//  Copyright © 2018 Andrew Finke. All rights reserved.
//

import Foundation

protocol Formula {
    static func run()
}

print("Andrew's Stat Utilities")

while true {
    print("\n\n========================\nOptions:")
    print("0 - Confidence Intveral")
    print("1 - Prediction Intveral")
    print("2 - Tolerance Intveral")
    print("3 - Porportions Confidence Interval")
    print("4 - Comparison Porportions")
    print("5 - Two Sample, Two Variance Confidence Interval")

    guard let line = readLine(), let option = Int(line) else { continue }

    switch option {
    case 0:
        ConfidenceInterval.run()
    case 1:
        PredictionInterval.run()
    case 2:
        ToleranceInterval.run()
    case 3:
        PorportionsConfidenceInterval.run()
    case 4:
        ComparisonPorportions.run()
    case 5:
        TwoSampleTwoVarianceCI.run()
    default:
        continue
    }
}
