//
//  MyShadowView.swift
//  Calculator
//
//  Created by Mohamed Kelany on 3/11/18.
//  Copyright © 2018 Mohamed Kelany. All rights reserved.
//

import UIKit

class MyShadowView : UIView {
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
       // createGradientLayer()
        createShadow()
    
        
    }

    
    /**/
    
    func createShadow(){
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize(width: -3, height: -3)
        self.layer.shadowOpacity = 0.45
    }
    
}
