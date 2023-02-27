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

// This class will be used later in every algorithm
class Node {
    let id: Int
    var children: [Node]
    
    init(id: Int, children: [Node] = []) {
        self.id = id
        self.children = children
    }
}

var visited: Set<Int> = []

func dfs(_ root: Node?)  {

    guard let root = root else {
        return
    }
    
    print(root.id)
    visited.insert(root.id)

    for child in root.children {
        if !visited.contains(child.id) {
            dfs(child)
        }
    }
}

dfs(one)
