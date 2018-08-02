//
//  ViewController.swift
//  GiaiPhuongTrinhBac2
//
//  Created by Nguyễn Việt on 8/1/18.
//  Copyright © 2018 Nguyễn Việt. All rights reserved.
//

import UIKit
import ISEmojiView

class ViewController: UIViewController, ISEmojiViewDelegate {
    func emojiViewDidPressDoneButton(emojiView: ISEmojiView) {
        
    }
    

    
    @IBAction func mTouched(_ sender: UIButton) {
    }
     @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var mX2Lb: UILabel!
    @IBOutlet weak var mX1Lb: UILabel!
    @IBOutlet weak var mThongBaoLb: UILabel!
    @IBOutlet weak var mKetQuaButton: UIButton!
    @IBOutlet weak var mNhapCText: UITextField!
    @IBOutlet weak var mNhapBText: UITextField!
    @IBOutlet weak var mNhapAText: UITextField!
    func emojiViewDidSelectEmoji(emojiView: ISEmojiView, emoji: String) {
        textView.insertText(emoji)
    }
    
    func emojiViewDidPressDeleteButton(emojiView: ISEmojiView) {
        textView.deleteBackward()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        let emojiView = ISEmojiView()
        emojiView.translatesAutoresizingMaskIntoConstraints = false
        emojiView.delegate = self
        textView.inputView = emojiView
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func displayOutput(thongbao: String) {
        mThongBaoLb.text = thongbao
    }
    @IBAction func btn1(sender: AnyObject){
        if (mNhapAText.text != "" && mNhapBText.text != "" && mNhapCText.text != ""){
        let a:Double = Double(mNhapAText.text!)!
        let b:Double = Double(mNhapBText.text!)!
        let c:Double = Double(mNhapCText.text!)!
        var x1:Double = 0
        var x2:Double = 0
            let delta:Double = (b*b) - (4*a*c)
        var thongbao:String = ""
            
            if (a == 0 ){
                if (b == 0){
                    if (c == 0){
                        thongbao = "phuong trinh da cho co vo so nghiem"
                        displayOutput(thongbao: thongbao)
                        mX1Lb.text = ""
                        mX2Lb.text = ""
                    }
                    else { thongbao = "phuong trinh da cho vo nghiem"
                    displayOutput(thongbao: thongbao)
                        mX1Lb.text = ""
                        mX2Lb.text = ""
                    }
                } else {
                thongbao = "phuong trinh da cho co 1 nghiem"
                x1 = Double(-c/b)
                    displayOutput(thongbao: thongbao)
                    mX1Lb.text = String(x1)
                    mX2Lb.text = ""
                }
            } else if (delta < 0){
                thongbao = "phuong trinh da cho vo nghiem"
                displayOutput(thongbao: thongbao)
                mX1Lb.text = ""
                mX2Lb.text = ""
            } else if (delta == 0){
                thongbao = "phuong trinh da cho co 1 nghiem chung"
                x1 = Double(-b/(2*a))
                displayOutput(thongbao: thongbao)
                mX1Lb.text = String(x1)
                mX2Lb.text = ""
            } else if (delta > 0){
                thongbao = "Phuong trinh da cho co 2 nghiem phan biet"
                x1 = Double(((-b)-(sqrt(Double(delta))))/(2*a))
                x2 = Double(((-b)+(sqrt(Double(delta))))/(2*a))
                displayOutput(thongbao: thongbao)
                mX1Lb.text = String(x1)
                mX2Lb.text = String(x2)
            }
       
        }
       
       // displayOutput(x1:x1 , x2:x2 , thongbao:thongbao)
    }
    
    
    @IBAction func onKetQuaButtonTouched(_ sender: UIButton) {
        
        var message = ""
        if mNhapAText.text == "" {
            message = "ban phai nhap so a"
        } else if mNhapBText.text == "" {
            message = "ban phai nhap so b"
        } else if mNhapAText.text == "" {
            message = "ban phai nhap so c"
        }
        if message != "" {
        let alert = UIAlertController(title: "Thong Bao", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: {( action ) in }))
            self.present(alert, animated: true, completion: nil)
        }}
    
}

