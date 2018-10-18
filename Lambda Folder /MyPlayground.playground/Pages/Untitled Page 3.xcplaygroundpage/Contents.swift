let array = [11, 3, 6, 2, 9]

//print(array.sorted(by: { $0 < $1 }))
//print(array.sorted(by: { $0 > $1 }))
//
//print(array.sorted(by: <))
//print(array.sorted(by: >))

extension Int {
    var isEven: Bool {
        return (self % 2) == 0
    }
}

5.isEven
4.isEven

//print(array.filter({ ($0 % 2) == 0 }))
//print(array.filter({ ($0 % 2) != 0 }))

// let array = [11, 3, 6, 2, 9]
func doSomething(value: Int) -> String {
    return value < 5 ? "less than 5" : "greater than 5"
}

//print(array.map(doSomething))
//print(array.map({ $0 * 2 }))
//
//let array2 = ["hello", "there"] // domain
//print(array2.map({ string in string.uppercased() })) // domain mapped into the range

//let optionals: [Int?] = [1, 3, nil, 2, nil, nil, nil, 10]
//print(optionals.compactMap({ $0 }))
//
//let strings = ["1", "3", "hello", "5", "there", "6"]
////let results1 = strings.map({ string in Int(string) })
////let results2 = strings.compactMap({ string in Int(string) })
//let results1 = strings.map({ Int($0) })
//let results2 = strings.compactMap({ Int($0) })
//print(results1)
//print(results2)



// let array = [11, 3, 6, 2, 9]
//print(array.reduce(0, +))
//print(array.reduce(0, { $0 + $1 }))
//print(array.reduce(0, { currentValue, newValue in  currentValue + newValue }))
//print(array.reduce(0, { currentValue, newValue in
//  print("Current value is \(currentValue)")
//  print("Member of the array is \(newValue)")
//  return currentValue + newValue
//}))

// print([3, 2, 4].reduce(0, { $0 * $1 }))

// print(["hello", "there", "world"].reduce("", { $0 + $1 }))

print(["oh", "what", "fun"].reduce(7, { sum, current in
    print("Our sum starts at \(sum)")
    print("Our sum ends at \(sum + current.count) for \(current)")
    return sum + current.count
}))
