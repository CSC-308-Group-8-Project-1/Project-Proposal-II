//
//  PlanViewController.swift
//  Project-Proposal-II
//
//  Created by Krouse, William E. on 4/7/26.
//

import UIKit

class PlanViewController: ViewController
{
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var uTextField: UITextView!
    
    var u: (String, String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = u?.0
        uTextField.text = u?.1
    }
    
    
    
}
