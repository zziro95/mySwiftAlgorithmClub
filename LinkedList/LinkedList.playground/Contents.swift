import UIKit

// 제네릭을 이용해 Linked List의 항목들이 될 노드 구현
class Node<T> {
    var value: T
    var next: Node?
    var previous: Node?
    
    init(value: T) {
        self.value = value
    }
}

// 링크드리스트 구현
class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node<T>? {
        return head
    }
    
    var last: Node<T>? {
        return tail
    }
    
    func append(value: T) {
        let newNode = Node(value: value)
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }
}

// 값이 잘 들어가는지 확인, 출력
let countryLinkedList: LinkedList<String> = LinkedList<String>()
countryLinkedList.append(value: "Korea")
countryLinkedList.append(value: "Greece")
countryLinkedList.append(value: "UK")

//print(countryLinkedList) // __lldb_expr_14.LinkedList<Swift.String>
//print(countryLinkedList.head?.value) // Optional("Korea")

extension LinkedList: CustomStringConvertible {
    var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
}

print(countryLinkedList) // [Korea, Greece, UK]
print(countryLinkedList.description) // [Korea, Greece, UK]
