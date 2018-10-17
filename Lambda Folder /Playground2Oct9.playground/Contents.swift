import Cocoa
// Code Challenge:
// Reverse a string in place
// Where can this go wrong?
//
// What happens if the string has an even number of characters?
// What happens if it has an odd number of characters?
// What if it's an empty string?
//
// Bonus question: what is the big-O runtime of your solution?
// that is, relative to the number of elements in the string (n)
// how many steps does your program take?
func swap<Element>(_ a: inout Element, _ b: inout Element)
{
    var temp = a
    a = b
    b = temp
}

func reverse(_ a: String) -> String {
    var str = ""
    for character in a.characters {
        str = "\(character)" + str
        print ( str)
    }
    return str
}
print (reverse("Ariel"))




