//
//  JuicoyEssenceVaultController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/26.
//

import UIKit
import UIKit

struct JuicoyRegistryEntry {
    let JuicoyTitle: String
    let JuicoyIcon: String
    let JuicoyValue: String?
}

class JuicoyEssenceVaultController: JuicoySeconedYEUIController {
    private let JuicoyStatusAura: UILabel = {
            let JuicoyLab = UILabel()
            JuicoyLab.text = "Optimizing Storage"
            JuicoyLab.textColor = .black
        JuicoyLab.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            JuicoyLab.textAlignment = .center
            
        JuicoyLab.isHidden = true
        
            return JuicoyLab
        }()
    
   
    
    private let JuicoyVaultManifest: [[JuicoyRegistryEntry]] = [
        [
            JuicoyRegistryEntry(JuicoyTitle: "My Membership", JuicoyIcon: "diamond", JuicoyValue: nil),
            JuicoyRegistryEntry(JuicoyTitle: "User Agreement", JuicoyIcon: "doc.text", JuicoyValue: nil),
            JuicoyRegistryEntry(JuicoyTitle: "Privacy", JuicoyIcon: "lock", JuicoyValue: nil)
        ],
        [
            JuicoyRegistryEntry(JuicoyTitle: "Clear the cache", JuicoyIcon: "paintbrush", JuicoyValue: ""),
           
            JuicoyRegistryEntry(JuicoyTitle: "Blocked List", JuicoyIcon: "person.slash", JuicoyValue: nil)
        ],
        [
            JuicoyRegistryEntry(JuicoyTitle: "About", JuicoyIcon: "info.circle", JuicoyValue: nil),
            JuicoyRegistryEntry(JuicoyTitle: "Delete Account", JuicoyIcon: "trash", JuicoyValue: nil)
        ]
    ]

    private let JuicoyStreamRegistry: UITableView = {
        let JuicoyTable = UITableView(frame: .zero, style: .insetGrouped)
        JuicoyTable.backgroundColor = .clear
        JuicoyTable.separatorInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
        JuicoyTable.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyTable
    }()

  
   

    private let JuicoyExitStageTrigger: UIButton = {
        let JuicoyBtn = UIButton(type: .custom)
        JuicoyBtn.setBackgroundImage(UIImage(named: "uicoyLogin"), for: .normal)
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Setting"
        JuicoyAssembleCanvas()
        JuicoyCalibrateLayout()
        JUICOYaddLoadingViewONSurface()
       
        JuicoyStatusAura.frame = CGRect.init(x: 0, y: 100, width: 180, height: 50)
        JuicoyStatusAura.center.x = UIScreen.main.bounds.width/2
        view.addSubview(JuicoyStatusAura)
    }

