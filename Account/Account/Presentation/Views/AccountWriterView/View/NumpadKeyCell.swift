//
//  NumpadKeyCell.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/11/28.
//

import UIKit

class NumpadKeyCell: UICollectionViewCell {
    
    @IBOutlet weak var numpadKeyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with keyString: String) {
        numpadKeyLabel.text = keyString
    }

}
