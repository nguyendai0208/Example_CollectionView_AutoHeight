//
//  TempCell.swift
//  Example
//
//  Created by Neo Nguyen on 7/29/17.
//  Copyright © 2017 Neo Nguyen. All rights reserved.
//

import UIKit

class TempCell: UICollectionViewCell {

    @IBOutlet weak fileprivate var lbName : UILabel!
    
    var showFull : Bool = false
    
    fileprivate let names = ["jashdgkjhasgdhas",
                             "alsdghkjasdjkasdbjabsjdhahsdkjasjdhgjkashdgkjhasdjghaksjdbvsbvkjabsjdvashdgjhasdghasdghahsdhEIFYIABVJBSJKVSHUIAGHIhgiuoiHWAIUhsihsidghuijsdhfg",
                             "kjvjjvhajdshjahdj"]
    
    func setName (_ name : String?) {
        self.lbName.text = name
        self.reloadView()
    }
    
    func reloadView() {
        if self.showFull {
            self.lbName.numberOfLines = 0
        }else{
            self.lbName.numberOfLines = 1
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
