//
//  BuyViewController.swift
//  BioFarm
//
//  Created by Jay Staker on 1/24/15.
//
// Money does not change for some reason
//  yield is mispelled
//potential 
//2 dukes of hazard
//1 lightning
//2 aliens
//possible before and after views

import Foundation
import UIKit

class BuyViewController: UIViewController {

    // Segment Controller for crop choice
    @IBOutlet var seg_CropChoice: UISegmentedControl!
    
    // Labels
    @IBOutlet var lbl_Calculation: UILabel!
    @IBOutlet var lbl_Insur: UILabel!
    @IBOutlet var lbl_Price: UILabel!
    @IBOutlet var lbl_CropInfo: UILabel!
    @IBOutlet var lbl_OtherCropInfo: UILabel!

    // Switch
    @IBOutlet var swt_Insur: UISwitch!
    
    // Images
    @IBOutlet var img_Crop: UIImageView!
    
    // Buttons
    @IBOutlet var btn_Buy: OBShapedButton!
  
    
    // Internal Variables
    
    var isInsured : Bool = true
    var cropToBuy : Crops = .Empty
    var calculatedCost : Double = 0
    var cropSellingPrice: Float = 0
    
    // Values passed from GameView
    var selectedFarm : Int = 1
    var juansFarmInBuyView: FarmJV?
    
    //Some colors that reflect Iowa State these were actually given to me to put in the game
    private var redColor : UIColor = UIColor(red: 206.0/255.0, green: 17.0/255.0, blue: 38.0/255.0, alpha: 1.0)
    private var greenColor: UIColor = UIColor(red: 7.0/255.0, green: 109.0/255.0, blue: 84.0/255.0, alpha: 1.0)
    
    //System Methods
    
    /*
        A defualt function to set up the view when its first loaded. Sets up an image of the farms current crop
        and sets the label to show the price of that crop for the farm. Then updates the crop to whatever the 
        selector has set.
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         //Set Crop Image
        img_Crop.image = UIImage(named: juansFarmInBuyView!.fields[selectedFarm].getCropSprite())

        
        //Show Price of land
        lbl_Price.text = String(format: "$%.2f", juansFarmInBuyView!.getCostOfPurchase(selectedFarm, whichCrop: cropToBuy))
        
        
        cropUpdate(self)
    }
    
    /*
        A defualt function to deal with memory warnings.
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //GUI Methods
    
    /*
        Updates the image displayed based on the segment selected. then changes calls change Insurance.
    */
    
    @IBAction func cropUpdate(sender: AnyObject) {
        
        switch seg_CropChoice.selectedSegmentIndex {
                
            // Corn
            case 0: cropToBuy = Crops.Corn
            swt_Insur.hidden = false
            swt_Insur.on = true
            
            //sets what C6 will say in his text bubbles
            if(juansFarmInBuyView!.yearCount != 1){
                lbl_OtherCropInfo.text = String(format: "This field had %@ last year", juansFarmInBuyView!.previousYearFields[selectedFarm].getCropName())
            }
            else{
                lbl_OtherCropInfo.text = "Remember to rotate your crops!"
            }
            lbl_CropInfo.text = "Corn is processed for food for both humans and animals along with industrial products such as ethanol."
            
            img_Crop.image = UIImage(named: cropToBuy.getCropSprite())
            cropSellingPrice = Float(juansFarmInBuyView!.cornSellingPrice)
            
            // Soybean
            case 1: cropToBuy = Crops.Soybean
            swt_Insur.hidden = false
            swt_Insur.on = true
            
             //sets what C6 will say in his text bubbles
            if(juansFarmInBuyView!.yearCount != 1){
                lbl_OtherCropInfo.text = String(format: "You planted %@ last year", juansFarmInBuyView!.previousYearFields[selectedFarm].getCropName())
            }
            else{
                lbl_OtherCropInfo.text = "Remember to rotate your crops!"
            }
            lbl_CropInfo.text = "Soybeans are processed for oil, animal feed, and other industrial products. A small percentage is used for human consumption such as soymilk, soy, and flour."
            
            img_Crop.image = UIImage(named: cropToBuy.getCropSprite())
            cropSellingPrice = Float(juansFarmInBuyView!.soybeanSellingPrice)

            // Switchgrass
            case 2: cropToBuy = Crops.Switchgrass
            swt_Insur.hidden = true
            
             //sets what C6 will say in his text bubbles
            if(juansFarmInBuyView!.yearCount != 1){
                lbl_OtherCropInfo.text = String(format: "You planted %@ last year", juansFarmInBuyView!.previousYearFields[selectedFarm].getCropName())
            }
            else{
                lbl_OtherCropInfo.text = "Remember to rotate your crops!"
            }
            lbl_CropInfo.text = "Switchgrass is used as feedstock for animals and other bio-friendly uses such as the development of bio-mass, methods for energy production, and cover for soil."
            
            swt_Insur.setOn(false, animated: false) //changes insure switch off since switch grass has no insurance
            img_Crop.image = UIImage(named: cropToBuy.getCropSprite())
            cropSellingPrice = Float(juansFarmInBuyView!.switchgrassSellingPrice)
            default: break
        }
        
        //Update Insur Policy
        changeInsurance(self)
    }
    
    /*
        Changes the state of the insurance label depending on if the state of the insurance switch.
    */
    @IBAction func changeInsurance(sender: AnyObject) {
        // Change insur on crop
        if(swt_Insur.on) {
            lbl_Insur.text = "You are insured"
            if(cropToBuy == .Corn){
                cropToBuy = .InsuredCorn
            }
            else if(cropToBuy == .Soybean){
                cropToBuy = .InsuredSoybean
            }
        }
        else{
            lbl_Insur.text = "You are not insured"
            if(cropToBuy == .InsuredCorn){
                cropToBuy = .Corn
            }
            else if(cropToBuy == .InsuredSoybean){
                cropToBuy = .Soybean
            }
        }
        
        //Calls update on calculation text field
        updateCalculation()
    }
    
    /*
        Buys the selected crop on the selected farm. It also determines if the player can afford to purchase the crop
        and if not it changes the C6's text color to red and changes what he says.
    */
    @IBAction func buy() {
        if(juansFarmInBuyView!.currentMoney < juansFarmInBuyView!.getCostOfPurchase(selectedFarm, whichCrop: cropToBuy)){
            lbl_OtherCropInfo.text = "You do not have enough money to buy that"
            lbl_OtherCropInfo.textColor = redColor
            return
        }
        else{
             juansFarmInBuyView!.plant(whichField: selectedFarm, whichCrop: cropToBuy)
            self.performSegueWithIdentifier("exitFromStore", sender: self)
        }
      
    
    }
    
    //Background Methods
    
    /*
        Updates the calculation label based on the current crop selected and its insurance. 
    */
    func updateCalculation () {
        //values used in method
        
        var cost = cropToBuy.getCropCost()
        var name = juansFarmInBuyView!.fields[selectedFarm].getCropName()
            
        lbl_Calculation.text = String(format: "%@: \nnumber of acres %.0f * \nprice of crop %.2f\n Market Price: %.2f", name, juansFarmInBuyView!.fieldSizes[selectedFarm], cost, cropSellingPrice)
        
        var calculatedCost = cost * juansFarmInBuyView!.fieldSizes[selectedFarm]
        lbl_Price.text = String(format: "$%.2f", calculatedCost)
     
    }
}