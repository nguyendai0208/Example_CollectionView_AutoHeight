//
//  ViewController.swift
//  Example
//
//  Created by Neo Nguyen on 7/28/17.
//  Copyright © 2017 Neo Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colNames : UICollectionView!
    
    fileprivate let names = ["jashdgkjhasgdhas",
                             "alsdghkjasdjkasdbjabsjdhahsdkjasjdhgjkashdgkjhasdjghaksjdbvsbvkjabsjdvashdgjhasdghasdghahsdhEIFYIABVJBSJKVSHUIAGHIhgiuoiHWAIUhsihsidghuijsdhfg",
                             "kjvjjvhajdshjahdjkjvjjvhajdshjahdjkjvjjvhajdshjahdjkjvjjvhajdshjahdj"]
    fileprivate var nameShow = [String]()
    fileprivate var isShowFull = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        if let flowLayout = self.colNames.collectionViewLayout as? UICollectionViewFlowLayout{
//            flowLayout.estimatedItemSize = CGSize.init(width: 1, height: 1)
//        }
        self.generalData()
        self.colNames.register(UINib.init(nibName: "TempCell", bundle: nil), forCellWithReuseIdentifier: "TempCell")
    }
    
    fileprivate func generalData(){
        self.nameShow.removeAll()
        for _ in 0...100 {
            let random = arc4random_uniform(UInt32(self.names.count))
            let name = self.names[Int(random)]
            self.nameShow.append(name)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func heightAtIndex(_ index : IndexPath)->CGFloat{
//        let cell : TempCell = self.colNames.dequeueReusableCell(withReuseIdentifier: "TempCell", for: index) as! TempCell
        let cell = Bundle.main.loadNibNamed("TempCell", owner: self, options: nil)?.first as! TempCell
        cell.showFull = self.isShowFull
        cell.setName(self.nameShow[index.row])
        
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        
        let targetSize = CGSize.init(width: self.colNames.bounds.size.width, height: 0)
        
//        let height = cell.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
        let size = cell.contentView.systemLayoutSizeFitting(targetSize)
//        let size = cell.contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: UILayoutPriorityFittingSizeLevel, verticalFittingPriority: UILayoutPriorityRequired)
        let height = size.height
        
        print("height : \(height), index : \(index.row) , size : \(size)")
        return height
    }
    
    @IBAction fileprivate func click_show(_ sender : UIButton?){
        self.isShowFull = !self.isShowFull
        self.colNames.reloadData()
    }
}

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.nameShow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TempCell", for: indexPath) as! TempCell
        cell.showFull = self.isShowFull
        cell.setName(self.nameShow[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width
        let height = self.heightAtIndex(indexPath)
        let size = CGSize.init(width: width, height: height)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
