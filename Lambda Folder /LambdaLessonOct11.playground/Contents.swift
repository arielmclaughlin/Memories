import Cocoa

// This is a protocol: struct, class, enumeration
// conformance is " : CustomStringConvertible"
struct Student: CustomStringConvertible, Codable {
    var description: String {
        // return "\(name), \(age), \(cohort)"
        var result = "\(name), Cohort: \(cohort ?? "[Unknown cohort]")"
        if let age = age {
            result += ", \(age) years old"
        }
        return result
    }
    
    let name: String
    let age: Int?
    let cohort: String?
}

let joe = Student(name: "Joe Brown", age: 23, cohort: "FSW99")
let lea = Student(name: "Lea Hernandez", age: 28, cohort: "UX3")

// Doing it with w struct means you don't have to use an initializer.

print(joe)
print(lea)

// JSON is a way encode information to send out to web services and receive infromation. very standard and structured way with infromation

// you only use 'catch' when there is a potential error

do {do {
    let joeencoded = try JSONEncoder().encode(joe)
    if let string = String(data: joeencoded, encoding: .utf8) {
        print(string)
    }
    
    let joedecoded = try JSONDecoder().decode(Student.self, from: joeencoded)
    print(joedecoded)
    
    let myString = """
     {"name":"Will Bundy","age":23,"cohort":"iOS1"}
     """
    if let stringData = myString.data(using: .utf8) {
        let willdecoded = try JSONDecoder().decode(Student.self, from: stringData)
        print(willdecoded)
    }
    
    // let anotherString = "This is a \" in a string"
} catch {
    print("Error: \(error)")
    }

//if you do need to have a "" in a string, the way that you do that is you use a \
}

