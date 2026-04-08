//
//  MemberView.swift
//  Project-Proposal-II
//
//  Created by Krouse, William E. on 4/7/26.
//

import UIKit

class MemberView: ViewController
{
    
    @IBOutlet weak var memberNameLabel: UILabel!
    
    @IBOutlet weak var MemberTextView: UITextView!
    
    @IBOutlet weak var memberImage: UIImageView!
    
    var member: (String, String, UIImage?)?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        memberNameLabel.text = member?.0
        MemberTextView.text = member?.1
        memberImage.image = member?.2
    }
}
