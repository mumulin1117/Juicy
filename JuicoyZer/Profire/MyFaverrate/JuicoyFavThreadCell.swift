//
//  JuicoyFavThreadCell.swift
//  JuicoyZer
//
//  Created by mumu on 2025/12/26.
//

import UIKit

class JuicoyFavThreadCell: UICollectionViewCell {

    private let JuicoySpinCanvas: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.contentMode = .scaleAspectFill
        JuicoyImg.layer.cornerRadius = 20
        JuicoyImg.clipsToBounds = true
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()

    private let JuicoyMotionIcon: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.tintColor = .white
        JuicoyImg.contentMode = .scaleAspectFit
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()

    private let JuicoyPerformerOrb: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.layer.cornerRadius = 12
        JuicoyImg.clipsToBounds = true
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()

    private let JuicoyStageName: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.textColor = .white
        JuicoyLab.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private let JuicoyEchoBubble: UIView = {
        let JuicoyView = UIView()
        JuicoyView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        JuicoyView.layer.cornerRadius = 15
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    private let JuicoyAuraLabel: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.textColor = .white
        JuicoyLab.numberOfLines = 2
        JuicoyLab.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        JuicoyForgeCellElements()
    }

    required init?(coder: NSCoder) {
        fatalError("Juicoy Build Error")
    }

    private func JuicoyForgeCellElements() {
        contentView.addSubview(JuicoySpinCanvas)
        JuicoySpinCanvas.addSubview(JuicoyMotionIcon)
        JuicoySpinCanvas.addSubview(JuicoyPerformerOrb)
        JuicoySpinCanvas.addSubview(JuicoyStageName)
        JuicoySpinCanvas.addSubview(JuicoyEchoBubble)
        JuicoyEchoBubble.addSubview(JuicoyAuraLabel)

        NSLayoutConstraint.activate([
            JuicoySpinCanvas.topAnchor.constraint(equalTo: contentView.topAnchor),
            JuicoySpinCanvas.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            JuicoySpinCanvas.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            JuicoySpinCanvas.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            JuicoyMotionIcon.centerXAnchor.constraint(equalTo: JuicoySpinCanvas.centerXAnchor),
            JuicoyMotionIcon.centerYAnchor.constraint(equalTo: JuicoySpinCanvas.centerYAnchor),
            JuicoyMotionIcon.widthAnchor.constraint(equalToConstant: 40),
            JuicoyMotionIcon.heightAnchor.constraint(equalToConstant: 40),

            JuicoyPerformerOrb.leadingAnchor.constraint(equalTo: JuicoySpinCanvas.leadingAnchor, constant: 10),
            JuicoyPerformerOrb.bottomAnchor.constraint(equalTo: JuicoyEchoBubble.topAnchor, constant: -10),
            JuicoyPerformerOrb.widthAnchor.constraint(equalToConstant: 24),
            JuicoyPerformerOrb.heightAnchor.constraint(equalToConstant: 24),

            JuicoyStageName.centerYAnchor.constraint(equalTo: JuicoyPerformerOrb.centerYAnchor),
            JuicoyStageName.leadingAnchor.constraint(equalTo: JuicoyPerformerOrb.trailingAnchor, constant: 6),
            JuicoyStageName.trailingAnchor.constraint(equalTo: JuicoySpinCanvas.trailingAnchor, constant: -10),

            JuicoyEchoBubble.leadingAnchor.constraint(equalTo: JuicoySpinCanvas.leadingAnchor, constant: 10),
            JuicoyEchoBubble.trailingAnchor.constraint(equalTo: JuicoySpinCanvas.trailingAnchor, constant: -10),
            JuicoyEchoBubble.bottomAnchor.constraint(equalTo: JuicoySpinCanvas.bottomAnchor, constant: -10),

            JuicoyAuraLabel.topAnchor.constraint(equalTo: JuicoyEchoBubble.topAnchor, constant: 8),
            JuicoyAuraLabel.leadingAnchor.constraint(equalTo: JuicoyEchoBubble.leadingAnchor, constant: 10),
            JuicoyAuraLabel.trailingAnchor.constraint(equalTo: JuicoyEchoBubble.trailingAnchor, constant: -10),
            JuicoyAuraLabel.bottomAnchor.constraint(equalTo: JuicoyEchoBubble.bottomAnchor, constant: -8)
        ])
    }

    func JuicoySyncVibe(_ JuicoyVibe: JuicoyMotionVibe) {
        JuicoySpinCanvas.image = UIImage(named: JuicoyVibe.JuicoyStageCover)
        JuicoyPerformerOrb.image = UIImage(named: JuicoyVibe.JuicoyPerformerOrb)
        JuicoyStageName.text = JuicoyVibe.JuicoyPerformerName
        JuicoyAuraLabel.text = JuicoyVibe.JuicoyAuraTitle
        
        let JuicoySymbol = JuicoyVibe.JuicoyIsActive ? "pause.fill" : "play.fill"
        JuicoyMotionIcon.image = UIImage(systemName: JuicoySymbol)
    }
}
