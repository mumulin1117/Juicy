//
//  JuicoymembershipController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/26.
//

import UIKit

class JuicoymembershipController: JuicoySeconedViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Membership"
        JuicoyBuildArchitecture()
        JuicoyRefineTierSelection()
        JuicoyEmpireVipBadge.tintColor =  (JuicoyDataFactory.currentUserModel?.JuicoyPremiumStatus == "1") ? UIColor.yellow : UIColor.lightGray
        JuicoyExpirationAura.text = JuicoyDataFactory.currentUserModel?.JUICOYUVIPExpireTime
    }
    



    private let JuicoyVibrantScrollBase: UIScrollView = {
        let JuicoyScroll = UIScrollView()
        JuicoyScroll.backgroundColor = .clear
        JuicoyScroll.contentInsetAdjustmentBehavior = .never
        JuicoyScroll.showsVerticalScrollIndicator = false
        JuicoyScroll.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyScroll
    }()

    private let JuicoyEmpireContentStack: UIView = {
        let JuicoyView = UIView()
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    private let JuicoyHeroAuraBackdrop: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JuicoySeizeBanner")
        JuicoyImg.contentMode = .scaleToFill
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()

   

    private let JuicoyIdentityCardContainer: UIImageView = {
        let JuicoyView = UIImageView(image:  JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoypremiijLog"))
        JuicoyView.contentMode = .scaleToFill
        JuicoyView.isUserInteractionEnabled = true
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    private let JuicoySoulAvatar: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier:JuicoyDataFactory.currentUserModel?.JuicoyAvatarKey ?? "juicoyDynamicLog")
        JuicoyImg.contentMode = .scaleAspectFill
        JuicoyImg.layer.cornerRadius = 25
        JuicoyImg.clipsToBounds = true
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()

    private let JuicoySoulHandle: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.text = JuicoyDataFactory.currentUserModel?.JuicoyHandle
        JuicoyLab.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private let JuicoyEmpireVipBadge: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.image = UIImage(systemName: "v.circle.fill")
        JuicoyImg.tintColor = .lightGray
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()

    private let JuicoyExpirationAura: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.text = "VIP not yet activated"
        JuicoyLab.textColor = .lightGray
        JuicoyLab.font = UIFont.systemFont(ofSize: 12)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private let JuicoyTierRhythmStack: UIStackView = {
        let JuicoyStack = UIStackView()
        JuicoyStack.axis = .vertical
        JuicoyStack.spacing = 12
        JuicoyStack.distribution = .fillEqually
        JuicoyStack.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyStack
    }()

    private let JuicoyInitiateEmpireTrigger: UIButton = {
        let JuicoyBtn = UIButton()
        JuicoyBtn.setBackgroundImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "Juicoygetit"), for: .normal)
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        JuicoyBtn.addTarget(self, action: #selector(juicoyPayForVIP), for: .touchUpInside)
        return JuicoyBtn
    }()
    
    @objc func juicoyPayForVIP() {
        JUICOYbeginLoad()
        if JuicoyDataFactory.JuicoySharedInstance.JuicoyPurchaseRemebershio(JuicoySelectedTierIndex: JuicoySelectedTierIndex) {
            self.JUICOYshowMessage("Purchase Successful! For VIP")
            self.JUICOYDismissLoad()
            JuicoyEmpireVipBadge.tintColor = .orange
            if JuicoySelectedTierIndex == 0 {
                JuicoyExpirationAura.text = "Expires on 2026-02-07"
            }
            
            if JuicoySelectedTierIndex == 1 {
                JuicoyExpirationAura.text = "Expires on 2027-01-30"
            }
            
            if JuicoySelectedTierIndex == 2 {
                JuicoyExpirationAura.text = "Lifetime"
            }
            JuicoyDataFactory.currentUserModel?.JuicoyPremiumStatus = "1"
            JuicoyDataFactory.currentUserModel?.JUICOYUVIPExpireTime = JuicoyExpirationAura.text ?? ""
        } else {
            self.JUICOYDismissLoad()
            let juicoymodal = JuicoyWalletFluxController()
            self.navigationController?.pushViewController(juicoymodal, animated: true)
        }
        
       
    }
    
    
    private let JuicoyPrivilegeGraphicBoard: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JuicoyPrivilegesFooter")
        JuicoyImg.contentMode = .scaleAspectFit
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()

    private var JuicoySelectedTierIndex = 1


    private func JuicoyBuildArchitecture() {
        view.addSubview(JuicoyVibrantScrollBase)
        JuicoyVibrantScrollBase.addSubview(JuicoyEmpireContentStack)
        
        JuicoyEmpireContentStack.addSubview(JuicoyHeroAuraBackdrop)
       
        JuicoyEmpireContentStack.addSubview(JuicoyIdentityCardContainer)
        
        JuicoyIdentityCardContainer.addSubview(JuicoySoulAvatar)
        JuicoyIdentityCardContainer.addSubview(JuicoySoulHandle)
        JuicoyIdentityCardContainer.addSubview(JuicoyEmpireVipBadge)
        JuicoyIdentityCardContainer.addSubview(JuicoyExpirationAura)
        JuicoyIdentityCardContainer.addSubview(JuicoyTierRhythmStack)
        JuicoyIdentityCardContainer.addSubview(JuicoyInitiateEmpireTrigger)
        
        JuicoyEmpireContentStack.addSubview(JuicoyPrivilegeGraphicBoard)
        
        let JuicoyWeekly = JuicoyTierPortalView(JuicoyName: "Weekly", JuicoyCost: "699", JuicoyIdx: 0)
        let JuicoyAnnually = JuicoyTierPortalView(JuicoyName: "Annually", JuicoyCost: "1499", JuicoyIdx: 1, JuicoyIsHot: true)
        let JuicoyLifetime = JuicoyTierPortalView(JuicoyName: "Lifetime", JuicoyCost: "4599", JuicoyIdx: 2)
        
        [JuicoyWeekly, JuicoyAnnually, JuicoyLifetime].forEach {
            JuicoyTierRhythmStack.addArrangedSubview($0)
            let JuicoyTap = UITapGestureRecognizer(target: self, action: #selector(JuicoyTierInteraction(_:)))
            $0.addGestureRecognizer(JuicoyTap)
        }
        
       
        NSLayoutConstraint.activate([
            JuicoyVibrantScrollBase.topAnchor.constraint(equalTo: view.topAnchor,constant: JUICOYalltotalTop + 20),
            JuicoyVibrantScrollBase.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyVibrantScrollBase.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyVibrantScrollBase.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            JuicoyEmpireContentStack.topAnchor.constraint(equalTo: JuicoyVibrantScrollBase.topAnchor),
            JuicoyEmpireContentStack.leadingAnchor.constraint(equalTo: JuicoyVibrantScrollBase.leadingAnchor),
            JuicoyEmpireContentStack.trailingAnchor.constraint(equalTo: JuicoyVibrantScrollBase.trailingAnchor),
            JuicoyEmpireContentStack.bottomAnchor.constraint(equalTo: JuicoyVibrantScrollBase.bottomAnchor),
            JuicoyEmpireContentStack.widthAnchor.constraint(equalTo: JuicoyVibrantScrollBase.widthAnchor),
            
            JuicoyHeroAuraBackdrop.topAnchor.constraint(equalTo: JuicoyEmpireContentStack.topAnchor),
            JuicoyHeroAuraBackdrop.leadingAnchor.constraint(equalTo: JuicoyEmpireContentStack.leadingAnchor,constant: 15),
            JuicoyHeroAuraBackdrop.trailingAnchor.constraint(equalTo: JuicoyEmpireContentStack.trailingAnchor,constant: -15),
            JuicoyHeroAuraBackdrop.heightAnchor.constraint(equalToConstant: 1049),
            
           
            
            JuicoyIdentityCardContainer.topAnchor.constraint(equalTo: self.JuicoyHeroAuraBackdrop.topAnchor, constant: JUICOYalltotalTop + 225),
            JuicoyIdentityCardContainer.leadingAnchor.constraint(equalTo: JuicoyHeroAuraBackdrop.leadingAnchor, constant: 25),
            JuicoyIdentityCardContainer.trailingAnchor.constraint(equalTo: JuicoyHeroAuraBackdrop.trailingAnchor, constant: -25),
            JuicoyIdentityCardContainer.heightAnchor.constraint(equalToConstant: 390),
            
            JuicoySoulAvatar.topAnchor.constraint(equalTo: JuicoyIdentityCardContainer.topAnchor, constant: 25),
            JuicoySoulAvatar.leadingAnchor.constraint(equalTo: JuicoyIdentityCardContainer.leadingAnchor, constant: 20),
            JuicoySoulAvatar.widthAnchor.constraint(equalToConstant: 50),
            JuicoySoulAvatar.heightAnchor.constraint(equalToConstant: 50),
            
            JuicoySoulHandle.topAnchor.constraint(equalTo: JuicoySoulAvatar.topAnchor, constant: 2),
            JuicoySoulHandle.leadingAnchor.constraint(equalTo: JuicoySoulAvatar.trailingAnchor, constant: 12),
            
            JuicoyEmpireVipBadge.centerYAnchor.constraint(equalTo: JuicoySoulHandle.centerYAnchor),
            JuicoyEmpireVipBadge.leadingAnchor.constraint(equalTo: JuicoySoulHandle.trailingAnchor, constant: 8),
            
            JuicoyExpirationAura.topAnchor.constraint(equalTo: JuicoySoulHandle.bottomAnchor, constant: 4),
            JuicoyExpirationAura.leadingAnchor.constraint(equalTo: JuicoySoulHandle.leadingAnchor),
            
            JuicoyTierRhythmStack.topAnchor.constraint(equalTo: JuicoySoulAvatar.bottomAnchor, constant: 30),
            JuicoyTierRhythmStack.leadingAnchor.constraint(equalTo: JuicoyIdentityCardContainer.leadingAnchor, constant: 15),
            JuicoyTierRhythmStack.trailingAnchor.constraint(equalTo: JuicoyIdentityCardContainer.trailingAnchor, constant: -15),
            JuicoyTierRhythmStack.heightAnchor.constraint(equalToConstant: 200),
            
            JuicoyInitiateEmpireTrigger.bottomAnchor.constraint(equalTo: JuicoyIdentityCardContainer.bottomAnchor, constant: -20),
            JuicoyInitiateEmpireTrigger.centerXAnchor.constraint(equalTo: JuicoyIdentityCardContainer.centerXAnchor),
            JuicoyInitiateEmpireTrigger.widthAnchor.constraint(equalToConstant:200),
            JuicoyInitiateEmpireTrigger.heightAnchor.constraint(equalToConstant: 62),
            
            JuicoyPrivilegeGraphicBoard.topAnchor.constraint(equalTo: JuicoyIdentityCardContainer.bottomAnchor, constant: 20),
            JuicoyPrivilegeGraphicBoard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            JuicoyPrivilegeGraphicBoard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            JuicoyPrivilegeGraphicBoard.bottomAnchor.constraint(equalTo: JuicoyEmpireContentStack.bottomAnchor, constant: -40)
        ])
    }

    @objc private func JuicoyTierInteraction(_ JuicoySender: UITapGestureRecognizer) {
        guard let JuicoyView = JuicoySender.view as? JuicoyTierPortalView else { return }
        JuicoySelectedTierIndex = JuicoyView.tag
        JuicoyRefineTierSelection()
    }

    private func JuicoyRefineTierSelection() {
        for (JuicoyIdx, JuicoyView) in JuicoyTierRhythmStack.arrangedSubviews.enumerated() {
            if let JuicoyTier = JuicoyView as? JuicoyTierPortalView {
                JuicoyTier.JuicoyAnimateFocus(JuicoyIdx == JuicoySelectedTierIndex)
            }
        }
    }

    @objc private func JuicoyRevertMotion() {
        navigationController?.popViewController(animated: true)
    }
}

class JuicoyTierPortalView: UIView {
    
    private let JuicoyTierLabel: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyMetricLabel: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.font = UIFont.systemFont(ofSize: 18, weight: .black)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyHeartIcon: UIImageView = {
        let JuicoyImg = UIImageView(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "smallheart.fill"))
        
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()
    
    private let JuicoyHotEcho: UIImageView = {
        let JuicoyLab = UIImageView.init(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoypoupo"))
      
        JuicoyLab.isHidden = true
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    init(JuicoyName: String, JuicoyCost: String, JuicoyIdx: Int, JuicoyIsHot: Bool = false) {
        super.init(frame: .zero)
        self.tag = JuicoyIdx
        self.JuicoyTierLabel.text = JuicoyName
        self.JuicoyMetricLabel.text = JuicoyCost
        self.JuicoyHotEcho.isHidden = !JuicoyIsHot
        JuicoyForgePortal()
    }
    
    required init?(coder: NSCoder) { fatalError() }

    private func JuicoyForgePortal() {
        layer.cornerRadius = 15
        backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        layer.borderWidth = 2
        layer.borderColor = UIColor.clear.cgColor
        
        addSubview(JuicoyTierLabel)
        addSubview(JuicoyHeartIcon)
        addSubview(JuicoyMetricLabel)
        addSubview(JuicoyHotEcho)
        
        NSLayoutConstraint.activate([
            JuicoyTierLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            JuicoyTierLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            JuicoyMetricLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            JuicoyMetricLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            JuicoyHeartIcon.trailingAnchor.constraint(equalTo: JuicoyMetricLabel.leadingAnchor, constant: -8),
            JuicoyHeartIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            JuicoyHeartIcon.widthAnchor.constraint(equalToConstant: 16),
            JuicoyHeartIcon.heightAnchor.constraint(equalToConstant: 16),
            
            JuicoyHotEcho.centerXAnchor.constraint(equalTo: centerXAnchor),
            JuicoyHotEcho.topAnchor.constraint(equalTo: topAnchor, constant: -8),
            JuicoyHotEcho.widthAnchor.constraint(equalToConstant: 100),
            JuicoyHotEcho.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func JuicoyAnimateFocus(_ JuicoyFocused: Bool) {
        UIView.animate(withDuration: 0.2) {
            self.layer.borderColor = JuicoyFocused ? UIColor.systemPurple.cgColor : UIColor.clear.cgColor
            self.backgroundColor = JuicoyFocused ? UIColor(red: 245/255, green: 235/255, blue: 255/255, alpha: 1.0) : UIColor(white: 0.98, alpha: 1.0)
        }
    }
}
