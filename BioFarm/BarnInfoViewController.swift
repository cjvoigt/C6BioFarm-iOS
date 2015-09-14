//
//  BarnInfoViewController.swift
//  BioFarm
//
//  Created by Jay Staker on 7/20/15.
//
//

import UIKit

class BarnInfoViewController: UIViewController {
    
    //Internal variables
    @IBOutlet var lbl_Info: UILabel!
    @IBOutlet var lbl_Info2: UILabel!
    @IBOutlet var lbl_Info3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_Info.text = "The objective of this game is to have your farm make a profit and survive random weather events while making environmentally friendly choices."
        lbl_Info2.text = "You start 1 million dollars and have 3 crops that affect the environment differently. Corn and Soybeans are insurable meaning that if some bad weather event occurs you can still get back 75 percent of what the event wiped out but switchgrass is not. Switchgrass is a perenial crop so it will last 7 years on your farm before it goes away."
       lbl_Info3.text = "There are 6 green fields that you can plant on the map as well as 2 marginal fields that are by the river. If you want to plant just touch the field you want to plant on and you will be taken to the store. In the store you can select which crop you want to buy and C6 will tell you a little bit about the crop. Underneath C6 is information about the purchase you are making. After you are done making a selection, just touch buy. Once you are done planting and buying click harvest and your fields will be harvested and a random event will occur."

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
