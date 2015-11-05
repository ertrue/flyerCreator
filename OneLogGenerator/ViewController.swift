//
//  ViewController.swift
//  OneLogGenerator
//
//  Created by Hongbo Zhang on 11/3/15.
//  Copyright © 2015 Hongbo Zhang. All rights reserved.
//

import UIKit
import QuartzCore
import CoreGraphics

//extension UIImage {
//    func withInvertedMaskFrom(image:UIImage, position:CGPoint) -> UIImage {
//        UIGraphicsBeginImageContextWithOptions(size, false, scale)
//        drawAtPoint(CGPointZero)
//        image.drawAtPoint(position, blendMode: CGBlendMode.DestinationOut, alpha: 1.0)
//        let result = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return result
//    }
//}

//class posterUIImageView: UIImageView {
//    
//    override func drawRect(rect: CGRect) {
//        super.drawRect(rect)
//        UIColor.redColor().setFill()
//        let path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10)
//        path.fill()
//        
//        let context = UIGraphicsGetCurrentContext()
//        CGContextSaveGState(context);
//    
//        CGContextSetBlendMode(context, CGBlendMode.DestinationOut);
//        let mywords: NSString = "hello!"
//        
//        let font = UIFont(name: "Helvetica Bold", size: 14.0)
//        
//        let textStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
//        let textColor = UIColor(red: 0.147, green: 0.222, blue: 0.162, alpha: 1.0)
//        
//        if let actualFont = font {
//            let textFontAttributes = [
//                NSFontAttributeName: actualFont,
//                NSForegroundColorAttributeName: textColor,
//                NSParagraphStyleAttributeName: textStyle
//            ]
//            
//            mywords.drawAtPoint(CGPointZero, withAttributes: textFontAttributes)
//        }
//        CGContextRestoreGState(context);
//    }
//}

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    
    @IBOutlet weak var TopLeftTextField: UITextField!
    @IBOutlet weak var TopRightTextField: UITextField!
    @IBOutlet weak var BottomLeftTextField: UITextField!
    @IBOutlet weak var BottomRightTextField: UITextField!
    
    @IBOutlet weak var backgroundImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TopLeftTextField.delegate = self
        TopRightTextField.delegate = self
        BottomLeftTextField.delegate = self
        BottomRightTextField.delegate = self
        
       let picture = UIImage(data: NSData(contentsOfURL: NSURL(string: "http://i.stack.imgur.com/Xs4RX.jpg")!)!)!
//        let logo = UIImage(data: NSData(contentsOfURL: NSURL(string: "https://dl.dropboxusercontent.com/u/87285547/chat_bubble.png")!)!)!
        
//        backgroundImageView.image = setImageForView(picture, text: "hello World!")
//
        let rainbow = UIImage(named: "Background")
        
        backgroundImageView.image = rainbow
        
        let mask = CATextLayer()
        mask.backgroundColor = UIColor(white: 1, alpha: 0).CGColor
        mask.foregroundColor = UIColor(white: 1, alpha: 1).CGColor
        mask.font = "Helvetica-Bold"
        mask.fontSize = 20
        mask.frame = backgroundImageView.frame
        mask.string = "hello!"
        mask.alignmentMode = kCAAlignmentCenter
        mask.bounds = CGRect(origin: CGPointZero, size: backgroundImageView.image!.size)
        
        backgroundImageView.layer.mask = mask
        
        self.view.addSubview(backgroundImageView)
        
        // hello world!
        
//        backgroundImageView.drawRect(backgroundImageView.frame)

        
//        CGContextSetBlendMode(mask, CGBlendMode.DestinationOut)
//        
//        mask.contents = logo.CGImage

        //backgroundImageView.drawRect(backgroundImageView.bounds)
//        let size = backgroundImageView.frame.size
//        let rect = CGRectMake(0, 0, size.width, size.height)
//        UIGraphicsBeginImageContext(size)
//        picture.drawInRect(rect)
//        logo.drawInRect(rect, blendMode: CGBlendMode.DestinationOut, alpha: 1.0)
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        backgroundImageView.image = newImage
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        // some action here.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        backgroundImageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func maskImage (image: UIImage, maskRef: CGImageRef) -> UIImage {
        
        let mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
            CGImageGetHeight(maskRef),
            CGImageGetBitsPerComponent(maskRef),
            CGImageGetBitsPerPixel(maskRef),
            CGImageGetBytesPerRow(maskRef),
            CGImageGetDataProvider(maskRef), nil, false);
        
        let maskedImageRef = CGImageCreateWithMask(image.CGImage, mask);
        let maskedImage = UIImage(CGImage: maskedImageRef!)
        
        // returns new image with mask applied
        return maskedImage;
    }
    
    func setImageForView(image: UIImage, text: NSString) -> UIImage {
        
        let attributes = [NSFontAttributeName: UIFont(name: "Georgia", size: 30)!, NSBackgroundColorAttributeName: UIColor.blackColor()]
//            NSForegroundColorAttributeName: UIColor.whiteColor().CGColor,        NSBackgroundColorAttributeName: UIColor.blackColor().CGColor]
        
        let size = text.sizeWithAttributes(attributes)
        
//        let center = image.center;
//        imageView.frame = CGRectMake(0, 0, size.width + 10, 41);
//        imageView.center = center;
//        UIGraphicsBeginImageContext(imageView.bounds.size);
        let context = UIGraphicsGetCurrentContext();
        
//        // Draw a dark gray background
//        let rect = image.;
//        CGContextFillRect(context, rect);
//        
        // Draw the text upside-down
        CGContextSaveGState(context);
        
        CGContextSetInterpolationQuality( context , CGInterpolationQuality.High );
        text.drawInRect(CGRectMake((200 - size.width) / 2, (100 - size.height) / 2, size.width, size.height), withAttributes:attributes);
        CGContextRestoreGState(context);
        
        // Create an image mask from what we've drawn so far
        let alphaMask = CGBitmapContextCreateImage(context);
        UIGraphicsEndImageContext();
        
        return maskImage(image, maskRef: alphaMask!)
    }

    
    
    @IBAction func generateImageView(sender: UIButton) {
        // to send the text field content to image creator
        
    }
    
}

