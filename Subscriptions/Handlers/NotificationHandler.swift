//
//  NotificationHandler.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 17.11.2023.
//

import Foundation
import UserNotifications

class NotificationHandler: ObservableObject {
    
    //    permission to send notifications
    func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {success, error in
            if success {
                print("Access granted")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    //    notification function
    func createNotification(every interval: Int,
                            date: String,
                            from: Date,
                            nextNotificationDay: String,
                            nextNotificationInterval notificationInterval: Int,
                            repeats: Bool,
                            title: String,
                            body: String) -> String {
        
        var trigger: UNNotificationTrigger?
        
        var nextBillDate: TimeInterval = setNextBillDate(date: date,
                                                         every: interval)
        
        print("next bill date: \(nextBillDate)")
        
        var nextNotificationDate: TimeInterval = setNextNotificationDate(nextNotificationInterval: notificationInterval,
                                                                         nextNotificationDay: nextNotificationDay,
                                                                         nextBillDate: nextBillDate)
        
        print("next notification day: \(nextNotificationDate)")
        
        if nextNotificationDate == 0 {
            return ""
        } else {
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: nextNotificationDate, repeats: true)
        }
        
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
        print("This is notification that you will get every \(nextNotificationDate / 86400) days")
        
        return request.identifier
    }
    
    func setNextNotificationDate(nextNotificationInterval notificationInterval: Int, nextNotificationDay: String, nextBillDate: TimeInterval) -> TimeInterval {
        
        var nextNotificationDate: TimeInterval = 0
        
        if notificationInterval == 31 {
            nextNotificationDate = 0
        } else if notificationInterval == 32 {
            nextNotificationDate = nextBillDate
        } else {
            if nextNotificationDay == "Day(s)" {
                nextNotificationDate = nextBillDate - TimeInterval(60 * 60 * 24 * notificationInterval)
            } else if nextNotificationDay == "Week(s)" {
                nextNotificationDate = nextBillDate - TimeInterval(60 * 60 * 24 * 7 * notificationInterval)
            } else if nextNotificationDay == "Month(s)" {
                nextNotificationDate = nextBillDate - TimeInterval(60 * 60 * 24 * 30 * notificationInterval)
            } else {
                nextNotificationDate = nextBillDate - TimeInterval(60 * 60 * 24 * 365 * notificationInterval)
            }
        }
        
        return nextNotificationDate
    }
    
    func setNextBillDate(date: String, every interval: Int) -> TimeInterval {
        
        var nextBillDate: TimeInterval = 0
        
        if date == "Day(s)" {
            nextBillDate = TimeInterval(60 * 60 * 24 * interval)
        } else if date == "Week(s)" {
            nextBillDate = TimeInterval(60 * 60 * 24 * 7 * interval)
        } else if date == "Month(s)" {
            nextBillDate = TimeInterval(60 * 60 * 24 * 30 * interval)
        } else {
            nextBillDate = TimeInterval(60 * 60 * 24 * 365 * interval)
        }
        
        return nextBillDate
    }

    func deleteNotification(id: String) {
        let center = UNUserNotificationCenter.current()
        
        center.getPendingNotificationRequests { requests in
            let identifiers: [String] = requests.compactMap({$0.identifier}).filter({$0.contains(id)})
            center.removePendingNotificationRequests(withIdentifiers: identifiers)
        }
        
        print("Notification delete with id: \(id)")
    }
}

