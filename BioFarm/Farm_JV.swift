//
//  Farm_JV.swift
//  
//
//  Created by Juan Venegas III with reference to Alex Berns and Jackson Voigt on 6/25/15.
//
//

//the enums for the crops has Insured corn and insured soybeans as a crop to make calcuation easier

enum Crops{
    case Corn, Soybean, Switchgrass, InsuredCorn, InsuredSoybean, Empty
    
    //Methos originally by Alex and Jackson, but modified by Juan
    //return the name of the crop as a string
    func getCropName() -> String{
        if(self == .Corn || self == .InsuredCorn){
            return "Corn"
        }
        else if(self == .Soybean || self == .InsuredSoybean){
            return "Soybean"
        }
        else if(self == .Switchgrass){
            return "Switchgrass"
        }
        else{
            return "Empty"
        }
    }
    /*
    Method originally by Alex and Jackson but modified by Juan
    returns the name of the crop as a string
    */
    
    func getCropCost() -> Float{
        switch self{
        case .Corn:
            return 600.0
        case .InsuredCorn:
            return 800.0
        case .Soybean:
            return 450.0
        case .InsuredSoybean:
            return 600.0
        case .Switchgrass:
            return 200.0
        default:
            return 0.0
        
        }
    }
    /*
    Method originally by Alex and Jackson but modified by Juan
    gets the background image for the buttons
    */
    func getLandSprite(farmNum : Int) -> String{
        if(self == .Corn || self == .InsuredCorn){
            return String(format:"R-map%d_corn", farmNum + 1)
        }
        else if(self == .Soybean || self == .InsuredSoybean){
            return String(format:"R-map%d_bean", farmNum + 1)
        }
        else if(self == .Switchgrass){
            return String(format:"R-map%d_grass", farmNum + 1)
        }
        else{
            return String(format:"R-map%d", farmNum + 1)
        }
    }
    /*
    Method originally by Alex and Jackson but modified by Juan
    gets the image for the store/buy view
    */
    func getCropSprite() -> String {
        if(self == .Corn || self == .InsuredCorn){
            return "R-corn.png"
        }
        else if(self == .Soybean || self == .InsuredSoybean){
            return "R-soybean.png"
        }
        else if(self == .Switchgrass){
            return "R-switchgrass.png"
        }
        else{
            return ""
        }
    }
}
    
/*
enums of the events that can occur
note that good year no longer means good year but instead
means that no bad weather event occured
*/

enum Events{
    case Goodyear,
    Drought,
    Excessmoisture,
    Flooding,
    Latefrost,
    Haildamage,
    Pests,
    Plantdisease,
    Winddamage,
    Tornado,
    Crazyperson,
    Cropcircles,
    Freaksnowstorm,
    Lightning,
    Brokencombine
    
    /*
    Method originally by Alex and Jackson but modified by Juan
    gets the text for the result table view view
    */
    func getEventText() -> String{
        switch self{
        case .Goodyear:
            return "No bad weather events occured!"
        case .Drought:
            return "There was a drought this year -60% yield."
        case .Excessmoisture:
            return "There was excess moisture this year -70% yield."
        case .Flooding:
            return "There was a flood this year -100% yield by the river bank"
        case .Latefrost:
            return "There was a late frost this year -60% yield"
        case .Haildamage:
            return "There was hail damage this year -50% yield"
        case .Pests:
            return "There was a pest infestation this year -60% yield"
        case .Plantdisease:
            return "There was an infectious plant disease this year -40% yield"
        case .Winddamage:
            return "There was wind damage this year -70% yield"
        case .Tornado:
            return "There was a tornado this year -70% yield"
        case .Crazyperson:
            return "Someone tore through you farm Dukes of Hazrd style -80% yield"
        case .Cropcircles:
            return "Aliens left crop circles -90% yield"
        case .Freaksnowstorm:
            return "There was a freak snowstorm this year -40%"
        case .Lightning:
            return "Lightning struck your field and set it on fire -100% yield"
        case .Brokencombine:
            return "Your combine broke this year -100% yield"
        default:
            return ""
        }
    }
    /*
    Method originally by Alex and Jackson but modified by Juan
    gets the correct sound to play
    */
    func getEventSound() -> String?{
        switch self{
        case .Goodyear:
            return "applause"
        case .Drought:
            return "Wind"
        case .Excessmoisture:
            return "Water"
        case .Flooding:
            return "Water"
        case .Latefrost:
            return "Wind"
        case .Haildamage:
            return "Wind"
        case .Pests:
            return "Bug"
        case .Plantdisease:
            return "Wind"
        case .Winddamage:
            return "Wind"
        case .Tornado:
            return "Wind"
        case .Crazyperson:
            return "Car"
        case .Cropcircles:
            return "UFO"
        case .Freaksnowstorm:
            return "Wind"
        case .Lightning:
            return "Fire"
        case .Brokencombine:
            return "Fire"
        default:
            return "applause"
        }
    }
}

