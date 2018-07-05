//
//  MyCustomButtonwithBorder.swift
//  Calculator
//
//  Created by Mohamed Kelany on 3/11/18.
//  Copyright © 2018 Mohamed Kelany. All rights reserved.
//

import UIKit

class MyCustomButtonwithBorder : UIButton {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.init(red: 114/255, green: 130/255, blue: 192/255, alpha: 1).cgColor
        
    }
}
