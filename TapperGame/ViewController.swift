//
//  ViewController.swift
//  TapperGame
//
//  Created by Felipe Soares on 21/08/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //Properties
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn:UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    override func viewDidLoad() {
        howManyTapsTxt.delegate = self
    }
    
    @IBAction func onCoinTapped(sender: UIButton!){
        currentTaps = currentTaps + 1
        updateTapsLbl()
        if(currentTaps == maxTaps){
            restartGame()
        }
    }
    
    @IBAction func onPlayBtnPressed(sender: UIButton!){
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != ""{
            
            logoImg.hidden = true
            playBtn.hidden = true
            howManyTapsTxt.hidden = true
            
            tapBtn.hidden = false
            tapsLbl.hidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
            updateTapsLbl()
        }
    }
    
    func restartGame(){
        currentTaps = 0
        maxTaps = 0
        
        logoImg.hidden = false
        playBtn.hidden = false
        howManyTapsTxt.hidden = false
        
        tapBtn.hidden = true
        tapsLbl.hidden = true
        
    }
    
    func updateTapsLbl(){
        tapsLbl.text = "\(currentTaps)"
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

