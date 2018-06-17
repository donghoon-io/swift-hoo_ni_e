//
//  ViewController.swift
//  Hoo_ni_e
//
//  Created by Donghoon Shin on 2018. 3. 7..
//  Copyright © 2018년 Donghoon Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var blurDone=false
    
    var realName:String! //나중에 쓸 이름
    
    
    @IBOutlet weak var actInd: UIActivityIndicatorView!
    
    @IBOutlet weak var inputName: UITextField!
    
    @IBOutlet weak var instruction: UILabel!
    
    @IBOutlet var whatsurname: UIView!
    
    @IBOutlet weak var blur: UIVisualEffectView!
    
    @IBOutlet weak var fLabel: UILabel!
    
    @IBOutlet weak var sLabel: UILabel!
    
    @IBOutlet weak var tLabel: UILabel!
    
    @IBAction func nameDone(_ sender: Any) {
        if (self.inputName.hasText) {
            self.realName=self.inputName.text
            self.fLabel.text="Hello, "+self.realName
            self.actInd.center=self.view.center
            self.actInd.color=UIColor.red
            UIView.animate(withDuration: 1){
                self.whatsurname.alpha=0
                self.actInd.transform=CGAffineTransform(scaleX: 1.5, y: 1.5)
                self.actInd.alpha=1
            }
            self.actInd.startAnimating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                UIView.animate(withDuration: 1){
                    self.actInd.alpha=0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.intro(label: self.fLabel)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                        self.intro(label: self.sLabel)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                            self.intro(label: self.tLabel)
                        }
                    }
                }
            }
        }
        else {
            self.instruction.text="Please input a valid name!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.fLabel.alpha=0
        self.sLabel.alpha=0
        self.tLabel.alpha=0
        
        UIView.animate(withDuration: 2) {
            self.blur.alpha=1
        }
        self.instruction.numberOfLines=0
        uiviewFI(uiv: whatsurname)
        self.actInd.alpha=0
    }
    
    func uiviewFI(uiv:UIView)->Void {
        self.view.addSubview(uiv)
        uiv.center=self.view.center
        uiv.alpha=0
        
        UIView.animate(withDuration: 2) {
            uiv.alpha=1
        }
    }
    func intro(label:UILabel) {
        self.view.addSubview(label)
        UIView.animate(withDuration: 2){
            label.alpha=1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            UIView.animate(withDuration:2){
                label.alpha=0
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

