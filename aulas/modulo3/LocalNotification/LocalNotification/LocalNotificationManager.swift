//
//  LocalNotificationManager.swift
//  LocalNotification
//
//  Created by Elder Alcantara on 28/01/21.
//

import Foundation
import UserNotifications

struct Notification {
    
    var id: String
    var title: String
}


class LocalNotificationManager {
    
    var notifications = [Notification]()
    
    func requestPermission() {
        
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.alert, .badge]) { (success, error) in
                
                if success == true && error == nil {
                    
                    print("Deu bom temos a permissão!")
                    
                }
            }
    }
    
    func addNotification(title: String) {
        
        notifications.append(Notification(id: UUID().uuidString, title: title))
        
    }
    
    
    func removeNotification(id: String) {
        
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [id])
        
        print("removeNotification \(id)")
        
    }
    
    
    func sheduleNotification() {
        
        for notification in notifications {
            let content = UNMutableNotificationContent()
            content.title = notification.title
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 8, repeats: false)
            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { (error) in
                
                if error == nil {
                    
                    print("notification agendada id:\(notification.id)")
                }
                
            }
 
        }
   
    }
    
}
