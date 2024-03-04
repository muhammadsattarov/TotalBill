//
//  ViewController.swift
//  TotalBill
//
//  Created by user on 02/02/24.
//

import UIKit

class MainViewController: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconimageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "rich")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter the invoice amount and click \"Calculate\""
        label.font = UIFont(name: "Avenir Next Bold", size: 16)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 24)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let totalBillView = TotalBillView()
    let personsView = PersonsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        setConstrains()
    }
    
    func setUpViews() {
        view.backgroundColor = #colorLiteral(red: 0.9813271165, green: 0.9813271165, blue: 0.9813271165, alpha: 1)
        
        view.addSubview(titleLabel)
        view.addSubview(iconimageView)
        view.addSubview(descriptionLabel)
        view.addSubview(totalBillView)
        view.addSubview(personsView)
        view.addSubview(calculateButton)
    }
    
}

extension MainViewController {
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            iconimageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            iconimageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconimageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            iconimageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            descriptionLabel.topAnchor.constraint(equalTo: iconimageView.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            totalBillView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            totalBillView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            totalBillView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            totalBillView.heightAnchor.constraint(equalToConstant: 120),
            
            personsView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 10),
            personsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personsView.heightAnchor.constraint(equalToConstant: 120),
            
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
}