    private func JuicoyAssembleCanvas() {
        
        view.addSubview(JuicoyStreamRegistry)
        view.addSubview(JuicoyExitStageTrigger)
        
        JuicoyStreamRegistry.delegate = self
        JuicoyStreamRegistry.dataSource = self
        JuicoyStreamRegistry.register(JuicoyRefineryCell.self, forCellReuseIdentifier: "JuicoyRefineryCell")
        
        
        JuicoyExitStageTrigger.addTarget(self, action: #selector(JuicoyExecuteDissolve), for: .touchUpInside)
    }

    private func JuicoyCalibrateLayout() {
        NSLayoutConstraint.activate([
            

            JuicoyStreamRegistry.topAnchor.constraint(equalTo: self.view.topAnchor, constant: JUICOYalltotalTop + 10),
            JuicoyStreamRegistry.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyStreamRegistry.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyStreamRegistry.bottomAnchor.constraint(equalTo: JuicoyExitStageTrigger.topAnchor, constant: -20),

            JuicoyExitStageTrigger.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            JuicoyExitStageTrigger.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            JuicoyExitStageTrigger.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            JuicoyExitStageTrigger.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func JuicoyRevertTransition() {
        navigationController?.popViewController(animated: true)
    }

    
    @objc private func JuicoydeleteDissolve() {
        let JuicoyAlert = UIAlertController(title: "Delete Account", message: "Are you sure you want to delete your account?", preferredStyle: .alert)
        JuicoyAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        JuicoyAlert.addAction(UIAlertAction(title: "Sure", style: .destructive, handler: { _ in
            (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = JUICOYMotionClarity()
            JuicoyDataFactory.JuicoySharedInstance.JuicoyPerformSignOut()
           
        }))
        present(JuicoyAlert, animated: true)
    }
    
    @objc private func JuicoyExecuteDissolve() {
        let JuicoyAlert = UIAlertController(title: "Log out", message: "Are you sure you want to exit?", preferredStyle: .alert)
        JuicoyAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        JuicoyAlert.addAction(UIAlertAction(title: "Log out", style: .destructive, handler: { _ in
            (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = JUICOYMotionClarity()
            JuicoyDataFactory.JuicoySharedInstance.JuicoyPerformSignOut()
        }))
        present(JuicoyAlert, animated: true)
    }
}

extension JuicoyEssenceVaultController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return JuicoyVaultManifest.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JuicoyVaultManifest[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let JuicoyCell = tableView.dequeueReusableCell(withIdentifier: "JuicoyRefineryCell", for: indexPath) as! JuicoyRefineryCell
        JuicoyCell.JuicoyInfuseData(JuicoyVaultManifest[indexPath.section][indexPath.row])
        return JuicoyCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let JuicoyTargetData = JuicoyVaultManifest[indexPath.section][indexPath.row]
        switch JuicoyTargetData.JuicoyTitle {
        case "My Membership":
            self.navigationController?.pushViewController(JuicoymembershipController(), animated: true)
        case "User Agreement":
            let eluai = JUICYLegalAgreementViewController.init(JUICYContentType: .termsOfService)
            eluai.modalPresentationStyle = .overCurrentContext
            self.present(eluai, animated: true)
        case "Privacy":
            let eluai = JUICYLegalAgreementViewController.init(JUICYContentType: .privacyPolicy)
            eluai.modalPresentationStyle = .overCurrentContext
            self.present(eluai, animated: true)
        case "Clear the cache":
            self.JUICOYbeginLoad()
            JuicoyStatusAura.isHidden = false
            JuicoyStatusAura.text = "Clearing Cache..."
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: DispatchWorkItem(block: {
                self.JUICOYDismissLoad()
            }))
        case "Blocked List":
            self.navigationController?.pushViewController(JuicoyMotionNexusController(JuicoyTargetMode: .JuicoyBlocked), animated: true)
        case "About":
            self.navigationController?.pushViewController(JuicoyAboutController(), animated: true)
        case "Delete Account":
            JuicoydeleteDissolve()
        
        default:
            break
        }
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}

class JuicoyRefineryCell: UITableViewCell {

    private let JuicoyCoreIcon: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.contentMode = .scaleAspectFit
        JuicoyImg.tintColor = .black
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()

    private let JuicoyPrimaryLabel: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        JuicoyLab.textColor = .black
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private let JuicoyResidualLabel: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.font = UIFont.systemFont(ofSize: 14)
        JuicoyLab.textColor = .gray
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private let JuicoyIndicatorIcon: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.image = UIImage(systemName: "chevron.right")
        JuicoyImg.tintColor = .lightGray
        JuicoyImg.contentMode = .scaleAspectFit
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        JuicoyForgeArchitecture()
    }

    required init?(coder: NSCoder) {
        fatalError("Juicoy Build Error")
    }

    private func JuicoyForgeArchitecture() {
        backgroundColor = .white
        contentView.addSubview(JuicoyCoreIcon)
        contentView.addSubview(JuicoyPrimaryLabel)
        contentView.addSubview(JuicoyResidualLabel)
        contentView.addSubview(JuicoyIndicatorIcon)

        NSLayoutConstraint.activate([
            JuicoyCoreIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            JuicoyCoreIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            JuicoyCoreIcon.widthAnchor.constraint(equalToConstant: 22),
            JuicoyCoreIcon.heightAnchor.constraint(equalToConstant: 22),

            JuicoyPrimaryLabel.leadingAnchor.constraint(equalTo: JuicoyCoreIcon.trailingAnchor, constant: 12),
            JuicoyPrimaryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            JuicoyIndicatorIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            JuicoyIndicatorIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            JuicoyIndicatorIcon.widthAnchor.constraint(equalToConstant: 14),
            JuicoyIndicatorIcon.heightAnchor.constraint(equalToConstant: 14),

            JuicoyResidualLabel.trailingAnchor.constraint(equalTo: JuicoyIndicatorIcon.leadingAnchor, constant: -10),
            JuicoyResidualLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func JuicoyInfuseData(_ JuicoyData: JuicoyRegistryEntry) {
        JuicoyPrimaryLabel.text = JuicoyData.JuicoyTitle
        JuicoyCoreIcon.image = UIImage(systemName: JuicoyData.JuicoyIcon)
        JuicoyResidualLabel.text = JuicoyData.JuicoyValue
        JuicoyResidualLabel.isHidden = JuicoyData.JuicoyValue == nil
    }
}
