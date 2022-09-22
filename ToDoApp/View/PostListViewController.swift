//
//  ViewController.swift
//  ToDoApp
//
//  Created by Gökçe Kahraman on 19.09.2022.
//

import UIKit

class PostListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    // wtout dependence injection
    private let viewModel = PostListViewModel()
    private var items: [PostCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
    }
}
private extension PostListViewController{
//    lifecycle çok kod olmaması için,
    func setUI(){
        // post tableview data source set et.
        tableView.delegate = self
        tableView.dataSource = self
        
        registerCell()
    }
    
    func registerCell(){
        tableView.register(.init(nibName: "PostListTableViewCell", bundle: nil ), forCellReuseIdentifier: "PostListTableViewCell")

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostListTableViewCell") as! PostListTableViewCell
        
        cell.postTitleLabel.text = items[indexPath.row].title
        cell.postDescLabel.text = items[indexPath.row].desc
        return cell
        
        
    }
}
