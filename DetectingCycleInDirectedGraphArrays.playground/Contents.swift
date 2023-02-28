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

one.children = [two]
two.children = [four, five]
three.children = [one]
four.children = [three]
five.children = []

class Node {
    let id: Int
    var children: [Node]
    
    init(id: Int, children: [Node] = []) {
        self.id = id
        self.children = children
    }
}

var visited: Set<Int> = []
var inStack: Set<Int> = []

func dfs(_ root: Node?, _ stack: [Node]) {
    guard let root = root else {
        return
    }
    
    inStack.insert(root.id)
    visited.insert(root.id)
    let children = root.children
    
    for child in children {
        if !visited.contains(child.id) {
            var newStack = stack
            newStack.append(child)
            dfs(child, newStack)
        } else if inStack.contains(child.id) {
            var path = stack
            path.append(child)
            print(path.map { $0.id })
        }
    }
    inStack.remove(root.id)
}


dfs(one, [])
