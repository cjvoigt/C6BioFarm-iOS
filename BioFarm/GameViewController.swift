//
//  GameViewController.swift
//  BioFarm
//
//  Created by Jay Staker on 1/23/15.
//
//put a select all button for quick selection

import Foundation
import UIKit
import AVFoundation

class GameViewController : UIViewController{
    
    //Labels
    @IBOutlet var lbl_Money : UILabel!
    @IBOutlet var lbl_harvestMod: UILabel!
    @IBOutlet var lbl_modiferText: UILabel!
    @IBOutlet var lbl_Farm1: UILabel!
    @IBOutlet var lbl_Farm2: UILabel!
    @IBOutlet var lbl_Farm3: UILabel!
    @IBOutlet var lbl_Farm4: UILabel!
    @IBOutlet var lbl_Farm5: UILabel!
    @IBOutlet var lbl_Farm6: UILabel!
    @IBOutlet var lbl_Farm7: UILabel!
    @IBOutlet var lbl_Farm8: UILabel!
    
    //Buttons
    @IBOutlet var btn_Farm1: OBShapedButton!
    @IBOutlet var btn_Farm2: OBShapedButton!
    @IBOutlet var btn_Farm3: OBShapedButton!
    @IBOutlet var btn_Farm4: OBShapedButton!
    @IBOutlet var btn_Farm5: OBShapedButton!
    @IBOutlet var btn_Farm6: OBShapedButton!
    @IBOutlet var btn_Farm7: OBShapedButton!
    @IBOutlet var btn_Farm8: OBShapedButton!
    @IBOutlet var btn_harvest: UIButton!
    
    //Iowa State red and Greeen colors
    private var redColor : UIColor = UIColor(red: 206.0/255.0, green: 17.0/255.0, blue: 38.0/255.0, alpha: 1.0)
    private var greenColor: UIColor = UIColor(red: 7.0/255.0, green: 109.0/255.0, blue: 84.0/255.0, alpha: 1.0)
    
    //Other Instance Variables
    private var selectedFarm : Int = 1
    private var juansFarm : FarmJV = FarmJV()
    private var modifier: Float = 0.0
    private var eventText: String = ""
    private var profit : Float = 0.0
    private var totalMoney: Float = 0.0
    
    //Sound Variables
    var effectsPlayer : AVAudioPlayer? = AVAudioPlayer()
    
    //System Methods
    
    /*
        A defualt function to set up the view when it is first loaded. It sets up the buttons with defualt imagesa
        and aspect ratios. 
    */
    
    override func viewDidLoad(){
        //what runs when this view is first loaded
        super.viewDidLoad()
        
        //setting default outputs
        self.refresh()
        setButtonAspect()
        lbl_harvestMod.text = "Year: \(juansFarm.yearCount)"
        }
    
