//
//  ProfileViewController.swift
//  Aadhaar eSign
//
//  Created by Anurita Srivastava on 01/05/17.
//  Copyright © 2017 Aadhaar Tech. All rights reserved.
//

import UIKit
import  PDFReader

class ProfileViewController: UIViewController {

    let fieldArray = ["Name","Aadhar Number","E-Mail ID","",""]
    let valueArray = ["Aditya Kundu","1800 8600 9973","adikundu1907@gmail.com","Settings","About Us"]
    
    var myView : UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        
        return view
    }()
    
    var myLabel : UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Profile"
        view.font = UIFont(name: "CircularStd-Medium", size: 50)
        view.textColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
        
        return view
    }()
    
    var myIView : UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        
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
       navigationController?.setNavigationBarHidden(true, animated: false)
        
        myTableView.register(CustomProfileCell.self, forCellReuseIdentifier: "ProfileCell")
setupView()
           }
    
    func setupView(){
        view.addSubview(myTableView)
        
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
        
       // view.addSubview(myIView)
        myView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
        myView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        myView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(myLabel)
        myLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        myLabel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 10).isActive = true
        myLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        myLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        myLabel.sizeToFit()

    }

       }

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! CustomProfileCell
            cell.contentView.backgroundColor = UIColor(rgb: 0xFFFFFF)
        
        //cell.field.text = fieldArray[indexPath.row]
        //cell.value.text = valueArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 80
    }
}
