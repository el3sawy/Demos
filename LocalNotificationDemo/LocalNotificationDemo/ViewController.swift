//
//  ViewController.swift
//  LocalNotificationDemo
//
//  Created by NTG on 23/05/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lbl: UILabel!
    let identifier = "HealthDataAlertNotification"
    let defaults =   UserDefaults.standard
    
    var healthDataShowAlert: Bool {
        set { defaults.set(newValue, forKey: "healthDataShowAlertKey") }
        
        get { return defaults.bool(forKey: "healthDataShowAlertKey") }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let array = (UserDefaults.standard.array(forKey: userKey) as? [String]) ?? []
        print(array.count)
        for i in array {
            print(i, "===")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
    }
    
    
    var str: String {
        """
<!DOCTYPE html>
<html>
<ul>
<li> Ahmed </li>
<li> Ahmed </li>
<li> Ahmed </li>
<li> Ahmed </li>

</ul>
</html>
"""
    }
    
    
    func fireNotification() {
        
        let currentDate = Date()
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentDate)
        let minutes = calendar.component(.minute, from: currentDate)
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minutes
        
        // Notification Model
        let notification = LocalNotificationModel(
            title: "Hiiii",
            body: "BOOOdy",
            dateComponents: dateComponents,
            repeats: true,
            identifier: identifier)
        
        // Fire Notification
        LocalNotificationManager.shared.scheduleNotification(model: notification)
        
    }
}



extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
