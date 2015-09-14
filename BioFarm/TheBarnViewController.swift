//
//  TheBarnViewController.swift
//  BioFarm
//
//  Created by Jay Staker on 7/14/15.
//
//

import UIKit

class TheBarnViewController: UIViewController {

    //Internal Variables
    var whichInfoToPresent : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "toCropInfo"){
            var dest: CropViewController = segue.destinationViewController as! CropViewController
            
            dest.whichInfo = whichInfoToPresent
            
        }
        
    }
    @IBAction func btn_Carbon(sender: AnyObject) {
        whichInfoToPresent = 4
        self.performSegueWithIdentifier("toCropInfo", sender: self)
    }
    
    @IBAction func btn_Soybeans(sender: AnyObject) {
        whichInfoToPresent = 2
        self.performSegueWithIdentifier("toCropInfo", sender: self)
        
    }
    
    @IBAction func btn_Switchgrass(sender: AnyObject) {
        whichInfoToPresent = 3
        self.performSegueWithIdentifier("toCropInfo", sender: self)
        
    }
    
    @IBAction func btn_Corn(sender: AnyObject) {
        whichInfoToPresent = 1
        self.performSegueWithIdentifier("toCropInfo", sender: self)
    }

    @IBAction func btn_StemCareers(sender: AnyObject) {
        whichInfoToPresent = 5
        self.performSegueWithIdentifier("toCropInfo", sender: self)
        
        
    }
    @IBAction func btn_HowToPlay(sender: AnyObject) {
        self.performSegueWithIdentifier("toBarnInfo", sender: self)
        
    }
   

}
