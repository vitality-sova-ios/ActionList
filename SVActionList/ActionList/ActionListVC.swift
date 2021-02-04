//
//  ActionListVC.swift
//  SVActionList
//
//  Created by Vitaliy on 04.02.2021.
//

import UIKit

class ActionListVC: UIViewController {
    
    private let mainView: ActionListView = {
        let view = ActionListView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.cornerRadius = 8
        view.isTopLeft = true
        view.isTopRight = true
        return view
    }()
    
    private let mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var topConstraint: NSLayoutConstraint?

    var items: [ActionListItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialContent()
        setupButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        show()
    }
    
    private func initialContent() {
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.alpha = 0
        
        //Add back button
        let backButton = UIButton()
        backButton.addTarget(self, action: #selector(backButtonAction(_:)), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backButton.topAnchor.constraint(equalTo: view.topAnchor),
            view.trailingAnchor.constraint(equalTo: backButton.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: backButton.bottomAnchor)
        ])
    
        //Add main view
        view.addSubview(mainView)
        
        topConstraint = mainView.topAnchor.constraint(equalTo: view.bottomAnchor)
        
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topConstraint!,
            view.trailingAnchor.constraint(equalTo: mainView.trailingAnchor)
        ])
        
        //Add main stackView
        mainView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 8),
            mainView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            mainView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor)
        ])
        
        let rectView = UIView()
        rectView.backgroundColor = UIColor.black.withAlphaComponent(0.12)
        rectView.layer.cornerRadius = 2
        rectView.translatesAutoresizingMaskIntoConstraints = false
        
        mainView.addSubview(rectView)
        
        NSLayoutConstraint.activate([
            rectView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            rectView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 4),
            rectView.heightAnchor.constraint(equalToConstant: 4),
            rectView.widthAnchor.constraint(equalToConstant: 64)
        ])
    }
    
    private func setupButtons() {
        
        for (index, item) in items.enumerated() {
            let button = ActionListButton()
            button.configure(item, index: index, action: buttonAction(_:))
            mainStackView.addArrangedSubview(button)
        }
    }
    
    private func buttonAction(_ index: Int) {
        guard items.count > index else { return }
        
        hide { [weak self] in
            self?.items[index].action?()
        }
    }
    
    private func show() {
        
        let height = mainView.systemLayoutSizeFitting(.init(width: UIScreen.main.bounds.width, height: 0), withHorizontalFittingPriority: .defaultHigh, verticalFittingPriority: .defaultLow).height

        topConstraint?.constant = -height
        
        UIView.animate(withDuration: 0.4) {
            self.view.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    private func hide(_ completion: (()->Void)?) {
        topConstraint?.constant = 0
        
        UIView.animate(withDuration: 0.4) {
            self.view.alpha = 0
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.dismiss(animated: false, completion: completion)
        }

    }
    
    @objc private func backButtonAction(_ sender: Any) {
        hide(nil)
    }
}

extension ActionListVC {
    
    @discardableResult
    class func show(in vc: UIViewController, items: [ActionListItem]) -> ActionListVC {
        
        let list = ActionListVC()
        list.modalPresentationStyle = .overFullScreen
        list.modalTransitionStyle = .crossDissolve
        list.items = items
        vc.present(list, animated: false, completion: nil)
        return list
    }
}
