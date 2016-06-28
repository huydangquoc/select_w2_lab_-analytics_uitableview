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
    let limit = 2
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadMoreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        loadMoreButton.enabled = false
        // load data
        FancyClient.loadPerson(offset: offset, limit: limit) { (persons: [Person]?, error: NSError?) in
            guard persons != nil else {
                print(error)
                return
            }
            self.persons = persons
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
                self.loadMoreButton.enabled = true
            })
            self.offset += self.limit
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showPersonDetail" {
            let personDetailView = segue.destinationViewController as! PersonDetailViewController
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
            personDetailView.person = persons![indexPath.row]
        }
    }
    
    @IBAction func onLoadMore(sender: AnyObject) {
        loadMoreButton.enabled = false
        FancyClient.loadPerson(offset: offset, limit: limit) { (persons: [Person]?, error: NSError?) in
            guard persons != nil else {
                print(error)
                self.loadMoreButton.enabled = true
                return
            }
            
            if self.persons != nil {
                self.persons!.appendContentsOf(persons!)
            }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
                let numberOfRows = self.persons!.count
                if numberOfRows > 0 {
                    let indexPath = NSIndexPath(forRow: numberOfRows-1, inSection: 0)
                    self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
                }
                self.loadMoreButton.enabled = true
            })
            self.offset += self.limit
        }
    }
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