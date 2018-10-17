import Cocoa

func firstFunction() {
    print("Hello world!")
    print("How are you?")
}

func add(num1: Int, num2: Int) {
    print(num1 + num2)
}

func multiply(num1: Int, numb2: Int) -> Int {
    return num1 * numb2
}

print(multiply(num1: 3, numb2: 4))
