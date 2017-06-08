//
//  CustomDocumentCell.swift
//  Pods
//
//  Created by Anurita Srivastava on 16/04/17.
//
//

import UIKit


class CustomDocumentCell : UITableViewCell{
    
    func attributeChange(_ sender:UILabel)-> NSAttributedString{
    let attribute : [String:Any] = [
        
        NSFontAttributeName : UIFont(name: "CircularStd-Book", size: 12 )!
        
    ]
        sender.textAlignment = .left
        sender.translatesAutoresizingMaskIntoConstraints = false
        
        return NSAttributedString(string: sender.text!, attributes: attribute)
        
    }
    
    var photo_icon : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
       view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        
        return view
    }()
    
   lazy var doc_name : UILabel = {
        let view = UILabel()
        view.text = "Document_Name"
        view.textColor = UIColor(rgb: 0x494949)
        view.attributedText = self.attributeChange(view)
    
        return view
    }()
    
    lazy var user_name : UILabel = {
        let view = UILabel()
        view.text = "Sender_Details"
        view.textColor = UIColor(rgb: 0xc6c6c6)
        view.attributedText = self.attributeChange(view)
        
        return view
    }()
    
    lazy var request : UILabel = {
        let view = UILabel()
        view.text = "Received request to sign"
        view.textColor =  UIColor(rgb: 0xc6c6c6)
       
       view.attributedText = self.attributeChange(view)
   
    
        return view
    }()
    
    var symbol : UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    lazy var date : UILabel = {
        let view = UILabel()
        view.text = "2 hours ago"
        view.textColor = UIColor(rgb: 0xb4b4b4)
        view.attributedText = self.attributeChange(view)
        
        return view
    }()
    
    var separator : UIView = {

        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
   view.backgroundColor = UIColor(rgb: 0xf5f5f5)
        
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
        addSubview(photo_icon)
        photo_icon.leftAnchor.constraint(equalTo: leftAnchor, constant: 17).isActive = true
        photo_icon.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        photo_icon.widthAnchor.constraint(equalToConstant: 52).isActive = true
        photo_icon.heightAnchor.constraint(equalToConstant: 52).isActive = true
        photo_icon.layer.cornerRadius = 52/2
        photo_icon.image = #imageLiteral(resourceName: "duh")
        
        addSubview(date)
        date.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        date.topAnchor.constraint(equalTo: topAnchor, constant: 18).isActive = true
        date.widthAnchor.constraint(equalToConstant: 63).isActive = true
        date.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        
        addSubview(doc_name)
        doc_name.leftAnchor.constraint(equalTo: leftAnchor, constant: 84).isActive = true
        doc_name.topAnchor.constraint(equalTo: topAnchor, constant: 18).isActive = true
        doc_name.rightAnchor.constraint(equalTo: date.leftAnchor, constant: 30).isActive = true
        doc_name.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        addSubview(user_name)
        user_name.leftAnchor.constraint(equalTo: leftAnchor, constant: 84).isActive = true
        user_name.topAnchor.constraint(equalTo: topAnchor, constant: 37).isActive = true
        user_name.rightAnchor.constraint(equalTo: date.leftAnchor, constant: 30).isActive = true
        user_name.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        addSubview(request)
        request.leftAnchor.constraint(equalTo: leftAnchor, constant: 99).isActive = true
        request.topAnchor.constraint(equalTo: topAnchor, constant: 56).isActive = true
        request.rightAnchor.constraint(equalTo: date.leftAnchor, constant: 30).isActive = true
        request.heightAnchor.constraint(equalToConstant: 15).isActive = true
       
        
        addSubview(symbol)
        symbol.leftAnchor.constraint(equalTo: leftAnchor, constant: 83.8).isActive = true
        symbol.topAnchor.constraint(equalTo: topAnchor, constant: 58.3).isActive = true
        symbol.heightAnchor.constraint(equalToConstant: 13).isActive = true
        symbol.widthAnchor.constraint(equalToConstant: 12).isActive = true
        symbol.image = #imageLiteral(resourceName: "arrow_right")
        
        addSubview(separator)
        separator.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separator.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
    }

}
