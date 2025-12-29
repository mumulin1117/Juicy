//
//  JuicoyBlockServiceController.swift
//  JuicoyZer
//
//  Created by mumu on 2025/12/29.
//

import UIKit

class JuicoyRestrictUserView: UIView {
    
    private let JuicoyContainerPlane: UIView = {
        let JuicoyView = UIView()
        JuicoyView.backgroundColor = .white
        JuicoyView.layer.cornerRadius = 24
        JuicoyView.clipsToBounds = true
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()
    
    private let JuicoyEmojiHeader: UIImageView = {
        let JuicoyLabel = UIImageView.init(image: UIImage.init(named: "closemonthe"))
  
        JuicoyLabel.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLabel
    }()
    
    private let JuicoyWarnMessage: UILabel = {
        let JuicoyLabel = UILabel()
        JuicoyLabel.text = "After blocking, you won't see this user's content."
        JuicoyLabel.font = .systemFont(ofSize: 17, weight: .bold)
        JuicoyLabel.textColor = .black
        JuicoyLabel.numberOfLines = 0
        JuicoyLabel.textAlignment = .center
        JuicoyLabel.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLabel
    }()
    
    private let JuicoyControlStack: UIStackView = {
        let JuicoyStack = UIStackView()
        JuicoyStack.axis = .horizontal
        JuicoyStack.distribution = .fillEqually
        JuicoyStack.spacing = 15
        JuicoyStack.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyStack
    }()
    
    private let JuicoySubmitTrigger: UIButton = {
        let JuicoyBtn = UIButton(type: .system)
        JuicoyBtn.setTitle("Block", for: .normal)
        JuicoyBtn.setTitleColor(.white, for: .normal)
        JuicoyBtn.backgroundColor = .black
        JuicoyBtn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        JuicoyBtn.layer.cornerRadius = 25
        return JuicoyBtn
    }()
    
    private let JuicoyDismissTrigger: UIButton = {
        let JuicoyBtn = UIButton(type: .system)
        JuicoyBtn.setTitle("Cancel", for: .normal)
        JuicoyBtn.setTitleColor(.gray, for: .normal)
        JuicoyBtn.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        JuicoyBtn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        JuicoyBtn.layer.cornerRadius = 25
        return JuicoyBtn
    }()
    
    var JuicoyOnCommit: (() -> Void)?
    var JuicoyOnCancel: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        JuicoyInitializeLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Juicoy Error")
    }
    
    private func JuicoyInitializeLayout() {
        backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        addSubview(JuicoyContainerPlane)
        JuicoyContainerPlane.addSubview(JuicoyEmojiHeader)
        JuicoyContainerPlane.addSubview(JuicoyWarnMessage)
        JuicoyContainerPlane.addSubview(JuicoyControlStack)
        
        JuicoyControlStack.addArrangedSubview(JuicoySubmitTrigger)
        JuicoyControlStack.addArrangedSubview(JuicoyDismissTrigger)
        
        NSLayoutConstraint.activate([
            JuicoyContainerPlane.centerXAnchor.constraint(equalTo: centerXAnchor),
            JuicoyContainerPlane.centerYAnchor.constraint(equalTo: centerYAnchor),
            JuicoyContainerPlane.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85),
            
            JuicoyEmojiHeader.topAnchor.constraint(equalTo: JuicoyContainerPlane.topAnchor, constant: -40),
            JuicoyEmojiHeader.centerXAnchor.constraint(equalTo: JuicoyContainerPlane.centerXAnchor),
            
            JuicoyWarnMessage.topAnchor.constraint(equalTo: JuicoyEmojiHeader.bottomAnchor, constant: 20),
            JuicoyWarnMessage.leadingAnchor.constraint(equalTo: JuicoyContainerPlane.leadingAnchor, constant: 30),
            JuicoyWarnMessage.trailingAnchor.constraint(equalTo: JuicoyContainerPlane.trailingAnchor, constant: -30),
            
            JuicoyControlStack.topAnchor.constraint(equalTo: JuicoyWarnMessage.bottomAnchor, constant: 30),
            JuicoyControlStack.leadingAnchor.constraint(equalTo: JuicoyContainerPlane.leadingAnchor, constant: 20),
            JuicoyControlStack.trailingAnchor.constraint(equalTo: JuicoyContainerPlane.trailingAnchor, constant: -20),
            JuicoyControlStack.bottomAnchor.constraint(equalTo: JuicoyContainerPlane.bottomAnchor, constant: -30),
            JuicoyControlStack.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        JuicoySubmitTrigger.addTarget(self, action: #selector(JuicoyHandleBlock), for: .touchUpInside)
        JuicoyDismissTrigger.addTarget(self, action: #selector(JuicoyHandleCancel), for: .touchUpInside)
    }
    
    @objc private func JuicoyHandleBlock() {
        JuicoyOnCommit?()
    }
    
    @objc private func JuicoyHandleCancel() {
        JuicoyOnCancel?()
    }
}

class JuicoyBlockServiceController: UIViewController {
    
    private let JuicoyOverlayView = JuicoyRestrictUserView()
    
    override func loadView() {
        view = JuicoyOverlayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JuicoySetupBindings()
    }
    
    private func JuicoySetupBindings() {
        JuicoyOverlayView.JuicoyOnCancel = { [weak self] in
            self?.JuicoyAnimateExit()
        }
        
        JuicoyOverlayView.JuicoyOnCommit = { [weak self] in
            self?.JuicoyExecuteBlockLogic()
        }
    }
    
    private func JuicoyExecuteBlockLogic() {
        let JuicoyIndicator = UIActivityIndicatorView(style: .large)
        JuicoyIndicator.center = view.center
        JuicoyIndicator.color = .black
        view.addSubview(JuicoyIndicator)
        JuicoyIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            JuicoyIndicator.stopAnimating()
            self.JuicoyAnimateExit()
            NotificationCenter.default.post(name: NSNotification.Name("JuicoyUserBlacklisted"), object: nil)
        }
    }
    
    private func JuicoyAnimateExit() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 0
        }) { _ in
            self.dismiss(animated: false)
        }
    }
    
    static func JuicoyShow(from JuicoyParent: UIViewController) {
        let JuicoyVC = JuicoyBlockServiceController()
        JuicoyVC.modalPresentationStyle = .overFullScreen
        JuicoyVC.modalTransitionStyle = .crossDissolve
        JuicoyParent.present(JuicoyVC, animated: true)
    }
}
