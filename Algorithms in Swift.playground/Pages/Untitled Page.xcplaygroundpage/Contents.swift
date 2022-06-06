import UIKit

//let array = [1,3,4,5,3,2]
//
//for num in array {
//    var array2 = [Int]()
//    array2.append(num)
//    print(array2)
//}

func waterfallStreams(_ array: [[Double]], _ source:Int) -> [Double] {
    var rowAbove = array[0]
    rowAbove[source] = -1
    
    for row in stride(from: 1, to: array.count, by: 1) {
        var currentRow = array[row]
        for idx in 0 ..< rowAbove.count {
            let valueAbove = rowAbove[idx]
            
            let hasWaterAbove = valueAbove < 0
            let hasBlock = currentRow[idx] == 1
            
            if !hasWaterAbove {
                continue
            }
            
            if !hasBlock {
                currentRow[idx] += valueAbove
                continue
            }
            
            let splitWater = valueAbove / 2
            
            // Move right
            var rightIdx = idx
            while rightIdx + 1 < rowAbove.count {
                rightIdx += 1
                if rowAbove[rightIdx] == 1.0 {
                    break
                }
                if currentRow[rightIdx] != 1.0 {
                    currentRow[rightIdx] += splitWater
                    break
                }
            }
            
            // Move Left
            var leftIdx = idx
            while leftIdx - 1 >= 0 {
                leftIdx -= 1
                if rowAbove[leftIdx] == 1.0 {
                    break
                }
                if currentRow[leftIdx] != 1.0 {
                    currentRow[leftIdx] += splitWater
                    break
                }
            }
        }
        rowAbove = currentRow
    }
    
    
    var finalPercentages = [Double]()
    for num in rowAbove {
        if num == 0 {
            finalPercentages.append(num)
        } else {
            finalPercentages.append(num * (-100))
        }
    }
    return finalPercentages
}


let matrix: [[Double]] = [
    [0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0],
    [0, 0, 1, 1, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [1, 1, 1, 0, 0, 1, 0],
    [0, 0, 0, 0, 0, 0, 1],
    [0, 0, 0, 0, 0, 0, 0]
  ]
let source = 3

let test = waterfallStreams(matrix, source); print(test)


// Node swap
class NodeSwap_Solution1 {
    class LinkedList {
        var value: Int
        var next: LinkedList?
        
        init(value: Int) {
            self.value = value
        }
    }
    
    // O(n) time | O(n) space - where n is the number of nodes in the linked list
    func nodeSwap(_ head: LinkedList) -> LinkedList {
        return recursiveNodeSwap(head)!
    }
    
    func recursiveNodeSwap(_ head: LinkedList?) -> LinkedList? {
        if head == nil || head!.next == nil {
            return head
        }
        
        let nextNode = head!.next
        head!.next = recursiveNodeSwap(head!.next!.next)
        nextNode!.next = head
        return nextNode
    }
}

class NodeSwap_Solution2 {
    class LinkedList {
        var value: Int
        var next: LinkedList?
        
        init(value: Int) {
            self.value = value
        }
    }
    
    // This solution is iterative
    // O(n) time | O(1) space - where n is the number of nodes in the linked list
    func nodeSwap(_ head: LinkedList) -> LinkedList {
        let tempNode = LinkedList(value: 0)
        tempNode.next = head
        
        var prevNode: LinkedList? = tempNode
        while prevNode!.next != nil, prevNode!.next!.next != nil {
            let firstNode = prevNode!.next
            let secondNode = prevNode!.next!.next
            
            firstNode!.next = secondNode!.next
            secondNode!.next = firstNode
            prevNode!.next = secondNode
            
            prevNode = firstNode
        }
        return tempNode.next!
    }
}
