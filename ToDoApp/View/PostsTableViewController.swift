//
//  ViewController.swift
//  ToDoApp
//
//  Created by Gökçe Kahraman on 19.09.2022.
//

import UIKit

class PostsTableViewController: UIViewController {

    @IBOutlet weak var postTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}
private extension PostsTableViewController{
//    lifecycle çok kod olmaması için,
    func setUI(){
        // post tableview data source set et.
        postTableview.delegate = self
        postTableview.dataSource = self
    }
}

extension PostsTableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        TODO
    }
}
extension PostsTableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
