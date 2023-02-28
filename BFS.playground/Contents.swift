import UIKit

// Example graph
//
// 1 ---- 2
// |      | \
// |      |  \
// 3 ---- 4   5


var one = Node(id: 1)
var two = Node(id: 2)
var three = Node(id: 3)
var four = Node(id: 4)
var five = Node(id: 5)

one.children = [two, three]
two.children = [one, four, five]
three.children = [one, four]
four.children = [three, two]
five.children = [two]

class Node {
    let id: Int
    var children: [Node]
    
    init(id: Int, children: [Node] = []) {
        self.id = id
        self.children = children
    }
}

func bfs(_ start: Node) {
    var queue: [Node] = []
    var visited: Set<Int> = []
    
    visited.insert(start.id)
    queue.append(start)
    
    while !queue.isEmpty {
        for item in queue {
            let first = queue.removeFirst()
            print(first.id)
            for child in first.children {
                if !visited.contains(child.id) {
                    visited.insert(child.id)
                    queue.append(child)
                }
            }
        }
    }
}

bfs(one)
