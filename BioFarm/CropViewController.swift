//
//  CropViewController.swift
//  BioFarm
//
//  Created by Jay Staker on 7/17/15.
//
//

import UIKit

class CropViewController: UIViewController {
    //internal variable
    var whichInfo : Int = 0
    
    
    
    @IBOutlet var lbl_CropInfo: UILabel!
    @IBOutlet var img_CropImage: UIImageView!
    @IBOutlet var img_CropImage2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        if(whichInfo == 1){
            lbl_CropInfo.text = "Corn is grown all around the world and is known widely for its uses. Corn is processed for food for both humans and animals along with being processed for industial products such as ethanol. Corn is very profitable, but also takes away a lot of nitrogen from the ground"
            img_CropImage.image = UIImage(named: "R-corn.png")
            img_CropImage2.image = UIImage(named: "R-corn.png")
            
        }
        else if(whichInfo == 2){
            lbl_CropInfo.text = "Soybeans are processed for oil, animal feed, and other industrial products. A small percentage is used for human consumption such as soymilk, soy, and flour."
            
            img_CropImage.image = UIImage(named: "R-soybean.png")
            img_CropImage2.image = UIImage(named: "R-soybean.png")
            
        }
        else if(whichInfo == 3){
            lbl_CropInfo.text = "Switchgrass is used as feedstock for animals and other bio-friendly uses such as the development of bio-mass, methods for energy production, and cover for soil. Switchgrass does not make as much money as corn does but it can put much needed nitrogen in the ground and help the environment."
            img_CropImage.image = UIImage(named: "R-switchgrass.png")
            img_CropImage2.image = UIImage(named: "R-switchgrass.png")
        }
        else if(whichInfo == 4){
            lbl_CropInfo.text = "Carbon is an abundant chemical element similar to hydrogen, oxygen, and other elements found on the periodic table. When combined with oxygen, it creates the atmospheric gas Carbon Dioxide (CO2) which is a key component of the Earth’s atmosphere. Carbon-based molecules are the basic building blocks of humans, animals, plants, trees and soils. Carbon is also one of the main componenets in the energy that we use."
            img_CropImage.image = UIImage(named: "Natural_Gas.png")
            img_CropImage2.image = UIImage(named: "Gasoline Pump Leaf.png")
        }
        else if(whichInfo == 5){
            lbl_CropInfo.text = "Insurance Specialists work with farmers and various agriculture based companies to provide them with information they need in order to make profitable decisions within an ethical and professional manner.\nPlant Engineers work to plan, design, modify, and maintain systems, and equipment within  various plant manufacturing facilities.\nResearch Scientists are scientific professionals who specialize in laboratory research in various areas of science. They outline, conduct experiments, collect data based on established knowledge and understanding."
        }
        else{
            lbl_CropInfo.text = "the crop number was not sent correctly"
        }
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
