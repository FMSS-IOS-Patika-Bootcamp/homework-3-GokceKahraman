
import UIKit
import Foundation

protocol PostListViewModelViewProtocol: AnyObject{
    
    func didCellItemFetch(_ items: [PostCellViewModel])
    func showEmptyView()
    func hideEmptyView()
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
        let selectedItem = model.posts[index]
//        TODO: Navigate
    }
    
}

private extension PostListViewModel{
    
    @discardableResult
    func makeViewBasedModel(_ posts: [Post]) -> [PostCellViewModel]{
        return posts.map{ .init(title: $0.title , desc: $0.body)}
    }
}


//MARK: - PostListModelProtocol
extension PostListViewModel: PostListModelProtocol{
    
    func didDataFetchProgressFinish(_ isSuccess: Bool) {
        if isSuccess {
            let posts = model.posts
            let cellModels = makeViewBasedModel(posts)
            viewDelegate?.didCellItemFetch(cellModels)
            viewDelegate?.hideEmptyView()
        } else {
            viewDelegate?.showEmptyView()
        }
    }
}
