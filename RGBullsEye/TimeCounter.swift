//
//  TimeCounter.swift
//  RGBullsEye
//
//  Created by lailiang on 2020/1/16.
//  Copyright © 2020 Narakai Studio. All rights reserved.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var timer: Timer?
    var counter = 0
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func updateCounter() {
        counter += 1
        objectWillChange.send(self)
    }
}
