//
//  PersonsView.swift
//  TotalBill
//
//  Created by user on 02/02/24.
//

import Foundation



import UIKit

class PersonsView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Persons"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let bacgroundGrayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = #colorLiteral(red: 0.9561658502, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 80)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 60)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next", size: 45)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(bacgroundGrayView)
        bacgroundGrayView.addSubview(minusButton)
        bacgroundGrayView.addSubview(plusButton)
        bacgroundGrayView.addSubview(counterLabel)
    }
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
    
            bacgroundGrayView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            bacgroundGrayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            bacgroundGrayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            bacgroundGrayView.heightAnchor.constraint(equalToConstant: 100),
            
            minusButton.topAnchor.constraint(equalTo: bacgroundGrayView.topAnchor, constant: 0),
            minusButton.leadingAnchor.constraint(equalTo: bacgroundGrayView.leadingAnchor, constant: 0),
            minusButton.heightAnchor.constraint(equalTo: bacgroundGrayView.heightAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 80),
            
            plusButton.topAnchor.constraint(equalTo: bacgroundGrayView.topAnchor, constant: 0),
            plusButton.trailingAnchor.constraint(equalTo: bacgroundGrayView.trailingAnchor, constant: 0),
            plusButton.heightAnchor.constraint(equalTo: bacgroundGrayView.heightAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 80),
            
            counterLabel.centerYAnchor.constraint(equalTo: bacgroundGrayView.centerYAnchor),
            counterLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 10),
            counterLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -10),
            
            
        ])
    }
    
}
