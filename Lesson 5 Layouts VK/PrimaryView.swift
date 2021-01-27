//
//  PrimaryView.swift
//  Lesson 5 Layouts VK
//
//  Created by Korlan Omarova on 26.01.2021.
//

import UIKit

class PrimaryView: UIView {

    lazy var leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setParamaters(imageName: String, title: String){
        self.titleLabel.text = title
        guard let image = UIImage(named: "apple") else { return }
        self.leftImageView.image = image
    }

    
    private func setupViews(){
        [leftImageView, titleLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        leftImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        leftImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        leftImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        leftImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18 ).isActive = true
    }
    
    private func setStyle(){
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = CGColor(red: 220/255, green: 220/255, blue: 222/255, alpha: 1)
    }
}
