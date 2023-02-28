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

enum NodeState {
    case unvisited
    case visiting
    case visited
}

var parent: [Int: Int] = [:]
var visited: [Int: NodeState] = [:]

for i in 1...5 {
    visited[i] = .unvisited
}

class Node {
    let id: Int
    var children: [Node]
    
    init(id: Int, children: [Node] = []) {
        self.id = id
        self.children = children
    }
}

func dfs(_ root: Node?) {
    
    guard let root = root else {
        return
    }
    
    visited[root.id] = .visiting
    let children = root.children
        
    for child in children {
        parent[child.id] = root.id

        if visited[child.id] == .unvisited {
            dfs(child)
        } else if visited[child.id] == .visiting {
            findCyclePath(root, child)
            return
        }
    }
    visited[root.id] = .visited
}

private func findCyclePath(_ start: Node?, _ end: Node) {
    var path: [Int?] = []
    var parentElement: Int? = start?.id
    path.append(end.id)
    while parentElement != nil && parentElement != end.id {
        path.append(parentElement)
        parentElement = parent[parentElement!, default: 0]
    }

    print(path)
}


dfs(one)
