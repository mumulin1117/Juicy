//
//  JuicoyChatCell.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/25.
//

import UIKit

final class JuicoyChatCell: UITableViewCell {

    private let JuicoyAvatarView = UIImageView()
    private let JuicoyTitleLabel = UILabel()
    private let JuicoySubtitleLabel = UILabel()
    private let JuicoyUnreadBadge = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        JuicoyConfigureUI()
    }

    required init?(coder: NSCoder) { nil }

    private func JuicoyConfigureUI() {
        JuicoyAvatarView.frame = CGRect(x: 20, y: 14, width: 50, height: 50)
        JuicoyAvatarView.layer.cornerRadius = 25
        JuicoyAvatarView.clipsToBounds = true
        
        contentView.addSubview(JuicoyAvatarView)

        JuicoyTitleLabel.frame = CGRect(x: 84, y: 16, width: 200, height: 22)
        JuicoyTitleLabel.textColor = .white
        JuicoyTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        contentView.addSubview(JuicoyTitleLabel)

        JuicoySubtitleLabel.frame = CGRect(x: 84, y: 40, width: 220, height: 18)
        JuicoySubtitleLabel.textColor = UIColor.white.withAlphaComponent(0.6)
        JuicoySubtitleLabel.font = UIFont.systemFont(ofSize: 13)
        contentView.addSubview(JuicoySubtitleLabel)
//
//        JuicoyUnreadBadge.frame = CGRect(x: UIScreen.main.bounds.width - 44, y: 28, width: 22, height: 22)
//        JuicoyUnreadBadge.backgroundColor = UIColor(red: 1, green: 1, blue: 0.33, alpha: 1)
//        JuicoyUnreadBadge.textColor = .black
//        JuicoyUnreadBadge.font = UIFont.systemFont(ofSize: 12, weight: .bold)
//        JuicoyUnreadBadge.textAlignment = .center
//        JuicoyUnreadBadge.layer.cornerRadius = 11
//        JuicoyUnreadBadge.clipsToBounds = true
//        contentView.addSubview(JuicoyUnreadBadge)
    }

    func JuicoyBind(item: JuicoyConversationPreview) {
        JuicoyTitleLabel.text = item.JuicoyUser.JuicoyHandle
        JuicoySubtitleLabel.text = item.JuicoyLastMsg.JuicoyContent
        
        JuicoyAvatarView.image =   UIImage(named: item.JuicoyUser.JuicoyAvatarKey)
        JuicoyAvatarView.tintColor = .white
    }
}
