//
//  DocumentsViewController.swift
//  Aadhaar eSign
//
//  Created by Anurita Srivastava on 15/04/17.
//  Copyright © 2017 Aadhaar Tech. All rights reserved.
//

import UIKit
import Floaty

class DocumentsViewController : UIViewController{
    

    let floaty : Floaty = {
        let view = Floaty()
    view.addItem(title: "Hello, World!")
   view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var tabMenu: DocMenuBar = {
        let view = DocMenuBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
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
    
    override func viewDidLoad() {
       
        self.navigationController?.navigationBar.barTintColor = UIColor(rgb: 0x476ae8)
         self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Rental Agreement", style: .plain, target: self, action: nil)
        // navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
     navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.titleView = SearchBar().addSearchBar()
        
        myTableView.register(CustomDocumentCell.self, forCellReuseIdentifier: "DocumentCell")
    self.view.endEditing(true)
       //self.automaticallyAdjustsScrollViewInsets = false
        
        setupView()
    }
    
    func setupView(){
        
        view.addSubview(myTableView)
        myTableView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor).isActive = true
        myTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        view.addSubview(floaty)
        floaty.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        floaty.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor, constant: -82).isActive = true
        floaty.widthAnchor.constraint(equalToConstant: 56).isActive = true
        floaty.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        floaty.buttonColor = UIColor(rgb: 0xe45e5e)
        floaty.plusColor = UIColor(rgb: 0xffffff)
        floaty.layer.shadowColor = UIColor.black.cgColor
        floaty.layer.shadowRadius = 5
        floaty.layer.shadowOpacity = 8
        floaty.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        view.addSubview(tabMenu)
        tabMenu.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tabMenu.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tabMenu.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        tabMenu.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        tabMenu.layer.shadowColor = UIColor.black.cgColor
        tabMenu.layer.shadowOpacity = 20
        tabMenu.layer.shadowRadius = 5
        
    }
    
   }

extension DocumentsViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DocumentCell") as! CustomDocumentCell
        cell.contentView.backgroundColor = UIColor(rgb: 0xffffff)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 91
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    let controller = DocumentIDViewController()
        self.navigationController!.pushViewController(controller, animated: false)
        

    }
}
