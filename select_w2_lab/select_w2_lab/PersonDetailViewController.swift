//
//  PersonDetailViewController.swift
//  select_w2_lab
//
//  Created by Dang Quoc Huy on 6/28/16.
//  Copyright © 2016 Dang Quoc Huy. All rights reserved.
//

import UIKit
import Answers

class PersonDetailViewController: UIViewController {

    @IBOutlet weak var fullImageView: UIImageView!
    var person: Person?
    var start: NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fullImageView.setImageWithURL((person?.avatarImageURL)!)
    }

    override func viewWillAppear(animated: Bool) {
        start = NSDate()
    }
    
    override func viewWillDisappear(animated: Bool) {
        let end = NSDate()
        let runTime = end.timeIntervalSinceDate(start!)
        
        let name = person?.name ?? ""
        let id = person?.id ?? 0
        
        Answers.logContentViewWithName("Detail of \(name)",
                                       contentType: "Person Detail View",
                                       contentId: "\(id)",
                                       customAttributes: ["Duration": runTime])
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
