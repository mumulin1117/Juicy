//
//  JuicoySignalPacket.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/26.
//

import UIKit
struct JuicoyFabricMessage {
    let JuicoyContent: String
    let JuicoyIsLead: Bool// true 为自己发送，false 为对方发送
    let JuicoyTimestamp: String
}
class JuicoyEchoThreadCell: UITableViewCell {

    private let JuicoyAvatarOrb: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.contentMode = .scaleAspectFill
        JuicoyImg.layer.cornerRadius = 20
        JuicoyImg.clipsToBounds = true
        JuicoyImg.backgroundColor = .darkGray
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()

    private let JuicoyPulseBubble: UIView = {
        let JuicoyView = UIView()
        JuicoyView.layer.cornerRadius = 16
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    private let JuicoyContentEcho: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.numberOfLines = 0
        JuicoyLab.font = UIFont.systemFont(ofSize: 16)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private let JuicoyChronosLabel: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.font = UIFont.systemFont(ofSize: 12)
        JuicoyLab.textColor = .lightGray
        JuicoyLab.textAlignment = .center
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private var JuicoyLeadConstraints: [NSLayoutConstraint] = []
    private var JuicoyFollowConstraints: [NSLayoutConstraint] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        JuicoyForgeCellArchitecture()
    }

    required init?(coder: NSCoder) {
        fatalError("Juicoy Error")
    }

    private func JuicoyForgeCellArchitecture() {
        backgroundColor = .clear
        contentView.addSubview(JuicoyChronosLabel)
        contentView.addSubview(JuicoyAvatarOrb)
        contentView.addSubview(JuicoyPulseBubble)
        JuicoyPulseBubble.addSubview(JuicoyContentEcho)

        NSLayoutConstraint.activate([
            JuicoyChronosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            JuicoyChronosLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            JuicoyAvatarOrb.topAnchor.constraint(equalTo: JuicoyChronosLabel.bottomAnchor, constant: 10),
            JuicoyAvatarOrb.widthAnchor.constraint(equalToConstant: 40),
            JuicoyAvatarOrb.heightAnchor.constraint(equalToConstant: 40),

            JuicoyPulseBubble.topAnchor.constraint(equalTo: JuicoyAvatarOrb.topAnchor),
            JuicoyPulseBubble.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            JuicoyPulseBubble.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.75),

            JuicoyContentEcho.topAnchor.constraint(equalTo: JuicoyPulseBubble.topAnchor, constant: 12),
            JuicoyContentEcho.bottomAnchor.constraint(equalTo: JuicoyPulseBubble.bottomAnchor, constant: -12),
            JuicoyContentEcho.leadingAnchor.constraint(equalTo: JuicoyPulseBubble.leadingAnchor, constant: 15),
            JuicoyContentEcho.trailingAnchor.constraint(equalTo: JuicoyPulseBubble.trailingAnchor, constant: -15)
        ])

        JuicoyLeadConstraints = [
            JuicoyAvatarOrb.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            JuicoyPulseBubble.leadingAnchor.constraint(equalTo: JuicoyAvatarOrb.trailingAnchor, constant: 10)
        ]

        JuicoyFollowConstraints = [
            JuicoyAvatarOrb.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            JuicoyPulseBubble.trailingAnchor.constraint(equalTo: JuicoyAvatarOrb.leadingAnchor, constant: -10)
        ]
    }

    func JuicoyInfusePulse(_ JuicoyPulse: JuicoyFabricMessage,JuicoyisAI:Bool = true,uimage:String? = nil) {
        JuicoyContentEcho.text = JuicoyPulse.JuicoyContent
        JuicoyChronosLabel.text = JuicoyPulse.JuicoyTimestamp
        JuicoyChronosLabel.isHidden = JuicoyPulse.JuicoyTimestamp.isEmpty
        
        if JuicoyPulse.JuicoyIsLead {
            NSLayoutConstraint.deactivate(JuicoyFollowConstraints)
            NSLayoutConstraint.activate(JuicoyLeadConstraints)
            JuicoyPulseBubble.backgroundColor = .white
            JuicoyContentEcho.textColor = .black
            if JuicoyisAI {
                JuicoyAvatarOrb.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoydanceAiAvator")
            }else{
                
                JuicoyAvatarOrb.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: uimage ?? "")
                
            }
            
            
            
            
        } else {
            NSLayoutConstraint.deactivate(JuicoyLeadConstraints)
            NSLayoutConstraint.activate(JuicoyFollowConstraints)
            JuicoyPulseBubble.backgroundColor = UIColor(red: 168/255, green: 70/255, blue: 255/255, alpha: 1.0)
            JuicoyContentEcho.textColor = .white
            JuicoyAvatarOrb.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyDynamicLog")
        }
    }
}
