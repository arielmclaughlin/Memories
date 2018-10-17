import Cocoa

var str = "Hello, iOS3"

func products(_ array: [Int]) -> [Int] {
    let indices = array.indices
    return Array(indices).map({
        var copy = array // handy
        copy.remove(at: $0)
        return copy.reduce(1, *) // get the product of an array
    })
}

let array1 = [1, 2, 3, 4, 5, 6]
let array2: [Int] = []
let array3 = [1, 5]

products(array1)
products(array2)
products(array3)

func timesTwo(value: Int) -> Int {
    return value * 2
}

timesTwo(value: 6)

[1, 2, 3, 4].map({
    (value: Int) -> Int in
    value * 2
})

[3, 7, 1, 8].map(timesTwo)
let x = ["a", "b", "c", "d"].map({ $0.uppercased() })
print(x)

// [1, 2, 3, 4, 1, 2, 3, 4]
// [2, 4, 6, 8]

func reverseString(_ string: String) -> String {
    return String(string.reversed())
}

let words = ["dog", "princess", "house"]
let reversedWords = words.map(reverseString)

func reverseString2(_ string: String) -> String {
    var result = ""
    for character in string {
        result = String(character) + result
    }
    return result
}

reverseString2("princess")

func reverseString3(_ string: String) -> String {
    var array: [Character] = []
    for character in string {
        array.insert(character, at: 0)
    }
    return String(array)
}

reverseString3("princess")

let string = "princess"
let index = string.index(string.startIndex, offsetBy: 2)
let letter = string[index]

extension String {
    subscript(at idx: Int) -> Character {
        let index = self.index(self.startIndex, offsetBy: idx)
        return string[index]
    }
}

for index in 0 ..< string.count {
    if string[at: index] == "i" {
        print("found an i")
    }
}

let foo = "👨‍👩‍👧‍👧"

print("Princess"[at:2])



func plus1(value value: Int) -> Int {
    return value + 1
}

func plus2(_ value: Int) -> Int {
    return value + 2
}

func plus3(to value: Int) -> Int {
    return value + 3
}

plus1(value: 5)
plus2(5)
plus3(to: 5)
