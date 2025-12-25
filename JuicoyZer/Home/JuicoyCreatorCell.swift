//
//  JuicoyCreatorCell.swift
//  JuicoyZer
//
//  Created by mumu on 2025/12/25.
//

import UIKit

final class JuicoyCreatorCell: UICollectionViewCell {

    private lazy var Juicoyview: UIView = {
        let Juicoyview = UIView()
        Juicoyview.backgroundColor =  UIColor(red: 0.31, green: 0.14, blue: 0.51, alpha: 1)
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
        Juicoyimg.layer.borderColor = UIColor.yellow.cgColor
        Juicoyimg.layer.borderWidth = 1
        Juicoyimg.layer.masksToBounds = true
        return Juicoyimg
    }()
    private let JUICYnameTitle: UILabel = {
        let JUICYlabel = UILabel()
        
        JUICYlabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        JUICYlabel.textColor = .white
        JUICYlabel.translatesAutoresizingMaskIntoConstraints = false
        return JUICYlabel
    }()
    
//    lazy var JuiaddButton: UIButton = {
//        let Juicoyimg = UIButton.init()
//        Juicoyimg.setImage(UIImage.init(named: "juicoyADD"), for: .normal)
//        Juicoyimg.translatesAutoresizingMaskIntoConstraints = false
//        return Juicoyimg
//    }()
    
    private lazy var JuicoyfollowView: UIImageView = {
        let Juicoyimg = UIImageView.init(image: UIImage.init(named: "juicoyFollow"))
        Juicoyimg.contentMode = .scaleAspectFill
        Juicoyimg.translatesAutoresizingMaskIntoConstraints = false
       
        return Juicoyimg
    }()
    private let JUICYfanscountTitle: UILabel = {
        let JUICYlabel = UILabel()
        JUICYlabel.text = "\(Int.random(in: 0...3)) followers"
        JUICYlabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        JUICYlabel.textColor = UIColor.init(white: 1, alpha: 0.45)
        JUICYlabel.translatesAutoresizingMaskIntoConstraints = false
        return JUICYlabel
    }()
    
    private let JUICYpostTitle: UILabel = {
        let JUICYlabel = UILabel()
        JUICYlabel.text = "\(Int.random(in: 0...1)) post"
        JUICYlabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        JUICYlabel.textColor = UIColor.init(white: 1, alpha: 0.45)
        JUICYlabel.translatesAutoresizingMaskIntoConstraints = false
        return JUICYlabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
      
        backgroundColor = .clear
        JuicoyConfigureAvatar()
    }

    required init?(coder: NSCoder) { nil }

    private func JuicoyConfigureAvatar() {
        contentView.addSubview(Juicoyview)
        contentView.addSubview(JuicoyImgView)
        contentView.addSubview(JuicoyfollowView)
        contentView.addSubview(JUICYnameTitle)
        
        contentView.addSubview(JUICYfanscountTitle)
        contentView.addSubview(JUICYpostTitle)
        
        NSLayoutConstraint.activate([
            Juicoyview.topAnchor.constraint(equalTo: contentView.topAnchor),
            Juicoyview.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            Juicoyview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            Juicoyview.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 20),
            
            JuicoyImgView.widthAnchor.constraint(equalToConstant: 50),
            JuicoyImgView.heightAnchor.constraint(equalToConstant: 50),
            JuicoyImgView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            JuicoyImgView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            
            JuicoyfollowView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            JuicoyfollowView.heightAnchor.constraint(equalToConstant: 26),
            JuicoyfollowView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            JuicoyfollowView.widthAnchor.constraint(equalToConstant: 60),
            
            JUICYnameTitle.trailingAnchor.constraint(equalTo: self.JuicoyfollowView.leadingAnchor, constant: -5),
            JUICYnameTitle.centerYAnchor.constraint(equalTo: self.JuicoyfollowView.centerYAnchor, constant: 0),
            JUICYnameTitle.leadingAnchor.constraint(equalTo: self.JuicoyImgView.trailingAnchor, constant: 5),
            
            JUICYfanscountTitle.widthAnchor.constraint(equalToConstant: 80),
            JUICYfanscountTitle.leadingAnchor.constraint(equalTo: JuicoyImgView.trailingAnchor,constant: 5),
            JUICYfanscountTitle.topAnchor.constraint(equalTo: JUICYnameTitle.bottomAnchor,constant: 26),
            
            JUICYpostTitle.widthAnchor.constraint(equalToConstant: 80),
            JUICYpostTitle.leadingAnchor.constraint(equalTo: JUICYfanscountTitle.trailingAnchor,constant: 5),
            JUICYpostTitle.topAnchor.constraint(equalTo: JUICYnameTitle.bottomAnchor,constant: 26),
           
        ])
       
    }
}
