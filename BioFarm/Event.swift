//
//  Event.swift
//  BioFarm
//
//  Created by Voigt, Camden J on 12/11/14.
//
//chooses random event and does animation

import Foundation

//add annimations

class Event{
    
    var rand: Int = 0
    var eventModifier : Double =  0.0
    var eventID : Int = 0
    var eventText : String = " "
    var eventSound : String = "applause"
    
    /*
        Returns the Modifer of the Event that has been chosen
    */
    func getModifier() ->(eventModifier: Double, eventText: String, eventSound: String){
        return (eventModifier, eventText, eventSound)
    }
    
    /*
        Returns the ID for the event that just occured
    */
    func getID() -> Int{
        return eventID
    }
    
    /*
        Returns a tuple with a randomly choosen event for the year with a modifier, text and sound. 
    */
    func doEvent() -> (eventModifier: Double, eventText: String, eventSound: String) {
        rand = Int(arc4random_uniform(1000)) + 1
        eventID = 0
        switch rand{
            case 0...600:
                eventModifier = 1.0
                eventText = "You had a good year!"
                eventSound = "applause"
            case 601...760:
                eventModifier = 0.6
                eventText = "There was a drought this year -40% yeild."
                eventSound = "Wind"
            case 761...868:
                eventModifier = 0.7
                eventText = "There was a lot of excess moisture this year. -30% yeild."
                eventSound = "Water"
            case 869...896:
                eventModifier = 0.0
                eventText = "There was a flood this year -100% yeild."
                eventSound = "Water"
                eventID = 1;
            case 897...944:
                eventModifier = 0.6
                eventText = "There was a flood this year -100% yeild."
                eventSound = "Wind"
            case 945...952:
                eventModifier = 0.6
                eventText = "There was insects and pest damage to your fields. -40% yeild."
                eventSound = "Bug"
            case 953...960:
                eventModifier = 0.6
                eventText = "There was a plant disease outbreak this year. -40% yeild."
                eventSound = "Wind"
            case 961...972:
                eventModifier = 0.7
                eventText = "There was wind damage to your crops. -30% yeild."
                eventSound = "Wind"
            case 973...975:
                eventModifier = 0.7
                eventText = "There was wind damage to your crops. -30% yeild."
                eventSound = "Wind"
            case 976...980:
                eventModifier = 0.8
                eventText = "Someone tore through your fields Dukes of Hazard style. -20% yeild."
                eventSound = "Car"
            case 981...985:
                eventModifier = 0.9
                eventText = "Aliens left crop circles in your fields. -10% yeild."
                eventSound = "UFO"
            case 986...990:
                eventModifier = 0.4
                eventText = "There was a freak snowstorm this year. -40% yeild."
                eventSound = "Wind"
            case 991...995:
                eventModifier = 0.0
                eventText = "Lightning started a fire in your fields. -100% yeild."
                eventSound = "Fire"
            case 996...1000:
                eventModifier = 0.0
                eventText = "Your combine lit on fire. -100% yeild."
                eventSound = "Fire"
            default:
                eventModifier = 1.0
                eventText = "You had a good year!"
                eventSound = "applause"
        }
        
    return (eventModifier, eventText, eventSound)
    }
}