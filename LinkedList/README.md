### LinkedList

---

#### LinkedList의 구조와 종류

`LinkedList`란 데이터 항목들을 차례로 배열하는 구조를 의미합니다.

각 항목은 `node`라고 표현됩니다.

`LinkedList`는 `Singly linked list`(단일 연결 리스트)와 `Doubly Linked list`(이중 연결 리스트)가 있다.

`Singly linked list`는 각 노드가 다음 노드에 대한 참조만 갖는 `LinkedList`이다.

![Screen Shot 2021-01-07 at 7.12.49 PM](/Users/jinhochoi/Desktop/Screen Shot 2021-01-07 at 7.12.49 PM.png)

`Doubly Linked list`는 각 노드가 이전, 다음 노드에 대한 참조를 갖는 `LinkedList`이다.

![Screen Shot 2021-01-07 at 7.12.56 PM](/Users/jinhochoi/Desktop/Screen Shot 2021-01-07 at 7.12.56 PM.png)

![Screen Shot 2021-01-07 at 7.28.33 PM](/Users/jinhochoi/Desktop/Screen Shot 2021-01-07 at 7.28.33 PM.png)

이중 연결 리스트 같은 경우는 목록이 시작되고 끝나는 위치를 추적해야 한다.

일반적으로 `head`와 `tail`이라는 키워드로 표현하는 것 같다.

---

#### Node

`Linked List`는 `node`로 구성되어 있기 때문에 노드를 먼저 만들어 주어야 한다.

`Linked List`의 각 노드들은 다른 노드를 참조하기 때문에 참조 당하기 때문에 `Struct`가 아닌 `Class`로 만들어 주는 것이 맞다고 생각하였습니다.

```swift
// 제네릭을 이용해 Linked List의 항목들이 될 노드 구현
class Node<T> {
    var value: T
    var next: Node?
    var previous: Node?
    
    init(value: T) {
        self.value = value
    }
}
```

Node 타입에는 값(value)과 다음 노드(next)와 이전 노드(previous)에 대한 포인터가 필요하다.

이전 노드와 다음 노드는 없을 수 있기 때문에 `Optional`타입으로 선언해 주었습니다.

예제에서는 이전 노드를 `weak`로 선언해 주었는데 `ARC`와 `Memory Management`에 대해 아직 정확하게 알고 있지 않으므로 생략하였습니다. (추후 알아보고 수정할 예정)

---

#### Linked List

`Linked List` 또한 값 타입이 아닌 참조 타입이 맞다고 생각하여 `Class`로 만들어 주었습니다.

```swift
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
}
```

첫번째 노드와 마지막 노드 프로퍼티를 가지고 있고, 연결 리스트가 비어있는지, 첫번째 노드, 마지막 노드가 무엇인지 알려주는 프로퍼티를 선언해 주었습니다.

```swift
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
```

노드를 추가하는 메서드 입니다.

리스트에 마지막 노드가 있다면, 새로운 노드의 이전 노드로 할당을 해주고, 기존의 마지막 노드의 다음 노드로 새로운 노드를 할당 시켜줍니다.

그렇지 않다면 비어있다는 뜻이니 `head`에 새로운 노드를 할당해 줍니다.

동시에 어느 경우든 노드를 추가하면 가장 마지막 노드가 될 테니 `tail`에 새로운 노드를 할당시켜줍니다.

```swift
// 값이 잘 들어가는지 확인, 출력
let countryLinkedList: LinkedList<String> = LinkedList<String>()
countryLinkedList.append(value: "Korea")
countryLinkedList.append(value: "Greece")
countryLinkedList.append(value: "UK")

/* countryLinkedList 를 출력했을 때 나오는 문구는 확실하게 이해가 되진 않는다.
	 lldb 공부후 돌아와 다시 보려고 한다.
*/
print(countryLinkedList) // __lldb_expr_14.LinkedList<Swift.String>
print(countryLinkedList.head?.value) // Optional("Korea")
```

값은 잘 들어간것 같은데 countryLinkedList 목록을 확인하는데는 불편함이 있습니다.

참고한 링크에서 더 읽기 쉬운 문자열 출력을 위해 `CustomStringConvertable`프로토콜을 채택하여 따라해 보았습니다.

```swift

```

 

참고링크

https://www.raywenderlich.com/947-swift-algorithm-club-swift-linked-list-data-structure

https://github.com/raywenderlich/swift-algorithm-club/tree/master/Linked%20List