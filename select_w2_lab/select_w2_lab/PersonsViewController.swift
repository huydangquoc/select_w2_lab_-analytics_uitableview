//
//  PersonsViewController.swift
//  select_w2_lab
//
//  Created by Dang Quoc Huy on 6/28/16.
//  Copyright © 2016 Dang Quoc Huy. All rights reserved.
//

import UIKit

class PersonsViewController: UIViewController {

    var persons: [Person]?
    var offset = 0
    var limit = 2
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        
        // load data
        FancyClient.loadPerson(offset: offset, limit: limit) { (persons: [Person]?, error: NSError?) in
            guard persons != nil else {
                print(error)
                return
            }
            self.persons = persons
            self.tableView.reloadData()
            self.offset += 1
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

extension PersonsViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return persons?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PersonCell") as! PersonCell
        cell.person = persons![indexPath.row]
        
        return cell
    }
}

extension PersonsViewController: UITableViewDelegate {
    
}