import UIKit

class StudentViewController: UIViewController {
    @IBOutlet var nameField: UITextField!
    @IBOutlet var ageField: UITextField!
    @IBOutlet var cohortField: UITextField!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var student: Student?
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        guard let student = student else { return }
        guard let name = nameField.text, !name.isEmpty else { return }
        student.name = name
        student.age = Int(ageField.text ?? "")
        student.cohort = cohortField.text
    }
    
    func studentRecord() -> Student? {
        guard let name = nameField.text, !name.isEmpty else { return nil }
        let age: Int? = Int(ageField.text ?? "")
        let cohort = cohortField.text
        
        return Student(name: name, age: age, cohort: cohort)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let student = student {
            nameField.text = student.name
            if let age = student.age {
                ageField.text = "\(age)"
                
            }
            cohortField.text = student.cohort
        }
    }
}