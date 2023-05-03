//
//  ViewController.swift
//  CheckingFirst
//
//  Created by sang on 9/10/1444 AH.
//

import UIKit
import CoreBluetooth
import CoreBluetooth
import SwiftUI



class BluetoothViewModel: NSObject, ObservableObject {
    private var centralManager: CBCentralManager?
    private var peripherals: [CBPeripheral] = []
    @Published var peripheralNames: [String] = []
    
    override init() {
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: .main)
    }
}

extension BluetoothViewModel: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            self.centralManager?.scanForPeripherals(withServices: nil)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if !peripherals.contains(peripheral) {
            self.peripherals.append(peripheral)
            self.peripheralNames.append(peripheral.name ?? "unnamed device")
        }
    }
}

struct ContentView: View {
    @ObservedObject private var bluetoothViewModel = BluetoothViewModel()
    
    var body: some View {
        NavigationView {
            List(bluetoothViewModel.peripheralNames, id: \.self) { peripheral in
                Text(peripheral)
            }
            .navigationTitle("Peripherals")
        }
    }
}
class ViewController: UIViewController  {
   //bluetooth
    var centralManager: CBCentralManager!
    
    @IBOutlet weak var clickCheck: UIButton!
    
    @IBOutlet weak var edit1: UITextField!
    var flag:Int = 1
    @IBOutlet weak var TestView: UILabel!
    var click = true
    
    @IBOutlet weak var bluetoothON: UIButton!
     var bluetoothisOn = false
    var second:Int = 1
    
    @IBOutlet weak var forDatePicker: UIDatePicker!
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var clickonme: UISlider!
    //slider
    
    @IBOutlet weak var slider: UISlider!
    
    
    @IBOutlet weak var mystepper: UIStepper!
    
    @IBOutlet weak var plusstepper: UIStepper!
    
    
    @IBOutlet weak var myswitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        ContentView()
        
        
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
        //checking blueooth
      //  centralmanager = CBCentralManager(delegate: Self, queue: nil)
        ///button check
        // button check
        //edittext enable
        edit1.becomeFirstResponder()
       
        
        
        let button=UITapGestureRecognizer(target: self, action: #selector(clickforcheck(sender:)))
        clickCheck.isUserInteractionEnabled = true
        clickCheck.addGestureRecognizer(button)
        //for date picker
        dateFormatter.dateFormat = "MM/dd/yyyy"
        forDatePicker.datePickerMode = .date
        let datata=UITapGestureRecognizer(target: self, action: #selector(mydate(sender:)))
        forDatePicker.isUserInteractionEnabled = true
        forDatePicker.addGestureRecognizer(datata)
        //uislider
        slider.minimumValue =  0
        slider.maximumValue = 100
        //let dd = UISlider(frame: Ellipse, primaryAction: self)
        
       //stepper
       
        
       
    }
    
    @IBAction func switchvalue(_ sender: UISwitch) {
        if(myswitch.isOn)
        {
            TestView.text = "On"
        }
        else
        {
            TestView.text = "Off"        }
    }
    
    @IBAction func vall(_ sender: UISlider) {
        let roundedValue = round(sender.value)
        sender.value = roundedValue
        TestView.text = "Your Age is "+Int(sender.value).description    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
            let roundedValue = round(sender.value)
            sender.value = roundedValue
            TestView.text = "Your Age is "+Int(sender.value).description
        }
    @objc func myslider(sender : UISlider)
    {
        let roundedValue = round(sender.value)
                sender.value = roundedValue 
    }
    @objc func mydate(sender : UITapGestureRecognizer)
    {
        TestView.text = dateFormatter.string(from: forDatePicker.date)
        
    }
    @objc func clickforcheck(sender : UITapGestureRecognizer)
    {
        if(edit1.text?.isEmpty==true)
        {
            var message = " helo";
            TestView.text =  message
        }
        else{
            var get = edit1.text
            TestView.text = get
        
        }
    }
    
    @objc func myblueisopen(sender : UITapGestureRecognizer)
    {
        if(second==1)
        {
            var cmc: CBPeripheralManager!
            cmc = CBPeripheralManager.init()
            
            peripheralManagerDidUpdateState(peripheral: cmc)
            ///TestView.text = "Cllicked for bluetooth open"
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
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {

        var statusMessage = ""
        //TestView.text  = "clicked"

        switch peripheral.state {
        case .poweredOn:
            statusMessage = "Bluetooth Status: Turned On"
            TestView.text = statusMessage

        case .poweredOff:
            statusMessage = "Bluetooth Status: Turned Off"
            TestView.text = statusMessage

        case .resetting:
            statusMessage = "Bluetooth Status: Resetting"
            TestView.text = statusMessage

        case .unauthorized:
            statusMessage = "Bluetooth Status: Not Authorized"
            TestView.text = statusMessage

        case .unsupported:
            statusMessage = "Bluetooth Status: Not Supported"
            TestView.text = statusMessage

        case .unknown:
            statusMessage = "Bluetooth Status: Unknown"
            TestView.text = statusMessage
        }

        print(statusMessage)

        if peripheral.state == .poweredOff {
            //TODO: Update this property in an App Manager class
        }
    }

    
}


