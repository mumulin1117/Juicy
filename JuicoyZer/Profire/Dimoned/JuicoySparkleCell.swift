//
//  JuicoySparkleCell.swift
//  JuicoyZer
//
//  Created by mumu on 2025/12/26.
//

import UIKit

class JuicoySparkleCell: UICollectionViewCell {
    
    private let JuicoyContainer: UIView = {
        let JuicoyView = UIView()
        JuicoyView.backgroundColor = UIColor(red: 0.17, green: 0.17, blue: 0.17, alpha: 1)
        JuicoyView.layer.cornerRadius = 12
        JuicoyView.layer.borderWidth = 2
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()
    
    private let JuicoyTagLabel: UIImageView = {
        let JuicoyLab = UIImageView()
        JuicoyLab.contentMode = .scaleToFill
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyCoreHeart: UIImageView = {
        let JuicoyImg = UIImageView(image: UIImage(named: "joicoydisomend"))
        JuicoyImg.contentMode = .scaleAspectFit
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()
    
    private let JuicoyQuantityLabel: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.textColor = .white
        JuicoyLab.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyPriceBanner: UIView = {
        let JuicoyView = UIView()
        JuicoyView.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        JuicoyView.layer.cornerRadius = 12
        JuicoyView.layer.masksToBounds = true
        return JuicoyView
    }()
    
    private let JuicoyPriceLabel: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.textColor = .white
        JuicoyLab.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(JuicoyContainer)
        JuicoyContainer.addSubview(JuicoyTagLabel)
        JuicoyContainer.addSubview(JuicoyCoreHeart)
        JuicoyContainer.addSubview(JuicoyQuantityLabel)
        JuicoyContainer.addSubview(JuicoyPriceBanner)
        JuicoyPriceBanner.addSubview(JuicoyPriceLabel)
        
        NSLayoutConstraint.activate([
            JuicoyContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            JuicoyContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            JuicoyContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            JuicoyContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            JuicoyTagLabel.topAnchor.constraint(equalTo: JuicoyContainer.topAnchor),
            JuicoyTagLabel.leadingAnchor.constraint(equalTo: JuicoyContainer.leadingAnchor),
            JuicoyTagLabel.heightAnchor.constraint(equalToConstant: 15),
            JuicoyTagLabel.widthAnchor.constraint(equalToConstant: 94),
            
            JuicoyCoreHeart.centerXAnchor.constraint(equalTo: JuicoyContainer.centerXAnchor),
            JuicoyCoreHeart.topAnchor.constraint(equalTo: JuicoyContainer.topAnchor, constant: 25),
            JuicoyCoreHeart.widthAnchor.constraint(equalToConstant: 35),
            JuicoyCoreHeart.heightAnchor.constraint(equalToConstant: 35),
            
            JuicoyQuantityLabel.centerXAnchor.constraint(equalTo: JuicoyContainer.centerXAnchor),
            JuicoyQuantityLabel.topAnchor.constraint(equalTo: JuicoyCoreHeart.bottomAnchor, constant: 8),
            
            JuicoyPriceBanner.leadingAnchor.constraint(equalTo: JuicoyContainer.leadingAnchor),
            JuicoyPriceBanner.trailingAnchor.constraint(equalTo: JuicoyContainer.trailingAnchor),
            JuicoyPriceBanner.bottomAnchor.constraint(equalTo: JuicoyContainer.bottomAnchor),
            JuicoyPriceBanner.heightAnchor.constraint(equalToConstant: 30),
            
            JuicoyPriceLabel.centerXAnchor.constraint(equalTo: JuicoyPriceBanner.centerXAnchor),
            JuicoyPriceLabel.centerYAnchor.constraint(equalTo: JuicoyPriceBanner.centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) { fatalError() }

    func JuicoyConfigureEntity(_ JuicoyData: JuicoySparklePackage, JuicoyIsActive: Bool) {
        JuicoyQuantityLabel.text = JuicoyData.JuicoyQuantity
        JuicoyPriceLabel.text = JuicoyData.JuicoyPrice
        JuicoyTagLabel.image = UIImage(named: JuicoyData.JuicoyTag ?? "") 
        JuicoyTagLabel.isHidden = JuicoyData.JuicoyTag == nil
        
        JuicoyContainer.layer.borderColor = JuicoyIsActive ? UIColor.systemPurple.cgColor : UIColor.clear.cgColor
        JuicoyPriceBanner.backgroundColor = JuicoyIsActive ? UIColor.systemPurple : UIColor(white: 1.0, alpha: 0.1)
    }
}
