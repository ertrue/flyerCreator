//
//  ImageCreatorController.swift
//  OneLogGenerator
//
//  Created by Hongbo Zhang on 11/3/15.
//  Copyright © 2015 Hongbo Zhang. All rights reserved.
//

import UIKit

protocol ImageCreatorDelegate{
    func requiredText() -> String
}

class ImageCreatorController: UIViewController
{
    @IBOutlet weak var backgroundImageViewer: UIImageView!

    @IBOutlet weak var TopLeftLabel: UILabel!
    
    @IBOutlet weak var BottomRightLabel: UILabel!
    @IBOutlet weak var TopRightLabel: UILabel!
    @IBOutlet weak var BottomLeftLabel: UILabel!
    
    
}
