//
//  BullyReportView.swift
//  SchoolConnect
//
//  Created by William Brandin on 1/15/18.
//  Copyright © 2018 William S. Brandin. All rights reserved.
//

import UIKit

class BullyReportView: UIView {
    
    //MARK: - Properties
    
    lazy var nameLabel: UILabel! = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameTextField: UITextField! = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var studentNameTextField: UITextField! = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var phoneNumberTextField: UITextField! = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var emailTextField: UITextField! = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var reportTextView: UITextView! = {
        let textView = UITextView()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var mainStackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(studentNameTextField)
        stackView.addArrangedSubview(phoneNumberTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(reportTextView)
        stackView.spacing = 15.0
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: - View Life Cycle
    func customizeUI(){
        self.backgroundColor = UIColor.white
        setupMainStackViewConstraints()
    }
    
    //MARK: - Methods
    func setupMainStackViewConstraints(){
        addSubview(mainStackView)
        
        mainStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -15.0).isActive = true
        mainStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
    }
    
}

