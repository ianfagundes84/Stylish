//
//  ViewController.swift
//  Beta
//
//  Created by Ian Fagundes on 23/04/19.
//  Copyright © 2019 Ian Fagundes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let saloes = [("Salao Teste")]
    let imagens = [UIImage(named: "barber")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saloes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.label.text = self.saloes[indexPath .row]
        cell.photo.image = self.imagens[indexPath.row]
        
        return cell
    }
    
}

