
import Foundation

func pointsBelong(x1: Int, y1: Int, x2: Int, y2: Int, x3: Int, y3: Int, xp: Int, yp: Int, xq: Int, yq: Int) -> Int {
    if x1 == 0, x2 == 0, x3 == 0 {
        return 0
    }
    if y1 == 0, y2 == 0, y3 == 0 {
        return 0
    }
    
    let p = isINTringle(x1: x1, y1: y1, x2: x2, y2: y2, x3: x3, y3: y3, xp: xp, yp: yp)
    let q = isINTringle(x1: x1, y1: y1, x2: x2, y2: y2, x3: x3, y3: y3, xp: xq, yp: yq)
    if p == true , q == false {
        return 1
    } else if q == true , p == false {
        return 2
    } else if p , q {
        return 3
    } else {
        return 4
    }

}

func area(x1: Int, y1: Int, x2: Int, y2: Int, x3: Int, y3: Int) -> Double {
    let x = (x1 * (y2 - y3))
    let y =  (x2 * (y3 - y1))
    let z = (x3 * (y1 - y2))
    let sum = abs(x + y + z)
    let reslt = Double(sum) / 2.0
    return reslt
}

func isINTringle(x1: Int, y1: Int, x2: Int, y2: Int, x3: Int, y3: Int, xp: Int, yp: Int) -> Bool{
    let tringleArea = area(x1: x1, y1: y1, x2: x2, y2: y2, x3: x3, y3: y3)
     let areaPX1 = area(x1: xp, y1: yp, x2: x2, y2: y2, x3: x3, y3: y3)
    let areaPX2 = area(x1: x1, y1: y1, x2: xp, y2: yp, x3: x3, y3: y3)
    let areaPX3 = area(x1: x1, y1: y1, x2: x2, y2: y2, x3: xp, y3: yp)
    
    let sum = areaPX1 + areaPX2 + areaPX3
    if sum == tringleArea {
        return true
    } else {
        return false
    }
}


area(x1: 2, y1: 3, x2: 3, y2: 3, x3: 2, y3: 1)
isINTringle(x1: 1, y1: 1, x2: 1, y2: 8, x3: 6, y3: 4, xp: 2, yp: 4)
