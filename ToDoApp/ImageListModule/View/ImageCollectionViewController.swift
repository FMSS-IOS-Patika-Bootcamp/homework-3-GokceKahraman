
import UIKit

class ImageCollectionViewController: UIViewController {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    private let viewModel = ImageListViewModel()
    private var itemsI: [ImageCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.delegate = self
        viewModel.didViewLoad()
        
    }
}
    
private extension ImageCollectionViewController {
        
        func setupUI(){
            imageCollectionView.delegate = self
            imageCollectionView.dataSource = self
            registerCollectionCell()
            
        }
    
    func registerCollectionCell(){
        imageCollectionView.register( .init(nibName: "ImageListCollectionViewCell" , bundle: nil ), forCellWithReuseIdentifier: "ImageListCollectionViewCell")
    }
    }

extension ImageCollectionViewController: ImageListViewModelViewProtocol {
    func showEmptyView() {
        
    }
    
    func hideEmptyView() {
        
    }
    
    
    func didCellImageItemFetch(_ itemsI: [ImageCellViewModel]) {
        self.itemsI = itemsI
        DispatchQueue.main.async {
            self.imageCollectionView.reloadData()
        }
    }
    
}

extension ImageCollectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        viewModel.didClickItem(at: indexPath.row) //??????????????????
        return CGSize(width: self.view.frame.size.width/4 - 40, height: self.view.frame.size.width/4 - 40)
    }
    
}
extension ImageCollectionViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  itemsI.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageListCollectionViewCell", for: <#IndexPath#>) as! ImageListCollectionViewCell
        cell.imageView.image = itemsI[indexPath.row].url
        return cell
    }
}

    

