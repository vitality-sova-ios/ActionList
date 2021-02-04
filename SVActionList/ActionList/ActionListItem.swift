//
//  ActionListItem.swift
//  SVActionList
//
//  Created by Vitaliy on 04.02.2021.
//

import UIKit

struct ActionListItem {
    
    let icon: UIImage
    let title: String
    let titleColor: UIColor
    var action: (()->Void)?
}

extension ActionListItem {
    
    static func itemEdit(_ action: @escaping (()->Void)) -> ActionListItem {
        return ActionListItem(icon: #imageLiteral(resourceName: "edit"),
                              title: "Edit",
                              titleColor: UIColor.black.withAlphaComponent(0.87),
                              action: action)
    }
    
    static func itemUncomplete(_ action: @escaping (()->Void)) -> ActionListItem {
        return ActionListItem(icon: #imageLiteral(resourceName: "cross"),
                              title: "Mark as Uncomplete",
                              titleColor: UIColor.black.withAlphaComponent(0.87),
                              action: action)
    }
    
    static func itemUnpaid(_ action: @escaping (()->Void)) -> ActionListItem {
        return ActionListItem(icon: #imageLiteral(resourceName: "wallet"),
                              title: "Mark as Unpaid",
                              titleColor: UIColor.black.withAlphaComponent(0.87),
                              action: action)
    }
    
    static func itemCopy(_ action: @escaping (()->Void)) -> ActionListItem {
        return ActionListItem(icon: #imageLiteral(resourceName: "copy"),
                              title: "Edit / View Notes",
                              titleColor: UIColor.black.withAlphaComponent(0.87),
                              action: action)
    }
    
    static func itemDelete(_ action: @escaping (()->Void)) -> ActionListItem {
        return ActionListItem(icon: #imageLiteral(resourceName: "copy"),
                              title: "Delete",
                              titleColor: UIColor(red: 1, green: 0.09, blue: 0.267, alpha: 1),
                              action: action)
    }
}
