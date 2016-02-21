//
//  ListViewController.swift
//  K-Cha
//
//  Created by Brian Uznanski on 2/20/16.
//  Copyright © 2016 Bruh International. All rights reserved.
//

import Foundation
import UIKit

struct Workout {
    var name: String
    var sets: Int
    var time: Int
    let resetTime = 30
}


class ListViewController: UITableViewController {
    var workouts: [Workout] = []
    @IBAction func decrement(countStepper:UIStepper){
        let indexPath = tableView.indexPathsForVisibleRows![0]
        workouts[indexPath.row].sets=Int(countStepper.value)
        if workouts[indexPath.row].sets == 0{
            workouts.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Right)
            if workouts.count == 0{
                self.navigationController?.popViewControllerAnimated(true)
            }
        }else{
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
        }
    }
    
    // Returns the number of items in the list. This method tells the table how many rows there are.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    // give me cell at (row, section)
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // depending on the cell that I want
        
        let isTimed = -1 != workouts[indexPath.row].time
        if (isTimed) {
            let cell = tableView.dequeueReusableCellWithIdentifier("TimerCell") as! TimerCell
            cell.countStepper.value=Double(workouts[indexPath.row].sets)
            cell.label.text = workouts[indexPath.row].name
            cell.countLabel.text = String(workouts[indexPath.row].sets) + " Sets Remaining"
            cell.timer.setTitle(":" + String(workouts[indexPath.row].time), forState: UIControlState.Normal)
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("WorkoutCell") as! WorkoutCell
            cell.countStepper.value=Double(workouts[indexPath.row].sets)
            cell.label.text = workouts[indexPath.row].name
            cell.countLabel.text = String(workouts[indexPath.row].sets) + " Sets Remaining"
            return cell
        }
    }
    

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return tableView.frame.size.height
    }

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            workouts.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
            if workouts.count == 0{
                self.navigationController?.popViewControllerAnimated(true)
            }
        }else{
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
        }
    }
    


    
    var timer = NSTimer()
    
//    @IBOutlet weak var label: UILabel!
    
    // start timer
    @IBAction func startTimerButtonTapped(sender: UIButton) {
        timer.invalidate() // just in case this button is tapped multiple times
        
        // start the timer
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timerAction", userInfo: nil, repeats: true)
    }
    
    // stop timer
    @IBAction func cancelTimerButtonTapped(sender: UIButton) {
        timer.invalidate()
    }
    
    // called every time interval from the timer
    func timerAction() {
        let indexPath = tableView.indexPathsForVisibleRows![0]
        workouts[indexPath.row].time = workouts[indexPath.row].time - 1
        if 0 == workouts[indexPath.row].time{
            let alertController = UIAlertController(title: "BRUH.", message:
                "Timer complete", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            workouts[indexPath.row].time = workouts[indexPath.row].resetTime
            timer.invalidate()

        }
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
    }
}
