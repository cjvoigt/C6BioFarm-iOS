//
//  GameOverViewController.swift
//  BioFarm
//
//  Created by Jay Staker on 7/13/15.
//
//

import UIKit

class GameOverViewController: UIViewController {

    
    
    @IBOutlet var lbl_gameInfo: UILabel!
// Passed Variables from Game Scene
    var yearsPassed: Int = 0
    var currentMoney: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_gameInfo.text = String("Your farm lasted \(yearsPassed) years and it has $\(currentMoney)")
    }
    
    override func viewWillAppear(animated: Bool) {
        //self.navigationController!.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.hidesBackButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToMainMenu(sender: AnyObject) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
