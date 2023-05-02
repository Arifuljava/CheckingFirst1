//
//  ViewController.swift
//  CheckingFirst
//
//  Created by sang on 9/10/1444 AH.
//

import UIKit

class ViewController: UIViewController {
   
    
    @IBOutlet weak var TestView: UILabel!
    var click = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TestView.text="My Bluetooth Testing"
        TestView.font = .italicSystemFont(ofSize: 12)
        // TestView.backgroundColor=UIColor.white
        TestView.textAlignment = .center
        TestView.textColor  = UIColor.white
        TestView.shadowColor = UIColor.blue
        TestView.isHighlighted = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTextTap(sender:)))
        TestView.isUserInteractionEnabled = true
        TestView.addGestureRecognizer(tap)
        
        
        
    }
    let flag = 1;
    @objc func didTextTap(sender : UITapGestureRecognizer)
    {
        if(flag==1)
        {
            TestView.textColor = UIColor.red
        }
        
    }


}

