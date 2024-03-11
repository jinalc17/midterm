//
//  Lab2ViewController.swift
//  Jinal_Chandibhamar_MT_8961760
//
//  Created by user239775 on 3/10/24.
//

import UIKit

class Lab2ViewController: UIViewController {

    
    @IBOutlet weak var labelValue: UILabel!
    
    var tempNumberHolder = 0
    var step2flag = false;
    
    
    
    @IBAction func buttonInc(_ sender: Any) {
        if(step2flag == false)
        {
            tempNumberHolder+=1
            labelValue.text = String(tempNumberHolder)
        }else if(step2flag == true)
        {
            tempNumberHolder+=2
            labelValue.text = String(tempNumberHolder)
        }
    }

    
    @IBAction func buttonDec(_ sender: Any) {
        if(step2flag == false)
        {
            tempNumberHolder-=1;
            labelValue.text = String(tempNumberHolder)
        }else if(step2flag == true)
        {
            tempNumberHolder-=2
            labelValue.text = String(tempNumberHolder)
        }
    }
    
    
    @IBAction func reset(_ sender: Any) {
        labelValue.text = String(0);
        tempNumberHolder = 0
        step2flag = false
    }
    
    @IBAction func step(_ sender: Any) {
        step2flag = true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelValue.layer.borderWidth = 1.0
        labelValue.layer.borderColor = UIColor.black.cgColor
        labelValue.layer.backgroundColor = UIColor.white.cgColor
        
    }
    

    

}
