//
//  DocumentIDViewController.swift
//  Aadhaar eSign
//
//  Created by Anurita Srivastava on 04/05/17.
//  Copyright © 2017 Aadhaar Tech. All rights reserved.
//

import UIKit
import PDFReader

class DocumentIDViewController: UIViewController {

    
    func attributeChange(_ sender:UILabel)-> NSAttributedString{
        let attribute : [String:Any] = [
            
            NSFontAttributeName : UIFont(name: "CircularStd-Medium", size: 12 )!
            
        ]
        sender.textAlignment = .left
        sender.translatesAutoresizingMaskIntoConstraints = false
        
        return NSAttributedString(string: sender.text!, attributes: attribute)
        
    }

    var myView : UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(rgb: 0x476AE8)
    
        return view
    }()
    
   lazy var back_label : UILabel = {
        let view = UILabel()
       view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Rental Agreement"
        view.attributedText = self.attributeChange(view)
        view.font = UIFont(name: "CircularStd-Bold",size: 20)!
        view.textColor = UIColor(rgb: 0xFFFFFF)
        
        
        return view
    }()
    
    var back_button : UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        view.backgroundColor = .red
        
        return view
    }()
    
    
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
        view.attributedText = self.attributeChange(view)
        view.font = UIFont(name: "CircularStd-Bold",size: 12 )!
        view.textColor = UIColor(rgb: 0xFFFFFF)
        
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // pdfReader()
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.backgroundColor = UIColor(rgb: 0x476AE8)
        
        setupView()
    }
    
    
    func setupView(){
        view.addSubview(myView)
        myView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        myView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        view.addSubview(back_label)
        back_label.topAnchor.constraint(equalTo: myView.topAnchor, constant: 30).isActive = true
        back_label.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 50).isActive = true
        back_label.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -100).isActive = true
        back_label.sizeToFit()
        
        view.addSubview(back_button)
        back_button.topAnchor.constraint(equalTo: myView.topAnchor, constant: 30).isActive = true
        back_button.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 10).isActive = true
        back_button.rightAnchor.constraint(equalTo: myView.leftAnchor, constant: -160).isActive = true
        back_button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(pic)
        pic.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        pic.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 20).isActive = true
        pic.widthAnchor.constraint(equalToConstant: 55).isActive = true
        pic.heightAnchor.constraint(equalToConstant: 55).isActive = true
        pic.layer.cornerRadius = 55/2
        pic.image = #imageLiteral(resourceName: "duh")
        
        view.addSubview(date)
        date.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        date.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 18).isActive = true
        date.widthAnchor.constraint(equalToConstant: 80).isActive = true
        date.sizeToFit()
        
        view.addSubview(doc_name)
        doc_name.leftAnchor.constraint(equalTo: pic.rightAnchor, constant: 15).isActive = true
        doc_name.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 18).isActive = true
        doc_name.rightAnchor.constraint(equalTo: date.leftAnchor, constant: 30).isActive = true
        doc_name.sizeToFit()
        
        view.addSubview(user_name)
        user_name.leftAnchor.constraint(equalTo: pic.rightAnchor, constant: 15).isActive = true
        user_name.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 38).isActive = true
        user_name.rightAnchor.constraint(equalTo: date.leftAnchor, constant: 30).isActive = true
        user_name.sizeToFit()
        
        view.addSubview(request)
        request.leftAnchor.constraint(equalTo: pic.rightAnchor, constant: 30).isActive = true
        request.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 58).isActive = true
        request.rightAnchor.constraint(equalTo: date.leftAnchor, constant: 30).isActive = true
        request.sizeToFit()
        
        view.addSubview(symbol)
        symbol.leftAnchor.constraint(equalTo: pic.rightAnchor, constant: 15).isActive = true
        symbol.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 60).isActive = true
        symbol.rightAnchor.constraint(equalTo: request.leftAnchor, constant: -5).isActive = true
        symbol.image = #imageLiteral(resourceName: "Arrow right")
    }
    
    func pdfReader(){
        
        let remotePDFDocumentURLPath = "http://devstreaming.apple.com/videos/wwdc/2016/201h1g4asm31ti2l9n1/201/201_internationalization_best_practices.pdf"
        let remotePDFDocumentURL = URL(string: remotePDFDocumentURLPath)!
        let document = PDFDocument(url: remotePDFDocumentURL)!
        
        let readerController = PDFViewController.createNew(with: document)
        navigationController?.pushViewController(readerController, animated: true)
        

    }

    func backButtonPressed(_ sender: UIButton){
        let controller = DocumentsViewController()
        self.navigationController?.popToViewController(controller, animated: true)
        
    }

   }
