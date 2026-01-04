//
//  JuicoyCollectionMasterController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/26.
//

import UIKit

import UIKit

enum JuicoyContentMode {
    case JuicoyGiftAura
    case JuicoyVideoOrbit
}

class JuicoyCollectionMasterController: JuicoySeconedViewController {
    
    private var JuicoyCurrentViewType: JuicoyContentMode = .JuicoyGiftAura
    
  
    
    private let JuicoyHeroPanel: UIImageView = {
        let JuicoyView = UIImageView()
        JuicoyView.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "joicoyCorner")
        JuicoyView.contentMode = .scaleToFill
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()
    

    private let JuicoyMetricValue: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.textColor = .white
        JuicoyLab.font = UIFont.systemFont(ofSize: 32, weight: .black)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyMetricSubtext: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.textColor = UIColor.white.withAlphaComponent(0.8)
        JuicoyLab.font = UIFont.systemFont(ofSize: 14)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyHeroArtIcon: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.contentMode = .scaleAspectFit
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()
    
    private let JuicoySectionDivider: UIView = {
        let JuicoyView = UIView()
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()
    
//    private let JuicoyEmptyStateBox: UIStackView = {
//        let JuicoyStack = UIStackView()
//        JuicoyStack.axis = .vertical
//        JuicoyStack.alignment = .center
//        JuicoyStack.spacing = 15
//        JuicoyStack.translatesAutoresizingMaskIntoConstraints = false
//        return JuicoyStack
//    }()
    
    private let JuicoyGhostIcon: UIImageView = {
        let JuicoyView = UIImageView()
        JuicoyView.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "joicoyEmityData")
        JuicoyView.contentMode = .scaleToFill
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()
    
   
    
    init(JuicoyMode: JuicoyContentMode) {
        self.JuicoyCurrentViewType = JuicoyMode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JuicoyAssembleInfrastructure()
        JuicoyInjectIdentity()
    }
    
   
    
    private func JuicoyAssembleInfrastructure() {
        
        view.addSubview(JuicoyHeroPanel)
         
        JuicoyHeroPanel.addSubview(JuicoyMetricValue)
        JuicoyHeroPanel.addSubview(JuicoyMetricSubtext)
        JuicoyHeroPanel.addSubview(JuicoyHeroArtIcon)
        view.addSubview(JuicoySectionDivider)
        view.addSubview(JuicoyGhostIcon)
//        JuicoyEmptyStateBox.addArrangedSubview(JuicoyGhostIcon)
//        
        
        NSLayoutConstraint.activate([
        
            
            JuicoyHeroPanel.topAnchor.constraint(equalTo: self.view.topAnchor, constant:JUICOYalltotalTop + 25),
            JuicoyHeroPanel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            JuicoyHeroPanel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            JuicoyHeroPanel.heightAnchor.constraint(equalToConstant: 150),
            
            JuicoyMetricValue.topAnchor.constraint(equalTo: JuicoyHeroPanel.topAnchor, constant: 35),
            JuicoyMetricValue.leadingAnchor.constraint(equalTo: JuicoyHeroPanel.leadingAnchor,constant: 60),
            
            JuicoyMetricSubtext.topAnchor.constraint(equalTo: JuicoyMetricValue.bottomAnchor, constant: 8),
            JuicoyMetricSubtext.leadingAnchor.constraint(equalTo: JuicoyMetricValue.leadingAnchor),
            
            JuicoyHeroArtIcon.trailingAnchor.constraint(equalTo: JuicoyHeroPanel.trailingAnchor, constant: -15),
            JuicoyHeroArtIcon.centerYAnchor.constraint(equalTo: JuicoyHeroPanel.centerYAnchor),
            JuicoyHeroArtIcon.widthAnchor.constraint(equalToConstant: 117),
            JuicoyHeroArtIcon.heightAnchor.constraint(equalToConstant: 118),
            
            JuicoySectionDivider.topAnchor.constraint(equalTo: JuicoyHeroPanel.bottomAnchor, constant: 20),
            JuicoySectionDivider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            JuicoySectionDivider.widthAnchor.constraint(equalToConstant: 150),
            JuicoySectionDivider.heightAnchor.constraint(equalToConstant: 30),
            
            JuicoyGhostIcon.topAnchor.constraint(equalTo: JuicoySectionDivider.bottomAnchor, constant: 100),
            JuicoyGhostIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            JuicoyGhostIcon.widthAnchor.constraint(equalToConstant: 140),
            JuicoyGhostIcon.heightAnchor.constraint(equalToConstant: 102)
        ])
    }
    
    private func JuicoyInjectIdentity() {
        switch JuicoyCurrentViewType {
        case .JuicoyGiftAura:
            self.title = "My Gift"
            JuicoyMetricValue.text = "0 / 99"
            JuicoyMetricSubtext.text = "Received Gifts"
            JuicoyHeroArtIcon.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JuicoyGiftShield")
           
            JuicoySetupDivider(JuicoyLabel: "✦ Gift display ✦")
            
        case .JuicoyVideoOrbit:
            self.title = "My Video"
            JuicoyMetricValue.text = "0"
            JuicoyMetricSubtext.text = "Uploaded Clips"
            JuicoyHeroArtIcon.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JuicoyVideoPlayerArt")
           
            JuicoySetupDivider(JuicoyLabel: "✦ Video Library ✦")
        }
    }
    
    private func JuicoySetupDivider(JuicoyLabel: String) {
        let JuicoyText = UILabel()
        JuicoyText.text = JuicoyLabel
        JuicoyText.textColor = .white
        JuicoyText.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        JuicoyText.textAlignment = .center
        JuicoyText.translatesAutoresizingMaskIntoConstraints = false
        
        JuicoySectionDivider.addSubview(JuicoyText)
        NSLayoutConstraint.activate([
            JuicoyText.centerXAnchor.constraint(equalTo: JuicoySectionDivider.centerXAnchor),
            JuicoyText.centerYAnchor.constraint(equalTo: JuicoySectionDivider.centerYAnchor)
        ])
    }
    
    @objc private func JuicoyExecuteReversion() {
        self.navigationController?.popViewController(animated: true)
    }
}
