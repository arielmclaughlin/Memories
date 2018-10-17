import UIKit
import UserNotifications

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return times.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(times[row]) seconds"
    }
    
    
    let times = [5, 10, 15, 60]
    @IBOutlet weak var notificationField: UITextField!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func schedule(_ sender: Any) {
        
        // build the content
        
        guard let text = notificationField.text, !text.isEmpty else { return }
        let content = UNMutableNotificationContent()
        content.title = "Notification!"
        content.body = text
        
        // Set the time for triggering the notification
        let timeInterval = Double(times[pickerView.selectedRow(inComponent: 0)])
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        //Build request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        //Schedule the notification
        let center = UNUserNotificationCenter.current()
        center.add(request) { error in
            if let error = error {
                NSLog("Error scheduling notification: \(error)")
                return
            }
            
            NSLog("Notification scheduled for \(timeInterval) seconds in the future")
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

