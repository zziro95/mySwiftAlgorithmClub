import UIKit

struct Point {
    let x: Int
    let y: Int
}

// let p = Point(x: 0, y: 0)
// print(p)  Point(x: 0, y: 0)

extension Point: CustomStringConvertible {
    var description: String {
        return "좌표는: (\(x), \(y))"
    }
}

let p = Point(x: 0, y: 0)
//print(p.description) 좌표는: (0, 0)
let pDescription = String(describing: p)
print(pDescription) // 좌표는: (0, 0)

struct PointGeneric<T>: CustomStringConvertible where T: CustomStringConvertible {
    var description: String {
        return "좌표는: (\(x), \(y))"
    }
    let x: T
    let y: T
}

//extension PointGeneric: CustomStringConvertible {
//    var description: String {
//        return "좌표는: (\(x), \(y))"
//    }
//}

struct zziroType {
    let name: String
}

let pointGeneric = PointGeneric(x: 10, y: 10)
let pointGenericDescription = String(describing: pointGeneric)
print(pointGenericDescription) // 좌표는: (10, 10)

// 오류 발생
//let pointGeneric2 = PointGeneric(x: zziroType(name: "zziro"), y: zziroType(name: "나도 zziro"))
