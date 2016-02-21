//
//  MenuViewController.swift
//  K-Cha
//
//  Created by Brian Uznanski on 2/20/16.
//  Copyright © 2016 Bruh International. All rights reserved.
//

import Foundation
import UIKit


struct WorkoutList{
    var name: String
    var workouts:[Workout]
}

let defaultTime : Int = 30


class MenuViewController: UITableViewController {
    var presets = ["Arms","Core","Legs"]
    
    var arms = ["Push ups", "Curls", " Chin-ups"]
    var legs = ["Squats", "other leg stuff"]
    var core = ["sit ups","V-ups"]
    
    var workoutLists: [WorkoutList]=[
        WorkoutList(name: "Arms 💪", workouts: [
            Workout(name:"Push ups", sets: 3, time: defaultTime),
            Workout(name:"Curls", sets: 3, time: defaultTime),
            Workout(name: "Bench Press", sets: 3, time: defaultTime),
            Workout(name: "Arm Lifts", sets: 3, time: defaultTime),
            Workout(name: "Bruh Lifts", sets: 3, time: defaultTime)
        ]),
        
        WorkoutList(name: "Legs 🏃", workouts:[
            Workout(name: "Leg Lift", sets: 3, time: defaultTime),
            Workout(name: "Squats", sets: 3, time: defaultTime),
            Workout(name: "Leg Bruh Lifts", sets: 3, time: defaultTime),
            Workout(name: "Walking up Stairs", sets: 3, time: defaultTime),
            Workout(name: "Walking to ECEB", sets: 3, time: defaultTime),
            Workout(name: "Walking to Siebel", sets: 3, time: defaultTime)
        ]),
        
        WorkoutList(name: "Core 👊", workouts:[
            Workout(name: "Sit ups", sets: 3, time: defaultTime),
            Workout(name: "Getting out of Bed", sets: 3, time: defaultTime),
            Workout(name: "Coding on a Couch", sets: 3, time: -1),
            Workout(name: "V-ups", sets: 3, time: defaultTime),
            Workout(name: "ROFL", sets: 3, time: defaultTime),
            Workout(name: "Climbing Everest", sets: 3, time: defaultTime)
        ])
        
        
        
    ]
    
    // Returns the number of items in the list. This method tells the table how many rows there are.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutLists.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let listViewController=segue.destinationViewController as! ListViewController
        let selectedRow=tableView.indexPathForSelectedRow!.row
        
        listViewController.workouts=workoutLists[selectedRow].workouts
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

    }
    
    

    
    // give me cell at (row, section)
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Takes recycled cells and reconfigures them with new data
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuViewCell", forIndexPath: indexPath)
        cell.textLabel?.text = workoutLists[indexPath.row].name
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return tableView.frame.size.height/3
    }

}
