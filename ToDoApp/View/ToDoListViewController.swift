//
//  ToDoListViewController.swift
//  ToDoApp
//
//  Created by Gökçe Kahraman on 19.09.2022.
//
import UIKit

class ToDoListViewController: UIViewController {

    @IBOutlet weak var toDoListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        todoUI()
    }
}
private extension ToDoListViewController {
    func todoUI(){
        toDoListTableView.delegate = self
        toDoListTableView.dataSource = self
    }
    
}
extension ToDoListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}
extension ToDoListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
