//
//  JuicoyMovementCardView.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/25.
//

import UIKit

final class JuicoyMovementCardView: UIButton {

    private let JuicoyBackImageView = UIImageView()
    private let JuicoyPlayIcon = UIImageView(image: UIImage.init(named: "juicoyPause"))
    lazy var JuicoyMoreButton: UIButton = {
        let JUICYbutton = UIButton()
        
        JUICYbutton.setBackgroundImage(UIImage(named: "jocoymoieh"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
      
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
        Juicoyimg.layer.cornerRadius = 25
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
    
    
    private let JUICYsigniitle: UILabel = {
        let JUICYlabel = UILabel()
        
        JUICYlabel.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        JUICYlabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        JUICYlabel.translatesAutoresizingMaskIntoConstraints = false
        return JUICYlabel
    }()
    lazy var JuicoyWatchButton: UIButton = {
        let Juicoyimg = UIButton.init()
        Juicoyimg.isUserInteractionEnabled = true
        Juicoyimg.setImage(UIImage.init(named: "juicoyWatchnow"), for: .normal)
        Juicoyimg.translatesAutoresizingMaskIntoConstraints = false
        return Juicoyimg
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 28
        clipsToBounds = true
        backgroundColor = .black
        JuicoyConfigureImage()
//        JuicoyConfigureTap()
    }

    required init?(coder: NSCoder) { nil }

    private func JuicoyConfigureImage() {
        JuicoyBackImageView.translatesAutoresizingMaskIntoConstraints = false
       
        JuicoyBackImageView.contentMode = .scaleAspectFill
        addSubview(JuicoyBackImageView)
       
        addSubview(JuicoyMoreButton)
        
        let JuicoyhotIcon = UIImageView(image: UIImage.init(named: "juicoyHot"))
        JuicoyhotIcon.translatesAutoresizingMaskIntoConstraints = false
        addSubview(JuicoyhotIcon)
        JuicoyPlayIcon.translatesAutoresizingMaskIntoConstraints = false
        addSubview(JuicoyPlayIcon)
        
        addSubview(Juicoyview)
        
        Juicoyview.addSubview(JuicoyImgView)
        Juicoyview.addSubview(JuiaddButton)
        Juicoyview.addSubview(JUICYnameTitle)
        Juicoyview.addSubview(JUICYsigniitle)
        Juicoyview.addSubview(JuicoyVIPView)
        Juicoyview.addSubview(JuicoyWatchButton)
        
        NSLayoutConstraint.activate([
            JuicoyBackImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            JuicoyBackImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            JuicoyBackImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            JuicoyBackImageView.topAnchor.constraint(equalTo: self.topAnchor),
            
            JuicoyhotIcon.widthAnchor.constraint(equalToConstant: 64),
            JuicoyhotIcon.heightAnchor.constraint(equalToConstant: 30),
            JuicoyhotIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15),
            JuicoyhotIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            
            JuicoyPlayIcon.widthAnchor.constraint(equalToConstant: 64),
            JuicoyPlayIcon.heightAnchor.constraint(equalToConstant: 64),
            JuicoyPlayIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            JuicoyPlayIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            
            JuicoyMoreButton.widthAnchor.constraint(equalToConstant: 30),
            JuicoyMoreButton.heightAnchor.constraint(equalToConstant: 30),
            JuicoyMoreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15),
            JuicoyMoreButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            
            Juicoyview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            Juicoyview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            Juicoyview.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            Juicoyview.heightAnchor.constraint(equalToConstant: 78),
            
            JuicoyImgView.widthAnchor.constraint(equalToConstant: 50),
            JuicoyImgView.heightAnchor.constraint(equalToConstant: 50),
            JuicoyImgView.leadingAnchor.constraint(equalTo: self.Juicoyview.leadingAnchor,constant: 15),
            JuicoyImgView.centerYAnchor.constraint(equalTo: Juicoyview.centerYAnchor),
            
            JuiaddButton.widthAnchor.constraint(equalToConstant: 23),
            JuiaddButton.heightAnchor.constraint(equalToConstant: 14),
            JuiaddButton.centerYAnchor.constraint(equalTo: self.JuicoyImgView.bottomAnchor),
            JuiaddButton.centerXAnchor.constraint(equalTo: self.JuicoyImgView.centerXAnchor),
            
            JuicoyWatchButton.widthAnchor.constraint(equalToConstant: 100),
            JuicoyWatchButton.heightAnchor.constraint(equalToConstant: 38),
            JuicoyWatchButton.trailingAnchor.constraint(equalTo: self.Juicoyview.trailingAnchor,constant: -15),
            JuicoyWatchButton.centerYAnchor.constraint(equalTo: self.Juicoyview.centerYAnchor),
            
            JUICYnameTitle.widthAnchor.constraint(equalToConstant:63),
            JUICYnameTitle.leadingAnchor.constraint(equalTo: JuicoyImgView.trailingAnchor, constant: 10),
            JUICYnameTitle.topAnchor.constraint(equalTo: JuicoyImgView.topAnchor),
            
            JUICYsigniitle.leadingAnchor.constraint(equalTo: JUICYnameTitle.leadingAnchor),
            JUICYsigniitle.trailingAnchor.constraint(equalTo: self.JuicoyWatchButton.leadingAnchor,constant: -8),
            JUICYsigniitle.topAnchor.constraint(equalTo: self.JUICYnameTitle.bottomAnchor,constant: 6),
           
            JuicoyVIPView.widthAnchor.constraint(equalToConstant: 27),
            JuicoyVIPView.heightAnchor.constraint(equalToConstant: 14),
            JuicoyVIPView.leadingAnchor.constraint(equalTo: self.JUICYnameTitle.trailingAnchor,constant: 9),
            JuicoyVIPView.centerYAnchor.constraint(equalTo: self.JUICYnameTitle.centerYAnchor),
           
            
            ])
    }
    
  
    func JUICYmainfreverr(loie:JuicoyStorageModel)  {
        JuicoyImgView.image = UIImage(named: loie.JuicoyAvatarKey)
        JUICYnameTitle.text = loie.JuicoyHandle
        JuicoyBackImageView.image = UIImage(named: loie.JuicoyMediaCover)
        JuicoyVIPView.isHidden = !(loie.JuicoyPremiumStatus == "1")
        JUICYsigniitle.text = loie.JuicoyMotto
    }
}
