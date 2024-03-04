//
//  TotalBillView.swift
//  TotalBill
//
//  Created by user on 02/02/24.
//

import UIKit

class TotalBillView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sumTextfield: UITextField = {
        let textF = UITextField()
        textF.placeholder = "Summa"
        textF.backgroundColor = #colorLiteral(red: 0.9561658502, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        textF.layer.cornerRadius = 10
        textF.textColor = .black
        textF.tintColor = .gray
        textF.textAlignment = .center
        textF.keyboardType = .numberPad
        textF.translatesAutoresizingMaskIntoConstraints = false
        return textF
    }()
    
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
        titleLabel.font = UIFont(name: "Avenir Next", size: frame.width / 26.7)
        sumTextfield.font = UIFont(name: "Avenir Next", size: frame.height / 2.6)

    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(sumTextfield)
    }
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            sumTextfield.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            sumTextfield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            sumTextfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            sumTextfield.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
        ])
    }
    
}
