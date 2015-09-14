//
//  OptionsViewController.swift
//  BioFarm
//
//  Created by Jay Staker on 1/22/15.
//
//

import Foundation
import UIKit
import AVFoundation

class OptionsViewController : UIViewController{
    
    var musicPlayer : AVAudioPlayer?
    var effectsPlayer : AVAudioPlayer?
    @IBOutlet var sld_Volume: UISlider!
    @IBOutlet var swt_Volume: UISwitch!
    @IBOutlet var swt_Effects: UISwitch!
    
    
    /*
        A defualt function to set up the view when its first loaded. Sets the volume switch and slider based on the
        volume of the sound and whether the music is playing. 
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        if let temp : AVAudioPlayer = musicPlayer{
            sld_Volume.value = temp.volume
            swt_Volume.on = temp.playing
        }
        
        if let temp1 : AVAudioPlayer = effectsPlayer{
            if(temp1.volume == 0){
                swt_Effects.on = false
            }
        }
    }
    
    /*
        A defualt function for dealing with memeory warnings.
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
        Changes the volume of the music player based on the state of the slider.
    */
    @IBAction func changeVolume(sender: UISlider) {
        if let temp : AVAudioPlayer = musicPlayer {
            temp.volume = sender.value
        }
        
    }
    
    /*
        Turns the volume on or off depending on the state of the switch.
    */
    @IBAction func volumeOnOff(sender: UISwitch) {
        if let temp : AVAudioPlayer = musicPlayer  {
            if !swt_Volume.on {
                temp.stop()
                temp.currentTime = 0
            }
            else{
                temp.play()
            }
        }
        
    }
    
    /*
        Turns the volume on or off depending on the state of the switch.
    */
    @IBAction func effectsOnOff(sender: UISwitch) {
        if(sender.on){
            effectsPlayer!.volume = 0.3
        }
        else{
            effectsPlayer!.volume = 0
        }
    }
    
    
}