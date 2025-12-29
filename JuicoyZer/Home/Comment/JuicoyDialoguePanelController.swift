//
//  JuicoyDialoguePanelController.swift
//  JuicoyZer
//
//  Created by mumu on 2025/12/29.
//

import UIKit
protocol JuicoyDialogueInteractionDelegate: AnyObject {
    func JuicoyDidUpdateTalkCount(JuicoyNewTotal: Int)
}
class JuicoyDialoguePanelController: UIViewController {

    weak var JuicoyDelegate: JuicoyDialogueInteractionDelegate?
    
    private var JuicoyTalkRegistry: [[String: Any]] = [
        ["JuicoyAuthor": "Sally Schultz", "JuicoyContent": "I can be everything you like", "JuicoyStamp": "12 minutes ago", "JuicoyReplies": [
            ["JuicoyAuthor": "Lydia Floyd", "JuicoyContent": "Love you"],
            ["JuicoyAuthor": "Kate Lowe", "JuicoyContent": "Nice"]
        ]],
        ["JuicoyAuthor": "Ada Dennis", "JuicoyContent": "Lead by example for yourself; act with empathy for your team", "JuicoyStamp": "12 minutes ago", "JuicoyReplies": []],
        ["JuicoyAuthor": "Jean Burgess", "JuicoyContent": "Lead by example for yourself; act with empathy for your team", "JuicoyStamp": "13 minutes ago", "JuicoyReplies": []]
    ]

