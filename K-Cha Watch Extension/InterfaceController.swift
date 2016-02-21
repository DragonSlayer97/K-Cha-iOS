//
//  InterfaceController.swift
//  K-Cha Watch Extension
//
//  Created by Brian Uznanski on 2/20/16.
//  Copyright © 2016 Bruh International. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        //@IBOutlet weak var myLabel: WKInterfaceLabel!

        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
