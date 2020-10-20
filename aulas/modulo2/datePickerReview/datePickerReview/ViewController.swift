//
//  ViewController.swift
//  datePickerReview
//
//  Created by Elder Alcantara on 13/09/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var weeksLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myDatePicker.maximumDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())
        
        
    }
    
    func daysBetweenDates( initialDate: Date) -> Int {
        let calendar: Calendar = Calendar.current
        let date1 = calendar.startOfDay(for: initialDate)
        let date2 = calendar.startOfDay(for: Date())
        return calendar.dateComponents([.day], from: date1, to: date2).day!
    }



    
    @IBAction func setDate(_ sender: UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.short
        formatter.timeStyle = DateFormatter.Style.short
        
        
        let birthday = formatter.date(from: formatter.string(from: self.myDatePicker.date))
        let timeInterval = birthday?.timeIntervalSinceNow
        let age = abs(Int(timeInterval! / 31556926.0))
        
        
        if age > 1 {
            self.myLabel.text = String(age) + " anos"
        } else if age == 1 {
            self.myLabel.text = String(age) + " ano"
        } else{
            self.myLabel.text = "Menos de 1 ano"
        }
        
        
        let sumDays: Int = daysBetweenDates(initialDate: birthday!)
        
        self.weeksLabel.text = String(sumDays / 7) + " SEMANAS"
        self.daysLabel.text = String(sumDays % 7) + " DIAS"
        print(sumDays)
        
        
    }
    
    
    
    
}

