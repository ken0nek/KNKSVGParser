//
//  KNKSVGSampleCell.swift
//  KNKSVGParser
//
//  Created by Ken Tominaga on 12/8/14.
//  Copyright (c) 2014 Ken Tominaga. All rights reserved.
//

import UIKit

class KNKSVGSampleCell: UITableViewCell {
    
    @IBOutlet weak var svgImageView: UIImageView!
    
    override func awakeFromNib() {
        self.svgImageView.contentMode = UIViewContentMode.ScaleAspectFit
    }
}
