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
        search.sizeToFit()
        
        //SearchBar Search
        let textFieldInsideUISearchBar = search.value(forKey: "searchField") as? UITextField
        textFieldInsideUISearchBar?.textColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1)
        textFieldInsideUISearchBar?.font = UIFont(name: "CircularStd-Medium", size: 12 )
        
        //SearchBar Rectangle edges
        textFieldInsideUISearchBar?.borderStyle = .none
        textFieldInsideUISearchBar?.layer.cornerRadius = 0.1
        textFieldInsideUISearchBar?.layer.masksToBounds = true
        textFieldInsideUISearchBar?.backgroundColor = UIColor.white
        
        
        //SearchBar Placeholder
        let textFieldInsideUISearchBarLabel = textFieldInsideUISearchBar!.value(forKey: "placeholderLabel") as? UILabel
        textFieldInsideUISearchBarLabel?.textColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        textFieldInsideUISearchBarLabel?.font = UIFont(name: "CircularStd-Medium", size: 12 )
        
        search.layer.borderColor = UIColor(red: 178/255, green: 182/255, blue: 187/255, alpha: 1).cgColor
       // self.navigationItem.titleView = search
        
        return search
    }
    
}
