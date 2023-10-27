//
//  ViewController.swift
//  Assignment
//
//  Created by EMPULSE on 27/10/23.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var tableView: UITableView!
    let refreshControl = UIRefreshControl()
    var data: [Issue] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    override func viewWillAppear(_ animated: Bool) {
       getRequrst()
    }
    
    func setUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(tableViewCell, forCellReuseIdentifier: "idTableViewCell")
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    func getRequrst(){
        ApiManager.apiManager.getRequest { jsonArray in
            self.data = jsonArray
            DispatchQueue.main.async {
                self.tableView.refreshControl = self.refreshControl
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    @objc func refreshData(){
        ApiManager.apiManager.getRequest { jsonArray in
            self.data = jsonArray
            DispatchQueue.main.async {
                self.tableView.refreshControl = self.refreshControl
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "idTableViewCell") as! TableViewCell
        !data.isEmpty ? cell.setDataToView(data: data[index]) : print("no data found")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 191
    }
}

