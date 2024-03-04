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
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = .black
        button.isEnabled = false
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next", size: 45)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var counter = 2
    
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
        counterLabel.font = UIFont(name: "Avenir Next", size: frame.height / 2.6)
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(bacgroundGrayView)
        bacgroundGrayView.addSubview(minusButton)
        bacgroundGrayView.addSubview(plusButton)
        bacgroundGrayView.addSubview(counterLabel)
    }
    
    @objc func minusButtonTapped() {
        counter -= 1
        counterLabel.text = "\(counter)"
        
        if counter <= 2 {
            minusButton.isEnabled = false
        }
    }
    
    @objc func plusButtonTapped() {
        counter += 1
        counterLabel.text = "\(counter)"
        minusButton.isEnabled = true
    }
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
    
            bacgroundGrayView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            bacgroundGrayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            bacgroundGrayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            bacgroundGrayView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
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
