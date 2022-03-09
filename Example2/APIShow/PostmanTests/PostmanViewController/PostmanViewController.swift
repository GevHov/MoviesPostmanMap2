//
//  PostmanViewController.swift
//  Example2
//
//  Created by Gevorg Hovhannisyan on 20.12.21.
//

import Foundation
import UIKit
import Alamofire
 
final class PostmanViewController: UIViewController {
    
    //MARK: - JSONParser
    let parser = Parser()
    var result = [AdsWithCategories]()
        
    //MARK: - @IBOutlet TableWelcome
    @IBOutlet private weak var tableWelcome: UITableView!
    
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parser.parse {
            
            data in
            self.result = data
            DispatchQueue.main.async {
                
                self.tableWelcome.reloadData()
            }
        }
        tableWelcome.dataSource = self
    }
}

extension PostmanViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = result[indexPath.row].ads.last?.name

        return cell
    }
}
