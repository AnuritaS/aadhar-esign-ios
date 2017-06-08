//
//  DocMenuBarCell.swift
//  Aadhaar eSign
//
//  Created by Anurita Srivastava on 07/06/17.
//  Copyright © 2017 Aadhaar Tech. All rights reserved.
//

import UIKit

class DocMenuBarCell: UICollectionViewCell {
    
    
    var tab:UILabel = {
        
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.textColor = UIColor(rgb: 0x3853b8)
        return view
        
    }()
    
    
    override var isSelected: Bool{
        didSet{
            tab.textColor = isSelected ? UIColor.white : UIColor(rgb: 0x3853b8)
        }
    }
    override var isHighlighted: Bool {
        didSet {
            tab.textColor = isHighlighted ? UIColor.white : UIColor(rgb: 0x3853b8)
            
        }
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews(){
        
        addSubview(tab)
        tab.heightAnchor.constraint(equalToConstant: 18).isActive = true;
        tab.widthAnchor.constraint(equalToConstant: 120).isActive = true;
        tab.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true;
        tab.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true;
    }
}
