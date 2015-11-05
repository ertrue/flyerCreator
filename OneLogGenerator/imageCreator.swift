//
//  imagePreview.swift
//  OneLogGenerator
//
//  Created by Hongbo Zhang on 11/3/15.
//  Copyright © 2015 Hongbo Zhang. All rights reserved.
//

import UIKit

class imageCreator {
    
    // MARK: Properties
    
    var sTopLeft: String = "ONE"
    var sTopRight: String = "TAIWAN"
    var sBottomLeft: String = "台湾"
    var sBottomRight: String = "就是力量"
    
    var background: UIImage?
    
    // MARK: Initialization
    init?(topleft: String?, topright: String?, bottomleft: String?, bottomright: String?, bg: UIImage?) {
        if topleft != nil {
            sTopLeft = topleft!
        }
        if topright != nil {
            sTopRight = topright!
        }
        if (bottomleft != nil) {
            sBottomLeft = bottomleft!
        }
        if (bottomright != nil) {
            sBottomRight = bottomright!
        }
        self.background = bg
    }
}
