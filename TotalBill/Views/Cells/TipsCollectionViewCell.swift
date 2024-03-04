//
//  TipsCollectionViewCell.swift
//  TotalBill
//
//  Created by user on 02/02/24.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {
    
    let procentLabel: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.textColor = .black
        label.textAlignment = .center
        //label.font = UIFont(name: "Avenir Next", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 2
                layer.borderColor = UIColor.green.cgColor
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        procentLabel.font = UIFont(name: "Avenir Next", size: frame.height / 3.4)
    }
    
    func setupView() {
        backgroundColor = #colorLiteral(red: 0.9561658502, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        layer.cornerRadius = 10
        addSubview(procentLabel)
    }
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            procentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            procentLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
