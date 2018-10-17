//
//  Crayon.swift
//  Color
//
//  Created by Ariel M. McLaughlin on 10/3/18.
//  Copyright © 2018 Ariel M. McLaughlin. All rights reserved.
//

import UIKit

struct Crayon {
    let name: String
    let color: UIColor
    var isLiked: Bool
    
    init(name: String, color: UIColor, isLiked: Bool = false) {
        self.name = name
        self.color = color
        self.isLiked = isLiked
}
}
