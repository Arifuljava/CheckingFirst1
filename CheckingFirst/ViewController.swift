//
//  ViewController.swift
//  CheckingFirst
//
//  Created by sang on 9/10/1444 AH.
//

import UIKit

class ViewController: UIViewController {
   
    var flag:Int = 1
    @IBOutlet weak var TestView: UILabel!
    var click = true
    
    @IBOutlet weak var bluetoothON: UIButton!
     var bluetoothisOn = false
    var second:Int = 1
    
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
        
         //bluetooth checking
        let blueOn = UITapGestureRecognizer(target: self, action: #selector(myblueisopen(sender:)))
        bluetoothON.isUserInteractionEnabled = true
        bluetoothON.addGestureRecognizer(blueOn)
        
        
        
        
    }
    @objc func myblueisopen(sender : UITapGestureRecognizer)
    {
        if(second==1)
        {
            TestView.text = "Cllicked for bluetooth open"
            second = second+1
            
        }
        else
        {
            TestView.text = "Bluetooth ON"
            second = second-1
        
        }
        
    }
    @objc func didTextTap(sender : UITapGestureRecognizer)
    {
        if(flag==1)
        {
            TestView.textColor = UIColor.red
            flag = flag+1
            
        }
        else
        {
            TestView.textColor = UIColor.white
            flag=1
        }
        
        
    }


}

