//
//  JuicoyAboutController.swift
//  JuicoyZer
//
//  Created by mumu on 2025/12/26.
//

import UIKit

class JuicoyAboutController: JuicoySeconedYEUIController {
    private let JuicoyCoreIdentityIcon: UIImageView = {
            let JuicoyImg = UIImageView()
            JuicoyImg.image = UIImage(named: "juicoyDynamicLog")
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
            JuicoyLab.text = "Version"
            JuicoyLab.textColor = .darkGray
            JuicoyLab.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
            return JuicoyLab
        }()

        private let JuicoyBuildVersionMetric: UILabel = {
            let JuicoyLab = UILabel()
            JuicoyLab.text = "1.0.0"
            JuicoyLab.textColor = .black
            JuicoyLab.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
            return JuicoyLab
        }()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "About us"
        JuicoyInitializeScene()
        
        JuicoyForgeArchitecture() 
    }
    
    private func JuicoyInitializeScene() {
           
            view.addSubview(JuicoyCoreIdentityIcon)
            view.addSubview(JuicoyAppTitleNexus)
            view.addSubview(JuicoyVersionDescriptor)
            view.addSubview(JuicoyBuildVersionMetric)
         
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
