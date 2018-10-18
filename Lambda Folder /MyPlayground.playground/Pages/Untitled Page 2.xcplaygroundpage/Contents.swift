//Functions are known because they are named and have argument labels.
// Closure is without labels

func testEquality(x first: Int, y second: Int) -> Bool {
    return first == second
}

// Closure
//Anonymous function -- without a name
let myFunction = testEquality

testEquality(x: 1, y: 3)
myFunction(1, 3)

let myClosure: (Int, Int) -> Bool = { x, y in
    return x == y
}

myClosure(1, 3)

//FULLY SPCIFIED CLOSURE
// It has parameters that are typed
// It specifies the return type
// And it has a direct return declaration

let myClosure2 = { (x: Int, y: Int) -> Bool in
    return x == y
}

myClosure2(1, 3)
