//
//  SearchBar.swift
//  Aadhaar eSign
//
//  Created by Anurita Srivastava on 30/04/17.
//  Copyright © 2017 Aadhaar Tech. All rights reserved.
//

import UIKit

class SearchBar : UIViewController{
    
    func addSearchBar()-> UISearchBar{
        
        let search = UISearchBar(frame: CGRect(x: 0, y: 0,width: view.frame.width, height:40))
        search.placeholder = "Search for a document"
        search.setImage(#imageLiteral(resourceName: "search"), for: .search, state: .normal)
        let calendar =  #imageLiteral(resourceName: "calendar")
        let calendarButton = UIButton(type: .custom)
        calendarButton.frame = CGRect(x: 304, y: 5, width: 24, height: 24)
        calendarButton.setImage(#imageLiteral(resourceName: "calendar"), for: .normal)
        
        search.sizeToFit()
        
        //SearchBar Search
        let textFieldInsideUISearchBar = search.value(forKey: "searchField") as? UITextField
        textFieldInsideUISearchBar?.textColor = UIColor(rgb: 0x476ae8)
        textFieldInsideUISearchBar?.font = UIFont(name: "CircularStd-Medium", size: 12 )
        
        textFieldInsideUISearchBar?.addSubview(calendarButton)
        //SearchBar Rectangle edges
        textFieldInsideUISearchBar?.borderStyle = .none
        textFieldInsideUISearchBar?.layer.cornerRadius = 0.1
        textFieldInsideUISearchBar?.layer.masksToBounds = true
        textFieldInsideUISearchBar?.backgroundColor = UIColor.white
        textFieldInsideUISearchBar?.textAlignment = .left
        
        //SearchBar Placeholder
        let textFieldInsideUISearchBarLabel = textFieldInsideUISearchBar!.value(forKey: "placeholderLabel") as? UILabel
        textFieldInsideUISearchBarLabel?.textColor = UIColor(rgb: 0xdedede)
        textFieldInsideUISearchBarLabel?.font = UIFont(name: "CircularStd-Medium", size: 12 )
        
        
        search.layer.borderColor = UIColor(rgb: 0x3853b8).cgColor
        search.layer.borderWidth = 0.1
       // self.navigationItem.titleView = search
        
        return search
    }
    
}
