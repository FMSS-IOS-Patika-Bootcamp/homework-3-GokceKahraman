//
//  ViewController.swift
//  ToDoApp
//
//  Created by Gökçe Kahraman on 19.09.2022.
//

import UIKit

class PostListViewController: UIViewController {

    @IBOutlet weak var postTableview: UITableView!
    // wtout dependence injection
    private let viewModel = PostListViewModel()
    private var items: [PostCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}
private extension PostListViewController{
//    lifecycle çok kod olmaması için,
    func setUI(){
        // post tableview data source set et.
        postTableview.delegate = self
        postTableview.dataSource = self
    }
    
    func registerCell(){
        tableView.register(.init(nibName: "PostListTableViewCell", bundle: ""), forCellReuseIdentifier: "PostListTableViewCell")
        
    }
}

extension PostListViewController: PostListViewModelViewProtocol{
    
    func didCellItemFetch(_ items: [PostCellViewModel]) {
        self.items = items
        tableView.reloadData()
    }
}

extension PostListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didClickItem(at: indexPath.row)
    }
}
extension PostListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