class FarmJV {
    //variables 
    //note: cannot decide whether to make private or public
    let fieldSizes:[Float] = [175.0, 250.0, 180.0, 150.0, 60.0, 60.0, 65.0, 60.0]
    var fields:[Crops]
    var previousYearFields: [Crops]
    var fieldYields:[Float]
    var hasBought:[Bool]
    var yearCount: Int
    let soybeanSellingPrice: Float = 11.0
    let cornSellingPrice: Float = 4.75
    let switchgrassSellingPrice: Float = 50.0
    var currentMoney: Float
    var currentCost: Float
    var event: Events?
    var totalRevenue: Float
    var floodingEvent: Bool
    var modifierNumber: Float
    
        //initializer for the farm
        init(){
            yearCount = 1
            modifierNumber = 1.0
            floodingEvent = false
            event = nil
            totalRevenue = 0.0
            currentCost = 0.0
            currentMoney = 1000000.0
            previousYearFields = [Crops.Empty,Crops.Empty,Crops.Empty,Crops.Empty,Crops.Empty,Crops.Empty,Crops.Empty,Crops.Empty]
            fields = [Crops.Empty,Crops.Empty,Crops.Empty,Crops.Empty,Crops.Empty,Crops.Empty,Crops.Empty,Crops.Empty]
            fieldYields = [0,0,0,0,0,0,0,0]
            hasBought = [false,false,false,false,false,false,false,false]
    }
    
    //function that tells whether or not you can still buy land on the farm buy calculating
    //the lowest cost to buy something this is udes to determin game over
    func cannotBuy() -> Bool{
        if(currentMoney < 12000){
            return true
        }
        return false
        
    }
    
    //function to reset certain statistics on the farm
    //and copies the current year plants to the previous year plants
    //switchgrass is special in that it lasts for 7 years and is then taken out
    //and it costs 200 a year to maintain
    func reset(){
        for(var i = 0; i < 8; i++){
            hasBought[i] = false
            previousYearFields[i] = fields[i]
            fieldYields[i] = 0.0
            currentCost = 0.0
            if((fields[i] == .Switchgrass) && (yearCount % 7 != 0)){
                fields[i] = .Switchgrass
                hasBought[i] = true
                currentMoney = currentMoney - (fieldSizes[i] * 200)
                currentCost = currentCost + (fieldSizes[i] * 200)
            }
            else if((fields[i] == .Switchgrass) && (yearCount % 7 == 0)){
                fields[i] = .Empty
            }
            else{
                fields[i] = .Empty
            }
        }
        
        event = nil
        totalRevenue = 0.0
        
    }
    /*
    function that returns the cost of the crop depending on the field it is in
*/
    func getCostOfPurchase(whichField: Int, whichCrop: Crops) -> Float{
        switch whichCrop{
        case .Corn:
            return fieldSizes[whichField] * 600.0
        case .InsuredCorn:
            return fieldSizes[whichField] * 800.0
        case .Soybean:
            return fieldSizes[whichField] * 450.0
        case .InsuredSoybean:
            return fieldSizes[whichField] * 600.0
        case .Switchgrass:
            return fieldSizes[whichField] * 200.0
        default:
            return 0.0
        }
    }
        /*
    function that determines whether the farm is empty used to make sure
    harvest does nothing if there is nothing on the farm also used to see if it is game over
*/
        func isFarmEmpty() -> Bool{
            for (var i = 0; i < fields.count; i++){
                if(fields[i] != Crops.Empty){
                    return false
                }
            }
            return true
        }
    /*
    return the profit earned for the year
*/
    func getProfit() -> Float{
        return totalRevenue - currentCost
    }
        /*
    plant function that puts a crop in a certain field
    also subtracts money based on the cost of the plant
    and puts that cost in the current cost for the retun profit function
*/
        func plant(#whichField: Int, whichCrop: Crops){
            if(hasBought[whichField]){
            }
            else{
                hasBought[whichField] = true
                fields[whichField] = whichCrop
                switch whichCrop{
                case .Corn:
                    currentMoney = currentMoney - (600.0 * Float(fieldSizes[whichField]))
                    currentCost = currentCost + 600.0 * Float(fieldSizes[whichField])
                case .InsuredCorn:
                    currentMoney = currentMoney - (800.0 * Float(fieldSizes[whichField]))
                    currentCost = currentCost + 800.0 * Float(fieldSizes[whichField])
                case .Soybean:
                    currentMoney = currentMoney - (450.0 * Float(fieldSizes[whichField]))
                    currentCost = currentCost + 450.0 * Float(fieldSizes[whichField])
                case .InsuredSoybean:
                    currentMoney = currentMoney - (600.0 * Float(fieldSizes[whichField]))
                    currentCost = currentCost + 600.0 * Float(fieldSizes[whichField])
                case .Switchgrass:
                    currentMoney = currentMoney - (200.0 * Float(fieldSizes[whichField]))
                    currentCost = currentCost + 200.0 * Float(fieldSizes[whichField])
                default:
                    println("Invalid Crop")
                }
            }
        }
        /*
    the harvest function simply adds the total revenue to the current farm money
    and increment the year count
    */
        func Harvest(){
            currentMoney = currentMoney + totalRevenue
            yearCount++
        }
    /*
    the event generator that determines the modifier number and the event enum
*/
        
