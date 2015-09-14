//
//  ResultsTableViewController.swift
//  BioFarm
//
//  Created by Jay Staker on 2/19/15.
//
//

import Foundation

class ResultsTableViewController: UITableViewController{
    
    
    
    var year: Int = 0
    var profit: Float = 0.0
    var mod: Float = 0.0
    var modText: String = "Error"
    var totalMoney: Float = 0.0
    var redColor : UIColor = UIColor(red: 206/255, green: 17/255, blue: 38/255, alpha: 1.0)
    var greenColor: UIColor = UIColor(red: 7/255, green: 109/255, blue: 84/255, alpha: 1.0)
    //System Methods
    
    /*
        A defualt function to set up the view when it is first loaded.
    */
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    
    /*
        A defualt function to deal with memory warnings.
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Background Methods
    
    /*
        Reutrns the number of cells in the table view.
        Cell size was decreased because players were confused by the empty farms when the table popped up
    */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5;
    }
    
    /*
        creates a cell to be used for the table view.
        The color of the text changes depending whether there is a good event or bad event (green or red)
    
    */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
   
        switch indexPath.row{
            case 0:
                cell.textLabel!.text = String(format: "Year %d", year)
                cell.textLabel!.textColor = UIColor(red: 58/255, green: 117/255, blue: 196/255, alpha: 1.0)
                cell.backgroundColor = UIColor.lightGrayColor()
            case 1:
                cell.textLabel!.text = modText
                if(mod < 1.0){
                    cell.textLabel!.textColor = redColor
                }
                else{
                    cell.textLabel!.textColor = greenColor
                }
                cell.backgroundColor = UIColor.lightGrayColor()
            case 2:
                cell.textLabel!.text = String(format: "Yearly Modifier: %.1f", mod)
                cell.textLabel!.textColor = UIColor(red: 58/255, green: 117/255, blue: 196/255, alpha: 1.0)
                cell.backgroundColor = UIColor.lightGrayColor()
            case 3:
                cell.textLabel!.text = String(format: "Profit: $%.2f ", profit)
                if(profit <= 0){
                    cell.textLabel!.textColor = redColor
                }
                else{
                    cell.textLabel!.textColor = greenColor
                }
                cell.backgroundColor = UIColor.lightGrayColor()
            case 4:
                cell.textLabel!.text = String(format: "Total Money: $%.2f", totalMoney)
                cell.backgroundColor = UIColor.lightGrayColor()
            default:
                cell.textLabel!.text = "Error"
        }
        
        cell.accessoryType = UITableViewCellAccessoryType.None
        
        return cell
    }
    
}