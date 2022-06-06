//: [Previous](@previous)

import Foundation

// Three Number Sum
// Find all triplets in an array that sum up to a target sum. Return a 2D Array w/ all triplet combinations. The numbers in each triplet should be ordered in ascending order.

// Sample input
var sample1 = [12,3,1,2,-6,5,-8,6]
let sample1Target = 0

//     O(n^2) time | O(n) space
func threeNumberSum(array: inout [Int], targetSum: Int) -> [[Int]] {
    // sort the input array
    array.sort()

    var triplets: [[Int]] = []

    // loop through array once.
    for i in 0..<array.count - 2 {
        // set a pointer on the seccond element
        var left = i + 1
        // set a pointer at the end.
        var right = array.count - 1
        // calculate the sum of the three pointers and move ahead
        while left < right {
            let currentSum = array[i] + array[left] + array[right]
            
            if currentSum == targetSum {
                triplets.append([array[i], array[left], array[right]])
                
                left = left + 1
                right = right - 1
            } else if currentSum < targetSum {
                left = left + 1
            } else if currentSum > targetSum {
                right = right - 1
            }
        }
    }
    return triplets
}

threeNumberSum(array: &sample1, targetSum: sample1Target)