        func eventGenerator(){
            var frequency = Int(arc4random_uniform(1000) + 1)
            switch frequency{
            case 0...600:
                modifierNumber = 1.0
                event = Events.Goodyear
            case 601...760:
                modifierNumber = 0.6
                event = Events.Drought
            case 761...868:
                modifierNumber = 0.7
                event = Events.Excessmoisture
            case 869...884:
                modifierNumber = 0.0
                event = Events.Flooding
                floodingEvent = true
            case 885...896:
                modifierNumber = 0.6
                event = Events.Latefrost
            case 897...944:
                modifierNumber = 0.5
                event = Events.Haildamage
            case 945...952:
                modifierNumber = 0.6
                event = Events.Pests
            case 953...960:
                modifierNumber = 0.4
                event = Events.Plantdisease;
            case 961...972:
                modifierNumber = 0.7
                event = Events.Winddamage;
            case 973...975:
                modifierNumber = 0.7
                event = Events.Tornado;
            case 976...980:
                modifierNumber = 0.8
                event = Events.Crazyperson;
            case 981...985:
                modifierNumber = 0.9
                event = Events.Cropcircles;
            case 986...990:
                modifierNumber = 0.4
                event = Events.Freaksnowstorm;
            case 991...995:
                modifierNumber = 0.0
                event = Events.Lightning;
            case 996...1000:
                modifierNumber = 0.0
                event = Events.Brokencombine;
            default:
                println("Something went wrong in eventGenerator")
            }
        }
        /*
    function that calculates the yield of the farm
    if there was a flood then the yield is calculated differently
    also negatively impacts teh yield if they did not rotate their crops
*/
        func calculateYield(){
            if(floodingEvent){
                floodingEvent = false;
                for var i = 6; i < 8; i++ {
                    if fields[i] == .Empty{
                        fieldYields[i] = 0;
                    }
                    else if (fields[i] == Crops.InsuredCorn){
                        fieldYields[i] = (160 * Float(fieldSizes[i])) * 0.75
                    }
                    else if (fields[i] == Crops.InsuredSoybean){
                        fieldYields[i] = (45 * Float(fieldSizes[i])) * 0.75
                    }
                    else{
                        fieldYields[i] == 0
                    }
                }
                for var i = 0; i < 6; i++ {
                    if(fields[i] == .Empty){
                        fieldYields[i] = 0
                    }
                    else if(fields[i] == .InsuredCorn){
                        fieldYields[i] = (160.0 * Float(fieldSizes[i])) * 0.75
                    }
                    else if(fields[i] == .Corn){
                        fieldYields[i] == (160.0 * (1.0 - 0.3) * Float(fieldSizes[i]))
                    }
                    else if (fields[i] == .InsuredSoybean){
                        fieldYields[i] = (45.0 * 0.75 * Float(fieldSizes[i]))
                    }
                    else if(fields[i] == .Soybean){
                        fieldYields[i] = (45.0 * (1.0 - 0.3) * Float(fieldSizes[i]))
                    }
                    else if(fields[i] == .Switchgrass){
                        fieldYields[i] = (6.0 * (1.0 - 0.3) * Float(fieldSizes[i]))
                    }
                }
                
            }
            else{
                for(var i = 0; i < 8; i++){
                    if(fields[i] == .Empty){
                        fieldYields[i] = 0
                    }
                    else if(fields[i] == Crops.InsuredCorn && modifierNumber == 1.0){
                        fieldYields[i] = (160.0 *  Float(fieldSizes[i]))
                    }
                    else if (fields[i] == Crops.InsuredCorn && modifierNumber != 1.0){
                        fieldYields[i] = (160.0 * 0.75) * Float(fieldSizes[i])
                    }
                    else if(fields[i] == Crops.InsuredSoybean && modifierNumber == 1.0){
                        fieldYields[i] = 45.0 * Float(fieldSizes[i])
                    }
                    else if(fields[i] == Crops.InsuredSoybean && modifierNumber != 1.0){
                        fieldYields[i] = (45.0 * 0.75) * Float(fieldSizes[i])
                    }
                    else if (fields[i] == Crops.Corn && modifierNumber != 1.0){
                        if(modifierNumber == 0.0){
                            modifierNumber = 1.0
                        }
                        fieldYields[i] = (160.0 * (1.0 - modifierNumber)) * Float(fieldSizes[i])
                    }
                    else if(fields[i] == Crops.Corn && modifierNumber == 1.0){
                        fieldYields[i] = (160.0 * Float(fieldSizes[i]))
                    }
                    else if(fields[i] == Crops.Soybean && modifierNumber != 1.0){
                        if(modifierNumber == 0.0){
                            modifierNumber = 1.0
                        }
                        fieldYields[i] = (45.0 * (1.0 - modifierNumber)) * Float(fieldSizes[i])
                    }
                    else if(fields[i] == .Soybean && modifierNumber == 1.0){
                        fieldYields[i] = (45.0 * Float(fieldSizes[i]))
                    }
                    else if ((fields[i] == .Switchgrass) && (modifierNumber != 1.0)){
                        if(modifierNumber == 0.0){
                            modifierNumber = 1.0
                        }
                        fieldYields[i] = (6.0 * (1.0 - modifierNumber)) * Float(fieldSizes[i])
                    }
                    else if ((fields[i] == .Switchgrass) && (modifierNumber == 1.0)){
                        fieldYields[i] = (6.0 * Float(fieldSizes[i]))
                    }
                }
                if(yearCount != 1){
                 for(var i = 0; i < 8; i++){
                if((fields[i] == .Corn && (previousYearFields[i] == .Corn || previousYearFields[i] == .InsuredCorn)) || (fields[i] == .Soybean && (previousYearFields[i] == .Soybean || previousYearFields[i] == .InsuredSoybean))){
                    fieldYields[i] = fieldYields[i] * (1 - 0.20)
                }
            }
        }
    }
}
        /*
    calculates the revenue using the yields from the above function
*/
        func calculateRevenue(){
            for var i = 0; i < 8; i++ {
                if (fields[i] == .Empty){
                    
                }
                else if (fields[i] == Crops.Corn || fields[i] == Crops.InsuredCorn){
                    totalRevenue = totalRevenue + (Float(fieldYields[i]) * Float(cornSellingPrice))
                }
                else if(fields[i] == Crops.Soybean || fields[i] == Crops.InsuredSoybean){
                    totalRevenue = totalRevenue + (Float(fieldYields[i]) * Float(soybeanSellingPrice))
                }
                else if(fields[i] == .Switchgrass){
                    totalRevenue =  totalRevenue + (Float(fieldYields[i]) * Float(switchgrassSellingPrice))
                }
            }
        }
    }
    
    
    
    


