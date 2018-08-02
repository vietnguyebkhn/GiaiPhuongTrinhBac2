//
//  StackDemoViewController.swift
//  GiaiPhuongTrinhBac2
//
//  Created by Nguyễn Việt on 8/2/18.
//  Copyright © 2018 Nguyễn Việt. All rights reserved.
//


import UIKit
class StackDemoViewController: UIViewController{
    @IBAction func onComeBack(_ sender: UIButton) {
    }
    @IBOutlet weak var mLabel: UILabel!
    var  mIsHiden = false
    @IBAction func onButtonTouched(_ sender: UIButton) {
        
       mIsHiden = !mIsHiden
        mLabel.isHidden = mIsHiden
    }
}
