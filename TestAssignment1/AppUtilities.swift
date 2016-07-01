//
//  AppUtilities.swift
//  TestAssignment2
//
//  Created by Pavan Gandhi on 30/06/16.
//  Copyright (c) 2016 Pavan Gandhi. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration
class AppUtilities : NSObject
{
    
    /*===================================================
     * function Name : getUserDefaults
     * function Params: key:NSString
     * fuction  Return type: NSString
     * function Purpose: to get user default value
     ===================================================*/
    
    class func resignTextField(textField:UITextField)
    {
        if(textField.isFirstResponder())
        {
            textField.resignFirstResponder()
        }
    }
    
    class func resignTextView(textField:UITextView)
    {
        if(textField.isFirstResponder())
        {
            textField.resignFirstResponder()
        }
    }
    
    /*========================================================
     * function Name: isValidEmailAddress
     * function Purpose: check email address is valid
     * function Parameters: testStr: NSString
     * function ReturnType: Bool
     * function Description: check email address is valid
     *=====================================================*/
    
    class func isValidEmailAddress(testStr: NSString)->Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    /*========================================================
     * function Name: drawRedBorderToTextfield
     * function Purpose: drawRedBorderToTextfield
     * function Parameters: var txtField:UITextField,var cornerRadius:CGFloat,var borderRadius:CGFloat
     * function ReturnType: nil
     * function Description: drawRedBorderToTextfield
     *=====================================================*/
    
    class func drawRedBorderToTextfield(txtField:UITextField, cornerRadius:CGFloat, borderRadius:CGFloat)
    {
        txtField.layer.borderWidth=borderRadius
        txtField.layer.cornerRadius=cornerRadius
        txtField.layer.borderColor=UIColor.redColor().CGColor
        txtField.text=""
    }
    
    /*========================================================
     * function Name: drawClearBorderToTextfield
     * function Purpose: drawClearBorderToTextfield
     * function Parameters: var txtField:UITextField,var cornerRadius:CGFloat,var borderRadius:CGFloat
     * function ReturnType: nil
     * function Description: drawClearBorderToTextfield
     *=====================================================*/
    
    class func drawClearBorderToTextfield(txtField:UITextField,cornerRadius:CGFloat, borderRadius:CGFloat)
    {
        txtField.layer.borderWidth=borderRadius
        txtField.layer.cornerRadius=cornerRadius
        txtField.layer.borderColor=UIColor.grayColor().CGColor
    }
    
    
    /*========================================================
     * function Name: drawLightGrayBroderAndRadiusToview
     * function Purpose: drawLightGrayBroderAndRadiusToview
     * function Parameters: var view:UIView?,var cornerRadius:CGFloat,var borderWidth:CGFloat
     * function ReturnType: nil
     * function Description: drawLightGrayBroderAndRadiusToview
     *=====================================================*/
    
    class func drawLightGrayBroderAndRadiusToview(view:UIView?,cornerRadius:CGFloat,borderWidth:CGFloat)
    {
        view?.layer.borderWidth=borderWidth
        view?.layer.cornerRadius=cornerRadius
        view?.layer.borderColor=UIColor.redColor().CGColor
    }
    
    
    /*========================================================
     * function Name: testInternetConnection
     * function Purpose: check server is coonected with application
     * function Parameters: nil
     * function ReturnType: bool
     * function Description: check server is coonected with application
     *=====================================================*/
    
    class func isReachable()->Bool
    {
        /*var reachability:Reachability?
         reachability = Reachability(hostName:"192.168.1.23");
         reachability?.startNotifier();
         var netStatus = reachability?.currentReachabilityStatus()
         if(reachability?.currentReachabilityStatus().value == NotReachable.value)
         {
         return false
         }*/
        return true
    }
    
    /*========================================================
     * function Name: isiPad
     * function Purpose: check device is ipad or iphone
     * function Parameters: nil
     * function ReturnType: bool
     * function Description: check device is ipad or iphone
     *=====================================================*/
    
    class func isiPad()->Bool
    {
        return (UIDevice.currentDevice().userInterfaceIdiom == .Pad)
    }
    
    class func drawRedBorderToTextView(txtField:UITextView, cornerRadius:CGFloat, borderRadius:CGFloat)
    {
        txtField.layer.borderWidth=borderRadius
        txtField.layer.cornerRadius=cornerRadius
        txtField.layer.borderColor=UIColor.redColor().CGColor
        txtField.text=""
    }
    
