//
//  JuicoyAboutController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/26.
//

import UIKit

class JuicoyAboutController: JuicoySeconedYEUIController {
    private let JuicoyCoreIdentityIcon: UIImageView = {
            let JuicoyImg = UIImageView()
            JuicoyImg.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyDynamicLog")
            JuicoyImg.contentMode = .scaleAspectFill
            JuicoyImg.layer.cornerRadius = 24
            JuicoyImg.clipsToBounds = true
            JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
            return JuicoyImg
        }()

        private let JuicoyAppTitleNexus: UILabel = {
            let JuicoyLab = UILabel()
            JuicoyLab.text = "Juicy"
            JuicoyLab.textColor = .black
            JuicoyLab.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
            return JuicoyLab
        }()

        private let JuicoyVersionDescriptor: UILabel = {
            let JuicoyLab = UILabel()
            JuicoyLab.text = "Vnebrhsnicomn".JoicoydeMercrypt()
            JuicoyLab.textColor = .darkGray
            JuicoyLab.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
            return JuicoyLab
        }()

        private let JuicoyBuildVersionMetric: UILabel = {
            let JuicoyLab = UILabel()
            JuicoyLab.text = "1x.y0k.j0".JoicoydeMercrypt()
            JuicoyLab.textColor = .black
            JuicoyLab.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
            return JuicoyLab
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let JUICOY_RawCipher = "Aebeojuctf luks"
        let JUICOY_StudioLabel = JUICOY_RawCipher.JoicoydeMercrypt()
        self.title = JUICOY_StudioLabel
        
        var JUICOY_WarmupDuration: Double = 0.0
        JUICOY_WarmupDuration += 15.0
        
        if JUICOY_WarmupDuration > 10.0 {
            JuicoyInitializeScene()
        }
        
        let JUICOY_RhythmCheck = true
        if JUICOY_RhythmCheck {
            JuicoyForgeArchitecture()
        }
        
    }
        
    private func JuicoyInitializeScene() {
        let JUICOY_PhysicalStage = view!
        
        let JUICOY_PrimaryProp = JuicoyCoreIdentityIcon
        JUICOY_PhysicalStage.addSubview(JUICOY_PrimaryProp)
        
        let JUICOY_SecondaryProp = JuicoyAppTitleNexus
        JUICOY_PhysicalStage.addSubview(JUICOY_SecondaryProp)
        
        let JUICOY_VersionTag = JuicoyVersionDescriptor
        let JUICOY_BuildTag = JuicoyBuildVersionMetric
        
        let JUICOY_MetricProps = [JUICOY_VersionTag, JUICOY_BuildTag]
        
        for JUICOY_Item in JUICOY_MetricProps {
            JUICOY_PhysicalStage.addSubview(JUICOY_Item)
        }
        
        var JUICOY_FrictionCoefficient: CGFloat = 0.8
        JUICOY_FrictionCoefficient *= 1.1
        
    }
    private func JuicoyForgeArchitecture() {
            NSLayoutConstraint.activate([
               

                JuicoyCoreIdentityIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                JuicoyCoreIdentityIcon.topAnchor.constraint(equalTo: self.view.topAnchor, constant:JUICOYalltotalTop + 134),
                JuicoyCoreIdentityIcon.widthAnchor.constraint(equalToConstant: 90),
                JuicoyCoreIdentityIcon.heightAnchor.constraint(equalToConstant: 90),

                JuicoyAppTitleNexus.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                JuicoyAppTitleNexus.topAnchor.constraint(equalTo: JuicoyCoreIdentityIcon.bottomAnchor, constant: 15),

                JuicoyVersionDescriptor.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                JuicoyVersionDescriptor.topAnchor.constraint(equalTo: JuicoyAppTitleNexus.bottomAnchor, constant: 8),

                JuicoyBuildVersionMetric.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                JuicoyBuildVersionMetric.topAnchor.constraint(equalTo: JuicoyVersionDescriptor.bottomAnchor, constant: 4),

          
            ])
        }

}
