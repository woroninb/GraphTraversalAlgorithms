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

var visited: Set<Int> = []
var parent: [Int: Int] = [:]

func dfs(_ root: Node?, _ previous: Node?) {

    guard let root = root else {
        return
      }

    visited.insert(root.id)
    
    let children = root.children
    for child in children {
        if !visited.contains(child.id) {
            parent[child.id] = root.id
            dfs(child, root)
        } else if child.id != previous?.id {
            // here we can be sure that we don't have a cycle which consists of only two elements
            // and then we can print stack starting from child
            getPath(root, child)
            return
        }
    }
}

func getPath(_ target: Node, _ start: Node) {
    var x = target.id
    var path: [Int] = []
    
    path.append(target.id)
    
    while x != start.id {
        x = parent[x, default: 0]
        path.append(x)
    }
    
    path.reverse()
    print(path)
}

dfs(one, nil)