    /*===================================================
     * function Name : convertDate
     * function Params: target : String
     * fuction  Return type: String
     * function Purpose: convert date in (25 May, 1953) format
     ===================================================*/
    
    class func convertDate(target : String) -> String
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let startDateStr  = dateFormatter.dateFromString(target)!
        dateFormatter.dateFormat = "dd MMM, yyyy"
        return dateFormatter.stringFromDate(startDateStr)
    }
    
    /*===================================================
     * function Name : convertDateforDetails
     * function Params: target : String
     * fuction  Return type: String
     * function Purpose: convert date in (Sun, 22 Mar, 2015) format
     ===================================================*/
    
    class func convertDateforDetails(target : String) -> String
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let startDateStr  = dateFormatter.dateFromString(target)!
        dateFormatter.dateFormat = "EEE, dd MMM, yyyy"
        return dateFormatter.stringFromDate(startDateStr)
    }
    
    /*===================================================
     * function Name : convertshortdate
     * function Params: target : String
     * fuction  Return type: String
     * function Purpose: convert data in 05 / 24 format
     ===================================================*/
    
    class func convertshortdate(target : String) -> String
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let startDateStr  = dateFormatter.dateFromString(target)!
        dateFormatter.dateFormat = "MM / dd"
        return dateFormatter.stringFromDate(startDateStr)
    }
    
    /*========================================================
     * function Name: showAlertWithMessage
     * function Purpose: showAlertWithMessage
     * function Parameters: var title: NSString ,var message:NSString
     * function ReturnType: nil
     * function Description: showAlertWithMessage
     *=====================================================*/
    
    class func showAlertWithMessage( title: NSString , message:NSString)
    {
        let alert : UIAlertView = UIAlertView(title: title as String, message: message as String, delegate: nil, cancelButtonTitle: "OK")
        alert.tag = 110101
        alert.show()
    }
    
    /*===================================================
     * function Name : paddingTextField
     * function Params: textField:UITextField!
     * fuction  Return type: none
     * function Purpose: To set textfield Padding
     ===================================================*/
    
    class func paddingTextField(textField:UITextField!, size : CGFloat)
    {
        let paddingView:UIView = UIView(frame: CGRectMake(0, 0, size, textField.frame.size.height))
        let paddingView1:UIView = UIView(frame: CGRectMake(0, 0, 30, textField.frame.size.height))
        textField.leftView = paddingView
        textField.rightView = paddingView1
        textField.rightViewMode = UITextFieldViewMode.Always
        textField.leftViewMode = UITextFieldViewMode.Always
    }
    
    /*========================================================
     * function Name: isBlankSpace
     * function Purpose: To check string contains only whitespace or not
     * function Parameters: txtString:String)
     * function ReturnType: bool
     *=======================================================*/
    
    class func isBlankSpace( txtString:String)->Bool
    {
        let whiteSpace : NSCharacterSet = NSCharacterSet.whitespaceCharacterSet()
        let trimText : NSString = txtString.stringByTrimmingCharactersInSet(whiteSpace)
        if(trimText.length == 0)
        {
            return true
        }
        return false
    }
    
    /*========================================================
     * function Name: trimText
     * function Purpose: To trim space of string
     * function Parameters:txtString:String
     * function ReturnType: NSString
     *=======================================================*/
    
    class func trimText( txtString:String)-> NSString
    {
        let whiteSpace : NSCharacterSet = NSCharacterSet.whitespaceCharacterSet()
        let trimPet : NSString = txtString.stringByTrimmingCharactersInSet(whiteSpace)
        return trimPet
    }
    
    /*========================================================
     * function Name: getScreenWidth()
     * function Purpose: Get current devices width
     * function Parameters:
     * function ReturnType:
     *=======================================================*/
    class func getScreenWidth() -> CGFloat {
        let screenrect:CGRect = UIScreen.mainScreen().bounds
        return screenrect.width
    }
    
    /*========================================================
     * function Name: getScreenWidth()
     * function Purpose: Get current devices width
     * function Parameters:
     * function ReturnType:
     *=======================================================*/
    class func getScreenHeight() -> CGFloat {
        let screenrect:CGRect = UIScreen.mainScreen().bounds
        return screenrect.height
    }
    
    class func drawClearBorderToTextView(txtField:UITextView,cornerRadius:CGFloat, borderRadius:CGFloat)
    {
        txtField.layer.borderWidth=borderRadius
        txtField.layer.cornerRadius=cornerRadius
        txtField.layer.borderColor=UIColor.grayColor().CGColor
    }
    
    
}