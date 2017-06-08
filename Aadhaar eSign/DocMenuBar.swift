//
//  DocMenuBar.swift
//  Aadhaar eSign
//
//  Created by Anurita Srivastava on 07/06/17.
//  Copyright © 2017 Aadhaar Tech. All rights reserved.
//

import UIKit

class DocMenuBar: UIView {
    
    
    var tabsName = ["ALL","SIGNED","UNSIGNED"]
   
    
    var leftConstant:NSLayoutConstraint! //left anchor for indicator
    
    lazy var cv:UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = UIColor(rgb: 0x476ae8)
        view.delegate = self;
        view.dataSource = self;
        return view;
    }()
    
    var indicator:UIView = {
        let view = UIView()
        view.backgroundColor = .white;
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        backgroundColor = UIColor(rgb: 0x476ae8)
        cv.register(DocMenuBarCell.self, forCellWithReuseIdentifier: "cell")
        cv.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .centeredHorizontally)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
        addSubview(cv)
        cv.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        cv.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        cv.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cv.heightAnchor.constraint(equalTo: heightAnchor).isActive = true

        addSubview(indicator)
        indicator.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        indicator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true;
        indicator.heightAnchor.constraint(equalToConstant: 4).isActive = true;
        indicator.widthAnchor.constraint(equalToConstant: 120).isActive = true;
        
        
    }
    
    func attributeChange(_ sender:String)-> NSAttributedString{
        let attribute : [String:Any] = [
            
            NSKernAttributeName : CGFloat(0.5),
            NSFontAttributeName : UIFont(name: "CircularStd-Medium", size: 14 )!
            
        ]
        return NSAttributedString(string: sender, attributes: attribute)
        
    }
}



extension DocMenuBar :UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DocMenuBarCell
        cell.tab.attributedText = self.attributeChange(tabsName[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/CGFloat(3), height: frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    /*func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        jobsVc?.scrollToTab(tab: indexPath.item)
    }*/
}
