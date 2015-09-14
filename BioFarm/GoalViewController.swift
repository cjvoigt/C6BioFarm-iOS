//
//  GoalViewController.swift
//  BioFarm
//
//  Created by Jay Staker on 7/1/15.
//
//

import UIKit

class GoalViewController: UIViewController {

    @IBOutlet var goalText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        goalText.text = "Remember that your farm needs to make a profit to survive, but you also want to make choices that support the environment"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
