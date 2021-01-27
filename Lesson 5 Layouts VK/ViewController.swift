//
//  ViewController.swift
//  Lesson 5 Layouts VK
//
//  Created by Korlan Omarova on 26.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "vk_logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
 
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email или телефон"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor(red: 220/255, green: 220/255, blue: 222/255, alpha: 1)
        textField.layer.cornerRadius = 8
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.backgroundColor = UIColor(cgColor: CGColor(red: 239/255, green: 239/255, blue: 243/255, alpha: 1))
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.layer.maskedCorners = [ .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        textField.layer.borderColor = CGColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        textField.backgroundColor = UIColor(cgColor: CGColor(red: 239/255, green: 239/255, blue: 243/255, alpha: 1))
        textField.isSecureTextEntry = true
        
        let btnPassword = UIButton(frame: CGRect(x: 9.5, y: 9.5, width: 25, height: 25))
        let informationImage = UIImage(named: "information")
        btnPassword.setImage(informationImage, for: .normal)
        btnPassword.contentMode = .scaleAspectFit
        btnPassword.addTarget(self, action: #selector(passwordButtonPressed), for: .touchUpInside)
        let separatorView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        separatorView.addSubview(btnPassword)
        textField.rightViewMode = .always
        textField.rightView = separatorView

        return textField
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(cgColor: CGColor(red: 168/255, green: 194/255, blue: 229/205, alpha: 1))
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(enterButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var enterByAppleView: PrimaryView = {
        let view = PrimaryView()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(enterByAppleViewPressed))
        self.view.addGestureRecognizer(gesture)
        return view
    }()
    
    var separatorFirstView = UIView()
    var separatorSecondView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupViews()    
    }
    
    private func setupViews() {
        [closeButton, logoImageView, loginTextField, passwordTextField, enterButton, enterByAppleView, separatorFirstView, separatorSecondView].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    
        closeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        
        separatorFirstView.topAnchor.constraint(equalTo: closeButton.bottomAnchor).isActive = true
        separatorFirstView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.12).isActive = true
        
        logoImageView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: separatorFirstView.bottomAnchor).isActive = true
        
        separatorSecondView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor).isActive = true
        separatorSecondView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.001).isActive = true
        
        loginTextField.topAnchor.constraint(equalTo: separatorSecondView.bottomAnchor, constant: 90).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
                
        enterButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25).isActive = true
        enterButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25).isActive
         = true
       
        enterByAppleView.setParamaters(imageName: "apple", title: "Войти через Apple")
        enterByAppleView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        enterByAppleView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        enterByAppleView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        enterByAppleView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
    
    //Mark: - Actions -
    @objc func enterButtonPressed(sender: UIButton){
        print(#function)
//        print(sender)
    }
    
    @objc func passwordButtonPressed(sender: UIButton){
        print(#function)
//        print(sender)
    
    }
    @objc func enterByAppleViewPressed(sender: UITapGestureRecognizer){
        print(#function)
    }
    @objc func closeButtonPressed(sender: UIButton){
        print(#function)
    }
    
}

