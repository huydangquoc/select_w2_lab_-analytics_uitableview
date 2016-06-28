//
//  PersonDetailViewController.swift
//  select_w2_lab
//
//  Created by Dang Quoc Huy on 6/28/16.
//  Copyright © 2016 Dang Quoc Huy. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    @IBOutlet weak var fullImageView: UIImageView!
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fullImageView.setImageWithURL((person?.avatarImageURL)!)
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
