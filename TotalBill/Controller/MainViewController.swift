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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconimageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "money2")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter the invoice amount"
        label.font = UIFont(name: "Avenir Next Bold", size: 24)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
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
       // button.titleLabel?.font = UIFont(name: "Avenir Next", size: 24)
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let totalBillView = TotalBillView()
    let personsView = PersonsView()
    let tipsView = TipsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setConstrains()
        addTap()
    }
    
    func setUpViews() {
        view.backgroundColor = #colorLiteral(red: 0.9999999404, green: 1, blue: 1, alpha: 1)
        
        view.addSubview(titleLabel)
        titleLabel.font = UIFont(name: "Avenir Next", size: view.frame.height * 0.046)
        view.addSubview(iconimageView)
        view.addSubview(descriptionLabel)
        view.addSubview(totalBillView)
        view.addSubview(personsView)
        view.addSubview(tipsView)
        view.addSubview(calculateButton)
        calculateButton.titleLabel?.font = UIFont(name: "Futura", size: view.frame.height / 44 )
    }
    
    @objc func calculateButtonTapped() {
        guard let totalBill = totalBillView.sumTextfield.text,
              let totalBillInt = Int(totalBill) else { 
            descriptionLabel.text = "Enter total bill"
            descriptionLabel.textColor = .red
            return
        }
        
        let summ = totalBillInt + totalBillInt * tipsView.tipsCount / 100
        let persons = personsView.counter
        
        if persons < 2 {
            descriptionLabel.text = "Enter persons count"
            descriptionLabel.textColor = .red
        } else {
            let result = summ / persons
            descriptionLabel.text = "\(result) per persons"
            descriptionLabel.textColor = .black
        }
        
    }
    
    func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

extension MainViewController {
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            iconimageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            iconimageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconimageView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            iconimageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20),
            
            descriptionLabel.topAnchor.constraint(equalTo: iconimageView.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            totalBillView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            totalBillView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            totalBillView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            totalBillView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
            
            personsView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 5),
            personsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
            
            tipsView.topAnchor.constraint(equalTo: personsView.bottomAnchor, constant: 5),
            tipsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tipsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tipsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
            
            calculateButton.topAnchor.constraint(equalTo: tipsView.bottomAnchor, constant: 15),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            
        ])
    }
}
