//
//  CustomProfileCell.swift
//  Aadhaar eSign
//
//  Created by Anurita Srivastava on 04/05/17.
//  Copyright © 2017 Aadhaar Tech. All rights reserved.
//

import UIKit

class CustomProfileCell: UITableViewCell{
   
    func attributeChange(_ sender:UILabel)-> NSAttributedString{
        let attribute : [String:Any] = [
            
            NSFontAttributeName : UIFont(name: "CircularStd-Medium", size: 12 )!
            
        ]
        sender.textAlignment = .left
        sender.translatesAutoresizingMaskIntoConstraints = false
        
        return NSAttributedString(string: sender.text!, attributes: attribute)
        
    }
    
    var pic : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    var field : UILabel = {
        let view = UILabel()
          view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1)
        view.font = UIFont(name: "CircularStd-Medium", size: 12 )!
        view.text = "ABout us"
        return view
    }()
    
    var value : UILabel = {
        let view = UILabel()
          view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        view.font = UIFont(name: "CircularStd-Medium", size: 12 )!
        view.text = "Settings"
        return view
    }()
    
    var separator : UIView = {
        
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        
        return view
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView(){
        addSubview(pic)
        pic.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        pic.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        pic.widthAnchor.constraint(equalToConstant: 20).isActive = true
        pic.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pic.image = #imageLiteral(resourceName: "duh")
        
        addSubview(field)
        field.leftAnchor.constraint(equalTo: pic.rightAnchor, constant: 15).isActive = true
        field.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        field.widthAnchor.constraint(equalToConstant: 100).isActive = true
        field.sizeToFit()
        
        addSubview(value)
        value.leftAnchor.constraint(equalTo: pic.rightAnchor, constant: 15).isActive = true
        value.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        value.widthAnchor.constraint(equalToConstant: 100).isActive = true
        value.sizeToFit()
        
        addSubview(separator)
        separator.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separator.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
    }
    
}
