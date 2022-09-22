//
//  PostsTableViewModel.swift
//  ToDoApp
//
//  Created by Gökçe Kahraman on 19.09.2022.
//
import UIKit
import Foundation

protocol PostListViewModelViewProtocol: AnyObject{
    
    func didCellItemFetch(_ items: [PostCellViewModel])
}

class PostListViewModel{
    
    private let model = PostListModel()
    
    //    view instance wth delegate
    weak var viewDelegate: PostListViewModelViewProtocol?
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad(){
        model.fetchData()
    }
    func didClickItem(at index: Int){
//        TODO:
    }
    
}

private extension PostListViewModel{
    
    @discardableResult
    func makeViewBasedModel() -> [PostCellViewModel]{
        return []
    }
}


//MARK: - PostListModelProtocol
extension PostListViewModel: PostListModelProtocol{
    
    func didDataFetch() {
//        TODO:
        viewDelegate?.didCellItemFetch(makeViewBasedModel())
        makeViewBasedModel()
    }
}
