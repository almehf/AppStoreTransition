//
//  ViewController.swift
//  AppStoreTransition
//
//  Created by Fahad Almehawas on 2/18/19.
//  Copyright © 2019 Fahad Almehawas. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    
    let transition = ModalTransition()
    
    let model : [CardViewModel] = [
    CardViewModel(backGroundImage: UIImage(named: "1")!, title: "test", subtitle: "sub", description: "desc"),
    CardViewModel(backGroundImage: UIImage(named: "2")!, title: "test", subtitle: "sub", description: "desc"),
    CardViewModel(backGroundImage: UIImage(named: "3")!, title: "test", subtitle: "sub", description: "desc"),
    CardViewModel(backGroundImage: UIImage(named: "4")!, title: "test", subtitle: "sub", description: "desc"),
    CardViewModel(backGroundImage: UIImage(named: "5")!, title: "test", subtitle: "sub", description: "desc"),
    CardViewModel(backGroundImage: UIImage(named: "6")!, title: "test", subtitle: "sub", description: "desc")]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(GenericCell<CardView>.self, forCellReuseIdentifier:  String(describing: GenericCell<CardView>.self))
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        setupDisplay()
    }
   
    private func setupDisplay() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints(NSLayoutConstraint.pinToView(view: tableView))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GenericCell<CardView>.self), for: indexPath) as! GenericCell<CardView>
        cell.content = nil
        let model = self.model[indexPath.row % self.model.count]
        cell.content = CardView(model:model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count  
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! GenericCell<CardView>
        guard let cardView = cell.content else { return  }
        
        
        let model = CardViewModel(initWithCopy: cardView.cardModel)
        let secondViewController = SecondViewController(cardViewModel: model)
        
        
        DispatchQueue.main.async {
            secondViewController.transitioningDelegate = self.transition
            secondViewController.modalPresentationStyle = .overFullScreen
            
            self.present(secondViewController, animated: true, completion: nil)
        }
 
    }
    
    func selectedCellCardView() -> CardView? {
        guard let indexPath = tableView.indexPathForSelectedRow else { return nil }
        
        let cell = tableView.cellForRow(at: indexPath) as! GenericCell<CardView>
        guard let cardView = cell.content else { return nil }
        
        return cardView
    }
}

extension ViewController : UIViewControllerTransitioningDelegate {
   
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.state = .present
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.state = .dismiss
        return transition
    }
    
    func getCardViewModel() -> CardViewModel? {
        guard let indexPath = tableView.indexPathForSelectedRow else { return nil }
        
        let cell = tableView.cellForRow(at: indexPath) as! GenericCell<CardView>
        guard let cardView = cell.content else { return nil }
        
        return cardView.cardModel
    }
}
