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
        view.layer.masksToBounds = true
        
        return view
    }()
    
   lazy var doc_name : UILabel = {
        let view = UILabel()
        view.text = "Document_Name"
        view.textColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1)
        view.attributedText = self.attributeChange(view)
    
        return view
    }()
    
    lazy var user_name : UILabel = {
        let view = UILabel()
        view.text = "Sender_Details"
        view.textColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        view.attributedText = self.attributeChange(view)
        
        return view
    }()
    
    lazy var request : UILabel = {
        let view = UILabel()
        view.text = "Received request to sign"
        view.textColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
       
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
        view.text = "few hours ago"
        view.textColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1)
        view.attributedText = self.attributeChange(view)
        
        return view
    }()
    
    var separator : UIView = {

        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
   view.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
        
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
       pic.widthAnchor.constraint(equalToConstant: 55).isActive = true
        pic.heightAnchor.constraint(equalToConstant: 55).isActive = true
        pic.layer.cornerRadius = 55/2
        pic.image = #imageLiteral(resourceName: "duh")
        
        addSubview(date)
        date.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        date.topAnchor.constraint(equalTo: topAnchor, constant: 18).isActive = true
        date.widthAnchor.constraint(equalToConstant: 80).isActive = true
        date.sizeToFit()
        
        addSubview(doc_name)
        doc_name.leftAnchor.constraint(equalTo: pic.rightAnchor, constant: 15).isActive = true
        doc_name.topAnchor.constraint(equalTo: topAnchor, constant: 18).isActive = true
        doc_name.rightAnchor.constraint(equalTo: date.leftAnchor, constant: 30).isActive = true
       doc_name.sizeToFit()
        
        addSubview(user_name)
        user_name.leftAnchor.constraint(equalTo: pic.rightAnchor, constant: 15).isActive = true
        user_name.topAnchor.constraint(equalTo: topAnchor, constant: 38).isActive = true
        user_name.rightAnchor.constraint(equalTo: date.leftAnchor, constant: 30).isActive = true
        user_name.sizeToFit()
        
        addSubview(request)
        request.leftAnchor.constraint(equalTo: pic.rightAnchor, constant: 30).isActive = true
        request.topAnchor.constraint(equalTo: topAnchor, constant: 58).isActive = true
        request.rightAnchor.constraint(equalTo: date.leftAnchor, constant: 30).isActive = true
        request.sizeToFit()
        
        addSubview(symbol)
        symbol.leftAnchor.constraint(equalTo: pic.rightAnchor, constant: 15).isActive = true
        symbol.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        symbol.rightAnchor.constraint(equalTo: request.leftAnchor, constant: -5).isActive = true
        symbol.image = #imageLiteral(resourceName: "Arrow right")
        
        addSubview(separator)
        separator.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separator.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
    }

}
