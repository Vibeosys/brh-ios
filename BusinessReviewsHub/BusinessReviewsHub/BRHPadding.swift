//
//  padding.swift
//  BusinessReviewsHub
//
//  Created by Prakash Sabale on 28/12/16.
//  Copyright © 2016 BusinessReviewsHub. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class mytextField : UITextField
{
    @IBInspectable var paddingLeft: CGFloat = 5
    @IBInspectable var paddingRight : CGFloat = 5
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect.init(x: bounds.origin.x + paddingLeft, y: bounds.origin.y + paddingRight, width: bounds.size.width - paddingLeft-paddingRight, height: bounds.size.height)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect
    {
        return textRect(forBounds: bounds)
    }





}
