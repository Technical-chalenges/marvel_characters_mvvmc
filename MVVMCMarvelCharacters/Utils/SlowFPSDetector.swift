//
//  SlowFPSDetector.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr Fadeev on 26.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import QuartzCore

class SlowFPSDetector {
    var firstTime: Double = 0.0
    var lastTime: Double = 0.0
    func start() {
        let link = CADisplayLink(target: self, selector: #selector(vSyncHandle(link:)))
        link.add(to: RunLoop.main, forMode: .common)
    }
    
    @objc func vSyncHandle(link: CADisplayLink) {
        if firstTime == 0.0 {
            firstTime = link.timestamp
            lastTime = link.timestamp
        }
        
        let currentTime = link.timestamp
        let elapsedTime = floor((currentTime - lastTime) * 10_000)/10
        if elapsedTime > 16.7 {
            print("Frame was dropped with elapsed time of \(elapsedTime)")
        }
        
        lastTime = link.timestamp
    }
}
