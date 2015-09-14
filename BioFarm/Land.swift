//
//  Land.swift
//  BioFarm
//
//  Created by Berns, Alex J on 12/11/14.
//
//

import Foundation
//let ARC4RANDOM_MAX 0x100000000


//enum LandType {
//    case Wet
//    case Dry
//}


/*
    An Enumerated type for the for the different crops.
*/
enum CropType {
    case Corn
    case Grass
    case Soy
    case Empty
}

class Land {
    private let size : Int
    private var type : CropType
    private var insured : Bool
    
    //Crop Rotation Variables
    var oldCrop : CropType = CropType.Empty
    var numOldCrop : Int = 0

    /*
        Intializes the land object with the specified size an empty croptype and no insurance.
    */
    init(size : Int) {
        self.size = size
        type = CropType.Empty
        insured = false
    }
    
    /*
        Intializes the land object with the specified size, crop type and insurance.
    */
    init(size : Int, type : CropType, insur : Bool){
        self.size = size
        self.type = type
        insured = insur
    }
    
    //LAND FUNCTIONS
    
    /*
        Sets the crop type of the land to the specified crop type.
    */
    func plant (toPlant : CropType){
        type = toPlant
    }
    
    /*
        Returns the profit of the of harvesting from the land based on the crop type and size of land.
    */
    func harvest (modifier : Double) -> Double {
        var profit : Double = self.getCropProfit() * Double(self.size)
        
        if(self.isInsured()) {
            profit = profit * max(modifier,0.75)
        } else {
            profit = profit * modifier
        }
        
        //Crop Rotation
        if(type != CropType.Empty && type == oldCrop) {
            numOldCrop++;
            
            //TODO: Get actually calculation
            //Each for each time replanted, mutiply profit by 80%
            for(var i = 0; i < numOldCrop; i++) {
                profit *= 0.8
            }
        } else {
            oldCrop = type
            numOldCrop = 0;
        }
        
        type = .Empty // Resets crop to blank
        return profit
    }
    
    /*
        Reutrns the size of the land in acres.
    */
    func getLandSize() -> Double {
        return Double(size)
    }
    
    /*
        Creates a deep copy of the land.
    */
    func copy() -> Land{
        let tempLand = Land(size: size,type: type,insur: insured)
        return tempLand
    }
    
    //CROP FUNCTIONS
    
    /*
        Returns the crop type planted on the land.
    */
    func getCrop() -> CropType {
        return self.type
    }
    
    /*
        Returns the cost of buying the crop type of the land.
    */
    func getCropCost() -> Double {
        switch type {
        case .Corn :
            if(insured) {
                return 800
            }
            else {
                return 600
            }
        case .Soy :
            if(insured){
                return 600
            }
            else {
                return 450
            }
        case .Grass : return 150
        case .Empty : return 0
        }
    }
    
    /*
        Returns the cost of buying of buying the land.
    */
    func getPlotCost() -> Double {
        return getCropCost() * getLandSize()
    }
    
    /*
        Returns the current crop name.
    */
    func getCropName() ->String {
        switch type {
        case .Corn: return "Corn"
        case .Soy: return "Soybean"
        case .Grass: return "Switchgrass"
        case .Empty: return "Empty"
        }
    }
    
    /*
        Returns how much profit can be earned from the land.
    */
    func getCropProfit() -> Double {
        return Double(getCropYield()) * getCropSellPrice()
    }
    
    /*
        Returns the yield of the land's current crop.
    */
    func getCropYield() -> Int {
        switch type {
            case .Corn : return 178
            case .Soy : return 52
            case .Grass : return 4
            case .Empty : return 0
            default : return 0
        }
    }
    
    /*
        Returns the price of the land's crop.
    */
    func getCropSellPrice() -> Double {
        
        var price = 0.0
        var rand = 0.0
        var rand1 : Int = 0
        
        rand = Double(arc4random_uniform(1000))
        rand1 = Int(arc4random_uniform(10)) + 1
        price = Double(rand1) + (rand / 100.0)
        
        switch type {
        case .Corn : return price
        case .Soy : return price
        case .Grass : return price
        case .Empty : return price
        }
    }
    
    /*
        Reurns the name of the image that the land's crop has.
    */
    func getCropSprite() -> String {
        switch type {
        case .Corn : return "R-corn.png"
        case .Soy : return "R-soybean.png"
        case .Grass : return "R-switchgrass.png"
        case .Empty : return ""
        }
    }
    
    func getLandSprite(farmNum : Int) -> String{
        switch type{
        case .Corn: return String(format:"R-map%d_corn", farmNum)
        case .Soy: return String(format:"R-map%d_bean", farmNum)
        case .Grass: return String(format:"R-map%d_grass", farmNum)
        default : return String(format:"R-map%d", farmNum)
        }
    }
    
    /*
        Returns whether the land is insured or not.
    */
    func isInsured() -> Bool {
        return insured
    }
    
    func hasCornorBeans() -> Bool{
        return type == .Corn || type == .Soy
    }
    
    /*
        Sets the lands crop to the specified type.
    */
    func setCrop (newCrop : CropType) {
        type = newCrop
    }
    
    /*
        Set whether the land is insured or not. 
    */
    func setInsured (newInsured : Bool) {
        insured = newInsured
    }
}