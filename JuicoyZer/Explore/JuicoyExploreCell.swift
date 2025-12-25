//
//  JuicoyExploreCell.swift
//  JuicoyZer
//
//  Created by mumu on 2025/12/25.
//

import UIKit

class JuicoyExploreCell: UICollectionViewCell {
  
    private let JuicoyBackImageView = UIImageView()
    private let JuicoyPlayIcon = UIImageView(image: UIImage.init(named: "juicoyPause"))
    lazy var JuicoyCommentCountButton: UIButton = {
        let JUICYbutton = UIButton()
        
        JUICYbutton.setImage(UIImage(named: "JUICYchat"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        JUICYbutton.setTitle(" 0", for: .normal)
      
        return JUICYbutton
    }()
    
    
    private lazy var Juicoyview: UIView = {
        let Juicoyview = UIView()
        Juicoyview.backgroundColor =  UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
        Juicoyview.layer.cornerRadius = 20
        Juicoyview.layer.masksToBounds = true
        Juicoyview.translatesAutoresizingMaskIntoConstraints = false
      
        return Juicoyview
    }()
    
    lazy var JuicoyImgView: UIImageView = {
        let Juicoyimg = UIImageView.init()
        Juicoyimg.contentMode = .scaleAspectFill
        Juicoyimg.translatesAutoresizingMaskIntoConstraints = false
        Juicoyimg.layer.cornerRadius = 20
        Juicoyimg.layer.masksToBounds = true
        return Juicoyimg
    }()
    
    lazy var JuiaddButton: UIButton = {
        let Juicoyimg = UIButton.init()
        Juicoyimg.setImage(UIImage.init(named: "juicoyADD"), for: .normal)
        Juicoyimg.translatesAutoresizingMaskIntoConstraints = false
        return Juicoyimg
    }()
    
    
    private let JUICYnameTitle: UILabel = {
        let JUICYlabel = UILabel()
        
        JUICYlabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        JUICYlabel.textColor = .white
        JUICYlabel.translatesAutoresizingMaskIntoConstraints = false
        return JUICYlabel
    }()
    
    lazy var JuicoyVIPView: UIImageView = {
        let Juicoyimg = UIImageView.init(image: UIImage.init(named: "juicoyVIP"))
      
        Juicoyimg.translatesAutoresizingMaskIntoConstraints = false
       
        return Juicoyimg
    }()
    
 
    lazy var JuicoyviovakkButton: UIButton = {
        let Juicoyimg = UIButton.init()
        Juicoyimg.setImage(UIImage.init(named: "JUICYcalakk"), for: .normal)
        Juicoyimg.translatesAutoresizingMaskIntoConstraints = false
        return Juicoyimg
    }()
    
    lazy var JuicoysendmesageButton: UIButton = {
        let Juicoyimg = UIButton.init()
        Juicoyimg.setImage(UIImage.init(named: "JUICYcontact"), for: .normal)
        Juicoyimg.translatesAutoresizingMaskIntoConstraints = false
        return Juicoyimg
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 28
        clipsToBounds = true
        backgroundColor = .black
        JuicoyConfigureImage()
        
    }

    required init?(coder: NSCoder) { nil }

    private func JuicoyConfigureImage() {
        
        JuicoyBackImageView.contentMode = .scaleAspectFill
        contentView.addSubview(JuicoyBackImageView)
       
        contentView.addSubview(JuicoyCommentCountButton)
        
        let JuicoyhotIcon = UIImageView(image: UIImage.init(named: "juicoyHot"))
        JuicoyhotIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(JuicoyhotIcon)
        JuicoyPlayIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(JuicoyPlayIcon)
        
        contentView.addSubview(Juicoyview)
        
        Juicoyview.addSubview(JuicoyImgView)
        Juicoyview.addSubview(JuiaddButton)
        Juicoyview.addSubview(JUICYnameTitle)
        Juicoyview.addSubview(JuicoyviovakkButton)
        Juicoyview.addSubview(JuicoyVIPView)
        Juicoyview.addSubview(JuicoysendmesageButton)
        
        NSLayoutConstraint.activate([
            JuicoyBackImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            JuicoyBackImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            JuicoyBackImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            JuicoyBackImageView.topAnchor.constraint(equalTo: self.topAnchor),
            
          
            
            JuicoyPlayIcon.widthAnchor.constraint(equalToConstant: 45),
            JuicoyPlayIcon.heightAnchor.constraint(equalToConstant: 45),
            JuicoyPlayIcon.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 60),
            JuicoyPlayIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            
            JuicoyCommentCountButton.widthAnchor.constraint(equalToConstant: 51),
            JuicoyCommentCountButton.heightAnchor.constraint(equalToConstant: 18),
            JuicoyCommentCountButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15),
            JuicoyCommentCountButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            
            Juicoyview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            Juicoyview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            Juicoyview.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            Juicoyview.heightAnchor.constraint(equalToConstant: 73),
            
            JuicoyImgView.widthAnchor.constraint(equalToConstant: 40),
            JuicoyImgView.heightAnchor.constraint(equalToConstant: 40),
            JuicoyImgView.leadingAnchor.constraint(equalTo: self.Juicoyview.leadingAnchor,constant: 15),
            JuicoyImgView.centerYAnchor.constraint(equalTo: Juicoyview.centerYAnchor),
            
            JuiaddButton.widthAnchor.constraint(equalToConstant: 23),
            JuiaddButton.heightAnchor.constraint(equalToConstant: 14),
            JuiaddButton.centerXAnchor.constraint(equalTo: self.JuicoyImgView.centerXAnchor),
            JuiaddButton.centerYAnchor.constraint(equalTo: self.JuicoyImgView.bottomAnchor),
     
            
            JUICYnameTitle.widthAnchor.constraint(equalToConstant:63),
            JUICYnameTitle.leadingAnchor.constraint(equalTo: JuicoyImgView.leadingAnchor, constant: 7),
            JUICYnameTitle.topAnchor.constraint(equalTo: JuicoyImgView.topAnchor),
           
            JuicoyVIPView.widthAnchor.constraint(equalToConstant: 27),
            JuicoyVIPView.heightAnchor.constraint(equalToConstant: 14),
            JuicoyVIPView.leadingAnchor.constraint(equalTo: self.JUICYnameTitle.trailingAnchor,constant: 9),
            JuicoyVIPView.centerYAnchor.constraint(equalTo: self.JUICYnameTitle.centerYAnchor),
            
            JuicoysendmesageButton.widthAnchor.constraint(equalToConstant: 100),
            JuicoysendmesageButton.heightAnchor.constraint(equalToConstant: 38),
            JuicoysendmesageButton.centerYAnchor.constraint(equalTo: Juicoyview.centerYAnchor),
            JuicoysendmesageButton.trailingAnchor.constraint(equalTo: Juicoyview.trailingAnchor,constant: -15),
            
            JuicoyviovakkButton.widthAnchor.constraint(equalToConstant: 28),
            JuicoyviovakkButton.heightAnchor.constraint(equalToConstant: 28),
            JuicoyviovakkButton.centerYAnchor.constraint(equalTo: Juicoyview.centerYAnchor),
            JuicoyviovakkButton.trailingAnchor.constraint(equalTo: JuicoysendmesageButton.leadingAnchor,constant: -15),
            
            ])
    }
    
  

 
}
