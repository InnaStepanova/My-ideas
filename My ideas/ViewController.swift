//
//  ViewController.swift
//  My ideas
//
//  Created by Инна Степанова on 03.05.2021.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
    }

    private func setupNavigationBar() {
        title = "Мои идеи"
        navigationController?.navigationBar.prefersLargeTitles = true
        
//        Внешний вид Navigation Bar
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white ]
            
        navBarAppearance.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
//        Add button
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addIdea))
        
        navigationController?.navigationBar.tintColor = .white
    }

    @objc private func addIdea(){
        print("NEW IDEA")
    }
    
}

