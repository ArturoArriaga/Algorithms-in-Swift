//: [Previous](@previous)

import Foundation

// Search a binary search tree for a target value and return the closest value in the tree.

class BST {
    var value: Int
    var left: BST?
    var right: BST?
    
    init(value: Int) {
        self.value = value
        left = nil
        right = nil
    }
}

func findClosestValue(tree: BST?, target: Int) -> Int {
    var closest = tree!.value
    return findClosestValueHelper(tree: tree, target: target, closest: &closest)
}

func findClosestValueHelper(tree: BST?, target: Int, closest: inout Int) -> Int {
    // base case, if tree is nil, return closest.
    if tree === nil {
        return closest
    }
    
    // get closest differ and current distance
    if let tree = tree {
        let closestDiff = target - closest
        let currentDist = target - tree.value
        
        if closestDiff.magnitude > currentDist.magnitude {
            closest = tree.value
        }
    }
    
    // go down left side, if possible
    if let tree = tree, target < tree.value {
        // at each node, call self and repeat. 
        if let left = tree.left {
            return findClosestValueHelper(tree: left, target: target, closest: &closest)
        } else {
            return closest
        }
    // or go down right side, if possible
    } else if let tree = tree, target > tree.value {
        if let right = tree.right {
            return findClosestValueHelper(tree: right, target: target, closest: &closest)

        } else {
            return closest
        }
    } else {
        return closest
    }
}
