//
//  ViewController.swift
//  HackingWithSwiftDay32
//
//  Created by Muhammed Yılmaz on 12.11.2024.
//

import UIKit

class ViewController: UITableViewController {
    
    var items: [String] = ["IPHONE 16 PRO MAX", "M4 PRO 16", "M4 IMAC"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shopping List"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trash))
        
        let sendButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(send))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbarItems = [spacer, sendButton]
        navigationController?.isToolbarHidden = false
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    
    @objc func addTapped() {
        let ac = UIAlertController(title: "ADD ITEM", message: nil, preferredStyle: .alert)
            ac.addTextField()

            let addAction = UIAlertAction(title: "ADD", style: .default) { [weak ac] _ in
                let item = ac?.textFields!.first
                    self.items.append(item!.text!)
                    self.tableView.reloadData()
            }
            ac.addAction(addAction)
            present(ac, animated: true)
        
    }
    
    @objc func trash() {
        items.removeAll()
        tableView.reloadData()
    }
    
    @objc func send() {
        let list = items.joined(separator: "\n")
        let activityViewController = UIActivityViewController(activityItems: [list], applicationActivities: nil)
        present(activityViewController, animated: true)
    }


}