    /*
    This method checks if it is game over for the player by checking if the player can still buy land, but only 
    if the field is empty.
    */
    override func viewDidAppear(animated: Bool) {
        if(juansFarm.cannotBuy() && juansFarm.isFarmEmpty()){
            self.performSegueWithIdentifier("toGameOverView", sender: self)
        }
    }
    
    
    /*
        A defualt function that deals with memory warnings.
    */
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
        //super.didReceiveMemoryWarning()/Users/jstaker/Documents/Jackson-/BioFarm_NEW/BioFarm/BioFarm/GameViewController.swift
    }
    
    /*
        Sets the aspect ratio for all the picturs in the farm buttons.
    */
    
    func setButtonAspect() {
        btn_Farm1.imageView?.contentMode = .ScaleAspectFit
        btn_Farm2.imageView?.contentMode = .ScaleAspectFit
        btn_Farm3.imageView?.contentMode = .ScaleAspectFit
        btn_Farm4.imageView?.contentMode = .ScaleAspectFit
        btn_Farm5.imageView?.contentMode = .ScaleAspectFit
        btn_Farm6.imageView?.contentMode = .ScaleAspectFit
        btn_Farm7.imageView?.contentMode = .ScaleAspectFit
        btn_Farm8.imageView?.contentMode = .ScaleAspectFit
    }
    
    //Refresh Methods
    
    /*
        Refreshes the information on all labels on the game screen. These labels are temporary and used for debugging.
        "People like the labels so keep them on or modify them." - Juan
    */
    
    func refresh(){

        
        //Updates the amount of money shown
        lbl_Money.text = String(format: "$%.2f", juansFarm.currentMoney)
        
        //Update labels for each farm
        lbl_Farm1.text = String(format: "%.0f acres of %@", juansFarm.fieldSizes[0], juansFarm.fields[0].getCropName())
        lbl_Farm2.text = String(format: "%.0f acres of %@", juansFarm.fieldSizes[1], juansFarm.fields[1].getCropName())
        lbl_Farm3.text = String(format: "%.0f acres of %@", juansFarm.fieldSizes[2], juansFarm.fields[2].getCropName())
        lbl_Farm4.text = String(format: "%.0f acres of %@", juansFarm.fieldSizes[3], juansFarm.fields[3].getCropName())
        lbl_Farm5.text = String(format: "%.0f acres of %@", juansFarm.fieldSizes[4], juansFarm.fields[4].getCropName())
        lbl_Farm6.text = String(format: "%.0f acres of %@", juansFarm.fieldSizes[5], juansFarm.fields[5].getCropName())
        lbl_Farm7.text = String(format: "%.0f acres of %@", juansFarm.fieldSizes[6], juansFarm.fields[6].getCropName())
        lbl_Farm8.text = String(format: "%.0f acres of %@", juansFarm.fieldSizes[7], juansFarm.fields[7].getCropName())
        //TODO: put this in a loop for easier future formating
        
    }
    
    
    /*
        Refreshs all button images after a new crop has been planted.
    */
    
    func refreshImages(){
        
        var tempImage : UIImage = UIImage(named: juansFarm.fields[selectedFarm].getLandSprite(selectedFarm))!
        switch selectedFarm{
            case 0:btn_Farm1.setBackgroundImage(tempImage, forState: btn_Farm1.state)
            case 1:btn_Farm2.setBackgroundImage(tempImage, forState: btn_Farm2.state)
            case 2:btn_Farm3.setBackgroundImage(tempImage, forState: btn_Farm3.state)
            case 3:btn_Farm4.setBackgroundImage(tempImage, forState: btn_Farm4.state)
            case 4:btn_Farm5.setBackgroundImage(tempImage, forState: btn_Farm5.state)
            case 5:btn_Farm6.setBackgroundImage(tempImage, forState: btn_Farm6.state)
            case 6:btn_Farm7.setBackgroundImage(tempImage, forState: btn_Farm7.state)
            case 7:btn_Farm8.setBackgroundImage(tempImage, forState: btn_Farm8.state)
            default: return//btn_Farm1.setImage(tempImage, forState: btn_Farm1.state)
        }
    }
    
    /*
    The following is a reset method used for clearing certain information after a year.
    It clears certain information from the farm class, and resets the background images for the buttons
    */
    
    func reset() {
        juansFarm.reset()
        for(var i = 0; i < 8; i++){
            var tempImage : UIImage = UIImage(named: juansFarm.fields[i].getLandSprite(i))!
            switch i{
            case 0:btn_Farm1.setBackgroundImage(tempImage, forState: btn_Farm1.state)
            case 1:btn_Farm2.setBackgroundImage(tempImage, forState: btn_Farm2.state)
            case 2:btn_Farm3.setBackgroundImage(tempImage, forState: btn_Farm3.state)
            case 3:btn_Farm4.setBackgroundImage(tempImage, forState: btn_Farm4.state)
            case 4:btn_Farm5.setBackgroundImage(tempImage, forState: btn_Farm5.state)
            case 5:btn_Farm6.setBackgroundImage(tempImage, forState: btn_Farm6.state)
            case 6:btn_Farm7.setBackgroundImage(tempImage, forState: btn_Farm7.state)
            case 7:btn_Farm8.setBackgroundImage(tempImage, forState: btn_Farm8.state)
            default: return//btn_Farm1.setImage(tempImage, forState: btn_Farm1.state)
            }
        }

    }

    //Methods for Buttons
    
    /*
        Used when the harvest button is pressed. It gets the event for that year and cacluates the profit.
        It also plays a sound effect based on that event and resets all farms.
    */
    
    @IBAction func harvestYear(sender: AnyObject) {
        //Checks if there is something in the farm first
        if(juansFarm.isFarmEmpty()){
            return
        }
        //performs the procedures for harvesting a year
        else{
        //creates an event, mod number and then calculates the yield of each field based on the mod number
        //it then calculates the revenue made and finally adds the revenue to the current money of the farm
            
        juansFarm.eventGenerator()
        juansFarm.calculateYield()
        juansFarm.calculateRevenue()
        juansFarm.Harvest()
            
            //checks if the player can go another year and buy land and if not game over
            
            if(juansFarm.currentMoney < 12000){
             self.performSegueWithIdentifier("toGameOverView", sender: self)
            }
            else{
              var eventSound : String = ""
        
        
        eventSound = juansFarm.event!.getEventSound()!
        //Play sound
        prepareHarvestSound(eventSound)
        effectsPlayer!.play()
        
        //Temp Variable for profit and tempFarm for results view
        profit = juansFarm.getProfit()
        modifier = juansFarm.modifierNumber
        eventText = juansFarm.event!.getEventText()
        totalMoney = juansFarm.currentMoney
      
        
       
        
        //Print Year Results
        lbl_harvestMod.text = String(format: "Year: %d \nModifier: %.2f\nProfit: $%.2f", juansFarm.yearCount, juansFarm.modifierNumber, profit)
        
        //print flavor Text
            if(modifier == 1.0){
                lbl_modiferText.textColor = greenColor
                lbl_modiferText.text = juansFarm.event!.getEventText()
            }
            else{
                lbl_modiferText.textColor = redColor
                lbl_modiferText.text = juansFarm.event!.getEventText()
            }
       
        
        //Refresh Screen (for crops)
            reset()
            refresh()
        
        
       //toResultsView
        self.performSegueWithIdentifier("toResultsView", sender: self)
  
        }
  
            }
                    }
    
    /*
        Prepares the the sound effect from the yearly event to be played.
    */
    func prepareHarvestSound(eventSound : String) {
        var snd_applause = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(eventSound, ofType: "mp3")!)
        var tempVol = effectsPlayer!.volume
        effectsPlayer = AVAudioPlayer(contentsOfURL: snd_applause, error: nil)
        effectsPlayer!.prepareToPlay()
        effectsPlayer!.volume = tempVol
    }

    /*
        When a farm button is pressed this button finds which button it was so that the correct farm is modified.
        It then sends the app to the buy screen.
    */
    
    @IBAction func goToBuyScreen(sender: AnyObject) {
        //Decided what farm to send to buyView
        //the button also locks after a purchase is made
        
        switch sender {
            case btn_Farm1 as UIButton:
                if(juansFarm.hasBought[0]){
                    return
                }else{
                    selectedFarm = 0
                }
            case btn_Farm2 as UIButton:
                if(juansFarm.hasBought[1]){
                    return
                }
                else{ selectedFarm = 1
            }
            case btn_Farm3 as UIButton:
                if(juansFarm.hasBought[2]){
                    return
                }else{
                   selectedFarm = 2
                }
            case btn_Farm4 as UIButton:
                if(juansFarm.hasBought[3]){
                    return
                }else{
                    selectedFarm = 3
                }
            case btn_Farm5 as UIButton:
                if(juansFarm.hasBought[4]){
                  return
                }else{
                    selectedFarm = 4
                }
        case btn_Farm6 as UIButton:
            if(juansFarm.hasBought[5]){
            return
            }else{
                selectedFarm = 5
            }
            case btn_Farm7 as UIButton:
                if(juansFarm.hasBought[6]){
                    return
                }else{
                    selectedFarm = 6
                }
            case btn_Farm8 as UIButton:
                if(juansFarm.hasBought[7]){
                    return
                }else{
                    selectedFarm = 7
                }
            default: selectedFarm = 0
        }
        //Do the segue to buy view
        self.performSegueWithIdentifier("toBuyView", sender: self)
    }
    
    //Methods for Segues
    
    /*
        Prepares app to go to the buy view or results view by figuring out which view is needed and
        sending the correct data for that view.
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        segue.destinationViewController
        
        if(segue.identifier == "toBuyView"){
            var dest : BuyViewController = segue.destinationViewController as! BuyViewController
            dest.selectedFarm = self.selectedFarm
            dest.juansFarmInBuyView = juansFarm
        }
        else if(segue.identifier == "toResultsView"){
            var dest : ResultsTableViewController = segue.destinationViewController as! ResultsTableViewController
           
            dest.year = juansFarm.yearCount
            dest.mod = modifier
            dest.modText = eventText
            dest.profit = self.profit
            dest.totalMoney = juansFarm.currentMoney
          
        }
        else if(segue.identifier == "toGameOverView"){
            var dest: GameOverViewController = segue.destinationViewController as! GameOverViewController
            dest.yearsPassed = juansFarm.yearCount
            dest.currentMoney = juansFarm.currentMoney
        }
    
        
        
    }
    
    /*
        Rereshes the images and labels after returning from the buy screen.
    */
    @IBAction func unwindFromBuy(unwindSegue: UIStoryboardSegue){
        refresh()
        refreshImages()
    }
    
}