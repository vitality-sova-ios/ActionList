//
//  ActionListButton.swift
//  SVActionList
//
//  Created by Vitaliy on 04.02.2021.
//

import UIKit

class ActionListButton: UIView {

    private let mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 24
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let iconImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 24).isActive = true
        image.widthAnchor.constraint(equalToConstant: 24).isActive = true
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Medium", size: 17)
        return label
    }()
    
    private var action: ((Int)->Void)?
    private var index: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialContent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialContent()
    }
    
    private func initialContent() {
        
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: 16),
            bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 12)
        ])
        
        mainStackView.addArrangedSubview(iconImageView)
        mainStackView.addArrangedSubview(titleLabel)
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        addSubview(button)
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(_ item: ActionListItem, index: Int, action: @escaping ((Int)->Void)) {
        iconImageView.image = item.icon
        titleLabel.text = item.title
        titleLabel.textColor = item.titleColor
        
        self.index = index
        self.action = action
    }
    
    @objc private func didTapButton(_ sender: Any) {
        action?(index)
    }
}
