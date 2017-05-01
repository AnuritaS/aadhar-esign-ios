//
//  DocumentsViewController.swift
//  Aadhaar eSign
//
//  Created by Anurita Srivastava on 15/04/17.
//  Copyright © 2017 Aadhaar Tech. All rights reserved.
//

import UIKit

class DocumentsViewController : UIViewController{
    
   lazy var myTableView : UITableView = {
      let view = UITableView()
        
    view.separatorStyle = .none
    view.separatorInset = UIEdgeInsetsMake(100, 0, 0, 100)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
view.bounces = false
    
        return view
    }()
    
    var addButton : UIButton = {
        
        let image = #imageLiteral(resourceName: "duh")
        let button   = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
       
      button.setImage(image, for: .normal)
        
    //button.addTarget(self, action: Selector("btnTouched:"), for:.touchUpInside)
        
        return button
    }()
   
    override func viewDidLoad() {
       
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
        
        self.navigationItem.titleView = SearchBar().addSearchBar()
        myTableView.register(CustomDocumentCell.self, forCellReuseIdentifier: "DocumentCell")
    self.view.endEditing(true)
        
        setupView()
    }
    
    func setupView(){
        
        view.addSubview(myTableView)
        myTableView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor).isActive = true
        myTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(addButton)
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        addButton.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -40).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        addButton.imageView?.layer.cornerRadius = 55/2
        
        addButton.layer.shadowColor = UIColor.black.cgColor
        addButton.layer.shadowRadius = 5
        addButton.layer.shadowOpacity = 0.5
        addButton.layer.shadowOffset = CGSize(width: 2, height: 2)
       
    }
    
   }

extension DocumentsViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DocumentCell")
        cell?.contentView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
}
