//
//  ImageCollectionViewController.swift
//  ToDoApp
//
//  Created by Gökçe Kahraman on 19.09.2022.
//

import UIKit

class ImageCollectionViewController: UIViewController {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionUI()
    }
}
    
private extension ImageCollectionViewController {
        
        func collectionUI(){
            imageCollectionView.delegate = self
            imageCollectionView.dataSource = self
        }
    }
extension ImageCollectionViewController: UICollectionViewDelegate{
    
}
extension ImageCollectionViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

    

