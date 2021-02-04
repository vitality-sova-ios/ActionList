//
//  ViewController.swift
//  SVActionList
//
//  Created by Vitaliy on 04.02.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func openActionListOne(_ sender: Any) {
        
        var items: [ActionListItem] = []

        items.append(ActionListItem.itemUncomplete { [weak self] in
            self?.showAlert("Uncomplete")
        })
        
        ActionListVC.show(in: self, items: items)
    }
    
    @IBAction private func openActionListFive(_ sender: Any) {
        
        var items: [ActionListItem] = []
        
        items.append(ActionListItem.itemEdit { [weak self] in
            self?.showAlert("Edit")
        })
        
        items.append(ActionListItem.itemUncomplete { [weak self] in
            self?.showAlert("Uncomplete")
        })
        
        items.append(ActionListItem.itemUnpaid { [weak self] in
            self?.showAlert("Unpaid")
        })
        
        items.append(ActionListItem.itemCopy { [weak self] in
            self?.showAlert("View Notes")
        })
        
        items.append(ActionListItem.itemDelete { [weak self] in
            self?.showAlert("Delete")
        })
        
        ActionListVC.show(in: self, items: items)
    }
    
    @IBAction private func openActionListSeven(_ sender: Any) {
        
        var items: [ActionListItem] = []
        
        items.append(ActionListItem.itemEdit { [weak self] in
            self?.showAlert("Edit")
        })
        
        items.append(ActionListItem.itemUncomplete { [weak self] in
            self?.showAlert("Uncomplete")
        })
        
        items.append(ActionListItem.itemUnpaid { [weak self] in
            self?.showAlert("Unpaid")
        })
        
        items.append(ActionListItem.itemCopy { [weak self] in
            self?.showAlert("View Notes")
        })
        
        items.append(ActionListItem.itemDelete { [weak self] in
            self?.showAlert("Delete")
        })
        
        items.append(ActionListItem(icon: #imageLiteral(resourceName: "cross"), title: "Custom 1", titleColor: .blue, action: { [weak self] in
            self?.showAlert("Custom 1")
        }))
        
        items.append(ActionListItem(icon: #imageLiteral(resourceName: "copy"), title: "На кнопке только однострочный тайтл (более длинный текст - truncate троеточием в конце)", titleColor: .darkGray, action: { [weak self] in
            self?.showAlert("Long text")
        }))
        
        ActionListVC.show(in: self, items: items)
    }
    
    private func showAlert(_ text: String) {
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        
        alert.addAction(.init(title: "OK", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}

