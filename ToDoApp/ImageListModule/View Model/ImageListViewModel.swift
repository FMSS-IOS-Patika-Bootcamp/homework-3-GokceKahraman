import UIKit
import Foundation


protocol ImageListViewModelViewProtocol: AnyObject {
    func didCellImageItemFetch(_ itemsI: [ImageCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}

class ImageListViewModel{
    
    private let model = ImageListModel()
    
    //    view instance wth delegate
    weak var delegate: ImageListViewModelViewProtocol?
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad(){
        model.fetchData()
    }
    
    func didClickItem(at index: Int){
        let selectedItem = model.images[index]
//        TODO: Navigate
    }
}
private extension ImageListViewModel{
    
    @discardableResult  //for yellow warning
    func makeViewBasedModel(_ images: [Image]) -> [ImageCellViewModel]{
        return images.map{ .init(url: $0.url)}
    }
}

extension ImageListViewModel: ImageListModelProtocol{
    
    func didDataFetchProcessFinish(_ isSuccess: Bool){
        if isSuccess {
            let images = model.images
            let cellModels = makeViewBasedModel(images)
            delegate?.didCellImageItemFetch(cellModels)
            delegate?.hideEmptyView()
        } else {
            delegate?.showEmptyView()
        }
        
        ()
    }
}
