//
//  InboxViewController.swift
//  Aadhaar eSign
//
//  Created by Anurita Srivastava on 30/04/17.
//  Copyright © 2017 Aadhaar Tech. All rights reserved.
//

import UIKit

class InboxViewController : UIViewController {
    
    var myView : UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        
        return view
    }()
    
    var myLabel : UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Inbox"
        view.font = UIFont(name: "CircularStd-Medium", size: 50)
        view.textColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
     
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
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.titleView = SearchBar().addSearchBar()
        
        myTableView.register(CustomInboxCell.self, forCellReuseIdentifier: "InboxCell")
        setupView()
        
    }

    func setupView(){
        
        view.addSubview(myView)
        myView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
        myView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        myView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(myTableView)
        myTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
        myTableView.topAnchor.constraint(equalTo: myView.bottomAnchor).isActive = true
        
        view.addSubview(myLabel)
        myLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        myLabel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 10).isActive = true
        myLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        myLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        myLabel.sizeToFit()
    }
    
    func anime(){
        myTableView.reloadData()
        let cells = myTableView.visibleCells
        var delay: Double = 0
        for i in cells{
            i.transform = CGAffineTransform(translationX: 0, y: myTableView.frame.height)
            
        }
        for i in cells{
            
            UIView.animate(withDuration: 1.75, delay: delay*0.05, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                i.transform = CGAffineTransform.identity;
                delay += 1}, completion: nil)
        }

 

 }
}

extension InboxViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "InboxCell") as! CustomInboxCell
        cell.contentView.backgroundColor = UIColor(rgb: 0xFFFFFF)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        anime()
    }
}
