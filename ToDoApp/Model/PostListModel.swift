//
//  PostListModel.swift
//  ToDoApp
//
//  Created by Gökçe Kahraman on 21.09.2022.
//

import Foundation

protocol PostListModelProtocol: AnyObject { //modelden gelen data view modele aktarılacak
    func didDataFetch()
}

class PostListModel{
    
    weak var delegate: PostListModelProtocol?
    
    func fetchData(){
//        TODO: /data çekme işlemi yapılacak
        delegate?.didDataFetch()
    }    
}