    private let JuicoyBasePlate: UIView = {
        let JuicoyView = UIView()
        JuicoyView.backgroundColor = .white
        JuicoyView.layer.cornerRadius = 15
        JuicoyView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    private let JuicoyHeaderLabel: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.textColor = .black
        JuicoyLab.font = .systemFont(ofSize: 16, weight: .bold)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private let JuicoyTalkStream: UITableView = {
        let JuicoyTab = UITableView()
        JuicoyTab.separatorStyle = .none
        JuicoyTab.backgroundColor = .clear
        JuicoyTab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyTab
    }()

    private let JuicoyEmptyNexus: UIView = {
        let JuicoyView = UIView()
        JuicoyView.isHidden = true
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    private let JuicoyInputVault: UIView = {
        let JuicoyView = UIView()
        JuicoyView.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        JuicoyConstructLayout()
        JuicoyRefreshState()
    }

    private func JuicoyConstructLayout() {
        view.backgroundColor = .clear
        let JuicoyDimmer = UITapGestureRecognizer(target: self, action: #selector(JuicoyDismissPanel))
        let JuicoyBg = UIView(frame: view.bounds)
        JuicoyBg.addGestureRecognizer(JuicoyDimmer)
        view.addSubview(JuicoyBg)
        
        view.addSubview(JuicoyBasePlate)
        JuicoyBasePlate.addSubview(JuicoyHeaderLabel)
        JuicoyBasePlate.addSubview(JuicoyTalkStream)
        JuicoyBasePlate.addSubview(JuicoyEmptyNexus)
        JuicoyBasePlate.addSubview(JuicoyInputVault)

        JuicoyTalkStream.delegate = self
        JuicoyTalkStream.dataSource = self
        JuicoyTalkStream.register(JuicoyTalkCell.self, forCellReuseIdentifier: "JuicoyTalk")

        NSLayoutConstraint.activate([
            JuicoyBasePlate.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyBasePlate.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyBasePlate.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            JuicoyBasePlate.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65),

            JuicoyHeaderLabel.topAnchor.constraint(equalTo: JuicoyBasePlate.topAnchor, constant: 15),
            JuicoyHeaderLabel.leadingAnchor.constraint(equalTo: JuicoyBasePlate.leadingAnchor, constant: 15),

            JuicoyTalkStream.topAnchor.constraint(equalTo: JuicoyHeaderLabel.bottomAnchor, constant: 15),
            JuicoyTalkStream.leadingAnchor.constraint(equalTo: JuicoyBasePlate.leadingAnchor),
            JuicoyTalkStream.trailingAnchor.constraint(equalTo: JuicoyBasePlate.trailingAnchor),
            JuicoyTalkStream.bottomAnchor.constraint(equalTo: JuicoyInputVault.topAnchor),

            JuicoyEmptyNexus.centerXAnchor.constraint(equalTo: JuicoyBasePlate.centerXAnchor),
            JuicoyEmptyNexus.centerYAnchor.constraint(equalTo: JuicoyBasePlate.centerYAnchor),
            JuicoyEmptyNexus.widthAnchor.constraint(equalToConstant: 200),
            JuicoyEmptyNexus.heightAnchor.constraint(equalToConstant: 200),

            JuicoyInputVault.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyInputVault.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyInputVault.bottomAnchor.constraint(equalTo: JuicoyBasePlate.bottomAnchor),
            JuicoyInputVault.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        JuicoySetupEmptyVisuals()
        JuicoySetupInputVisuals()
    }

    private func JuicoySetupEmptyVisuals() {
        let JuicoyImg = UIImageView(image: UIImage(systemName: "bubble.left.and.bubble.right.fill"))
        JuicoyImg.tintColor = .systemPink.withAlphaComponent(0.3)
        JuicoyImg.contentMode = .scaleAspectFit
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        
        let JuicoyLab = UILabel()
        JuicoyLab.text = "No data"
        JuicoyLab.textColor = .lightGray
        JuicoyLab.font = .systemFont(ofSize: 14)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        
        JuicoyEmptyNexus.addSubview(JuicoyImg)
        JuicoyEmptyNexus.addSubview(JuicoyLab)
        
        NSLayoutConstraint.activate([
            JuicoyImg.centerXAnchor.constraint(equalTo: JuicoyEmptyNexus.centerXAnchor),
            JuicoyImg.centerYAnchor.constraint(equalTo: JuicoyEmptyNexus.centerYAnchor, constant: -20),
            JuicoyImg.widthAnchor.constraint(equalToConstant: 80),
            JuicoyImg.heightAnchor.constraint(equalToConstant: 80),
            JuicoyLab.topAnchor.constraint(equalTo: JuicoyImg.bottomAnchor, constant: 10),
            JuicoyLab.centerXAnchor.constraint(equalTo: JuicoyEmptyNexus.centerXAnchor)
        ])
    }

    private let JuicoyDraftingField: UITextField = {
            let JuicoyField = UITextField()
            JuicoyField.placeholder = "Say something~"
            JuicoyField.font = .systemFont(ofSize: 14)
            JuicoyField.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
            JuicoyField.layer.cornerRadius = 18
            let JuicoyPadding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 36))
            JuicoyField.leftView = JuicoyPadding
            JuicoyField.leftViewMode = .always
            JuicoyField.returnKeyType = .send
            JuicoyField.translatesAutoresizingMaskIntoConstraints = false
            return JuicoyField
        }()

        private let JuicoyVelocityEmit: UIButton = {
            let JuicoyBtn = UIButton(type: .system)
            JuicoyBtn.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
            JuicoyBtn.tintColor = .systemPink
            JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
            return JuicoyBtn
        }()

        private func JuicoySetupInputVisuals() {
            JuicoyInputVault.addSubview(JuicoyDraftingField)
            JuicoyInputVault.addSubview(JuicoyVelocityEmit)
            
            JuicoyDraftingField.delegate = self
            JuicoyVelocityEmit.addTarget(self, action: #selector(JuicoyExecuteSubmission), for: .touchUpInside)
            
            NSLayoutConstraint.activate([
                JuicoyDraftingField.leadingAnchor.constraint(equalTo: JuicoyInputVault.leadingAnchor, constant: 15),
                JuicoyDraftingField.centerYAnchor.constraint(equalTo: JuicoyInputVault.centerYAnchor, constant: -10),
                JuicoyDraftingField.heightAnchor.constraint(equalToConstant: 36),
                JuicoyDraftingField.trailingAnchor.constraint(equalTo: JuicoyVelocityEmit.leadingAnchor, constant: -10),
                
                JuicoyVelocityEmit.trailingAnchor.constraint(equalTo: JuicoyInputVault.trailingAnchor, constant: -15),
                JuicoyVelocityEmit.centerYAnchor.constraint(equalTo: JuicoyDraftingField.centerYAnchor),
                JuicoyVelocityEmit.widthAnchor.constraint(equalToConstant: 30),
                JuicoyVelocityEmit.heightAnchor.constraint(equalToConstant: 30)
            ])
        }

        @objc private func JuicoyExecuteSubmission() {
            guard let JuicoyText = JuicoyDraftingField.text, !JuicoyText.isEmpty else { return }
            
            JuicoyDraftingField.resignFirstResponder()
            JuicoyDraftingField.text = ""
            
            let JuicoyHaptic = UINotificationFeedbackGenerator()
            JuicoyHaptic.notificationOccurred(.success)
            
            let JuicoyNotice = UIAlertController(
                title: "Success",
                message: "Comment will be displayed after passing the audit",
                preferredStyle: .alert
            )
            JuicoyNotice.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(JuicoyNotice, animated: true)
        }

    private func JuicoyRefreshState() {
        let JuicoyCount = JuicoyTalkRegistry.count
        JuicoyHeaderLabel.text = "All Comments  \(JuicoyCount)"
        JuicoyEmptyNexus.isHidden = JuicoyCount > 0
        JuicoyTalkStream.isHidden = JuicoyCount == 0
    }

    @objc private func JuicoyDismissPanel() {
        self.dismiss(animated: true)
    }
}

extension JuicoyDialoguePanelController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JuicoyTalkRegistry.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let JuicoyCell = tableView.dequeueReusableCell(withIdentifier: "JuicoyTalk", for: indexPath) as! JuicoyTalkCell
        let JuicoyInfo = JuicoyTalkRegistry[indexPath.row]
        JuicoyCell.JuicoyPopulate(JuicoyInfo)
        return JuicoyCell
    }
}

class JuicoyTalkCell: UITableViewCell {
    private let JuicoyAvatar: UIView = {
        let JuicoyView = UIView()
        JuicoyView.backgroundColor = .systemGray5
        JuicoyView.layer.cornerRadius = 18
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    private let JuicoyName: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.font = .systemFont(ofSize: 14, weight: .medium)
        JuicoyLab.textColor = .darkGray
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private let JuicoyMessage: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.font = .systemFont(ofSize: 15)
        JuicoyLab.numberOfLines = 0
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private let JuicoyTiming: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.font = .systemFont(ofSize: 12)
        JuicoyLab.textColor = .lightGray
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(JuicoyAvatar)
        contentView.addSubview(JuicoyName)
        contentView.addSubview(JuicoyMessage)
        contentView.addSubview(JuicoyTiming)
        
        NSLayoutConstraint.activate([
            JuicoyAvatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            JuicoyAvatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            JuicoyAvatar.widthAnchor.constraint(equalToConstant: 36),
            JuicoyAvatar.heightAnchor.constraint(equalToConstant: 36),
            
            JuicoyName.leadingAnchor.constraint(equalTo: JuicoyAvatar.trailingAnchor, constant: 12),
            JuicoyName.topAnchor.constraint(equalTo: JuicoyAvatar.topAnchor),
            
            JuicoyMessage.leadingAnchor.constraint(equalTo: JuicoyName.leadingAnchor),
            JuicoyMessage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            JuicoyMessage.topAnchor.constraint(equalTo: JuicoyName.bottomAnchor, constant: 5),
            
            JuicoyTiming.leadingAnchor.constraint(equalTo: JuicoyName.leadingAnchor),
            JuicoyTiming.topAnchor.constraint(equalTo: JuicoyMessage.bottomAnchor, constant: 5),
            JuicoyTiming.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    required init?(coder: NSCoder) { fatalError() }

    func JuicoyPopulate(_ JuicoyData: [String: Any]) {
        JuicoyName.text = JuicoyData["JuicoyAuthor"] as? String
        JuicoyMessage.text = JuicoyData["JuicoyContent"] as? String
        JuicoyTiming.text = JuicoyData["JuicoyStamp"] as? String
    }
}
extension JuicoyDialoguePanelController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        JuicoyExecuteSubmission()
        return true
    }
}
