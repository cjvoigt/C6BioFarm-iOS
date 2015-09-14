//
//  Farm.swift
//  BioFarm
//
//  Created by Berns, Alex J on 12/11/14.
//
//

import Foundation
import AVFoundation

public class Farm {
    
    let farmLand : [Int:Land]
    var cash: Double
    
    /*
        Initalizes farm with the default farms saved in a dictionary, and 1 million dollars.
    */
    init(){
        farmLand = [1: Land(size: 175), 2: Land(size: 250), 3: Land(size: 180), 4: Land(size: 150), 5: Land(size: 60), 6: Land(size: 60), 7:Land(size: 65), 8:Land(size: 60)]
        cash = 1000000
       
    }
    
    /*
        Initializes farm with a premade dictionary and amount of money.
    */
    init(f : [Int:Land], c : Double){
        farmLand = f
        cash = c
    }
    
    /*
        Harvest all farms stored in the farmLand dictionary.
    */
    func harvestAll(modifier : Double) -> Double{
        var sum : Double = 0

        for (farm, land) in farmLand{
            sum += land.harvest(modifier)
        }
        
        //var profit = Double (sum) * modifier
        return sum
    }
    
    //Money Methods $$
    
    /*
        Adds the amount of money that is sent to the function to cash.
    */
    func addMoney(amount : Double){
        cash = cash + amount
    }
    
    /*
        Subtracts the amount of money that is sent to the fuction from cash.
    */
    func subMoney(amount : Double){
        cash = cash - amount
    }
    
    /*
        Retruns the amount of cash that is in the farm.
    */
    func getCash() -> Double {
        return cash
    }
    
    /*
        Resets a farm based on the number of the farm. Sets crop to empty and insured to false. Readds money spent
        to buy that farm to cash.
    */
    func resetFarm(farmNumber : Int){
        let amount: Double = farmLand[farmNumber]!.getPlotCost()
        farmLand[farmNumber]?.setCrop(.Empty)
        farmLand[farmNumber]!.setInsured(false)
        cash += amount
    }
    
    /*
        Returns a farm object with a deep copy of the farmLand dictionary and the amount of cash in farm. 
    */
    func copy() -> Farm{
        var temp_farm : Farm
        var temp_fland : [Int:Land] = [1: Land(size: 175), 2: Land(size: 250), 3: Land(size: 180), 4: Land(size: 150), 5: Land(size: 60), 6: Land(size: 60), 7:Land(size: 65), 8:Land(size: 60)]
        var i : Int = 1
        
        for(farm, land) in farmLand{
            let tempLand = land.copy()
            temp_fland[i] = tempLand
            i++
        }
        
        temp_farm = Farm(f: temp_fland, c: cash)
        return temp_farm
    }
}