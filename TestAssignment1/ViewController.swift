//
//  ViewController.swift
//  TestAssignment1
//
//  Created by Pavan Gandhi on 30/06/16.
//  Copyright © 2016 Pavan Gandhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var arr : NSMutableArray = NSMutableArray()
    @IBOutlet var txtValue : UITextField!
    @IBOutlet var btnPrintSeries : UIButton!
    
    var Size : Int = 0
    var i : Int = 0
    var j : Int = 0
    var N : Int = 0
    var left :Int = 0
    var top : Int = 0
 
    var dict : NSMutableDictionary = NSMutableDictionary()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setNavigationBar("Perfect Square")
        self.txtValue!.attributedPlaceholder = NSAttributedString(string:"Enter Value",
                                                                  attributes:[NSForegroundColorAttributeName: UIColor.blackColor()])
        AppUtilities.drawClearBorderToTextfield(self.txtValue!, cornerRadius: 5.0, borderRadius: 1.0)
        self.btnPrintSeries.layer.cornerRadius = 5.0
        // set custom number toolbar keyboard
        let numberToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 150))
        numberToolbar.barStyle = UIBarStyle.BlackTranslucent
        numberToolbar.items = NSArray(objects:
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil),
                                      UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil),
                                      UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: "returnKeyboradField:")) as? [UIBarButtonItem]
        numberToolbar.sizeToFit()

        self.txtValue.inputAccessoryView = numberToolbar
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /*========================================================
     * function Name: returnKeyboradField
     * function Purpose: To hide keyboard by pressing on done button
     * function Parameters: sender: AnyObject
     * function ReturnType: nil
     *=======================================================*/

    @IBAction func returnKeyboradField(sender: AnyObject)
    {
        self.txtValue!.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*========================================================
     * function Name: printPatternClicked
     * function Purpose: Displaying output by performing this action event
     * function Parameters: sender: AnyObject
     * function ReturnType: nil
     *=======================================================*/

    @IBAction func printPatternClicked(sender: AnyObject)
    {
        self.txtValue.resignFirstResponder()
        
        if NSString(string : self.txtValue.text!).length <= 0 {
            AppUtilities.drawRedBorderToTextfield(self.txtValue, cornerRadius: 5.0, borderRadius: 1.0)
            AppUtilities.showAlertWithMessage("TestAssignment1", message: "Please Enter proper value")
        }
        else
        {
            AppUtilities.drawClearBorderToTextfield(self.txtValue, cornerRadius: 5.0, borderRadius: 1.0)
            // Getting total Size
            Size = NSString(string : self.txtValue.text! as String).integerValue
            top = Size - 1
            
            for(i=0; i < Size/2; i++, left++,top--)
            {
                //filling from left to right
                for(j = left;  j <= top; j++, N++)
                {
                    let strKey : NSString = NSString(format: "%d%d", left,j)
                    dict.setValue(N, forKey: strKey as String)
                    
                }
                
                //Fills from top to down
                for(j = left+1;  j <= top; j++, N++)
                {
                    let strKey : NSString = NSString(format: "%d%d", j,top)
                    dict.setValue(N, forKey: strKey as String)
                }
                
                //Fills from right to left
                for(j = top - 1;  j >= left; j--, N++)
                {
                    let strKey : NSString = NSString(format: "%d%d", top,j)
                    dict.setValue(N, forKey: strKey as String)
                }
                
                //Fills from down to top
                for(j = top - 1;  j >= left+1; j--, N++)
                {
                    let strKey : NSString = NSString(format: "%d%d", j,left)
                    dict.setValue(N, forKey: strKey as String)
                }
            }
            
            
            // Showing alert to notify that ouput is prited on console
            var alert : UIAlertView = UIAlertView(title: "TestAssignment1", message: "Please Check Output on Console", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
            
            NSLog("%@", "\n\nPerfect Square Output : \n\n")
            //Print the pattern
            for(i=0; i < Size; i++)
            {
                var finalString : NSMutableString = NSMutableString()
                for(j=0; j < Size; j++)
                {
                    let strkey : NSString = NSString(format: "%d%d", i, j)
                    let value : NSString = NSString(format: "%@", (dict.valueForKey(strkey as String) as? NSNumber)!)
                    finalString.appendString(NSString(format: "%-5d", value.integerValue) as String)
                    finalString.appendString(" ")
                }
                print(finalString)
            }
        }
    }
    
    func setNavigationBar(title: NSString)
    {
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        
        // Title of Navigation Item
        let navigationTitleLbl:UILabel = UILabel(frame:CGRectMake(0, 0, 320, 40.0))
        navigationTitleLbl.text = title as String
        navigationTitleLbl.font =  UIFont.boldSystemFontOfSize(18.0)
        navigationTitleLbl.font =  UIFont(name: "helvetica-newue", size: 20.0)
        navigationTitleLbl.textColor=UIColor.whiteColor()
        navigationTitleLbl.textAlignment = NSTextAlignment.Center
        navigationTitleLbl.frame = CGRectMake(100, 0.0, 100, 100)
        self.navigationItem.titleView = navigationTitleLbl

        
    }

    
}

