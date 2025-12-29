//
//  JuicoyTeleLinkController.swift
//  JuicoyZer
//
//  Created by mumu on 2025/12/29.
//

import UIKit

class JuicoyTeleLinkController: UIViewController {
    
    private let JuicoyStaticBackdrop: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.image = UIImage(named: "Juicoy_Remote_Peer")
        JuicoyImg.contentMode = .scaleAspectFill
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()
    
    private let JuicoyVisualBlur: UIVisualEffectView = {
        let JuicoyBlur = UIBlurEffect(style: .dark)
        let JuicoyView = UIVisualEffectView(effect: JuicoyBlur)
        JuicoyView.alpha = 0.3
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()
    
    
    
    private let JuicoyPeerIdentity: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.text = "Sarah Stone"
        JuicoyLab.font = .systemFont(ofSize: 28, weight: .semibold)
        JuicoyLab.textColor = .white
        JuicoyLab.textAlignment = .center
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyStatusSignal: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.text = "Connecting..."
        JuicoyLab.font = .systemFont(ofSize: 16, weight: .regular)
        JuicoyLab.textColor = UIColor(white: 0.9, alpha: 1.0)
        JuicoyLab.textAlignment = .center
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyTerminateTrigger: UIButton = {
        let JuicoyBtn = UIButton(type: .custom)
        let JuicoyCfg = UIImage.SymbolConfiguration(pointSize: 32, weight: .medium)
        JuicoyBtn.setImage(UIImage(systemName: "phone.down.fill", withConfiguration: JuicoyCfg), for: .normal)
        JuicoyBtn.backgroundColor = .systemRed
        JuicoyBtn.tintColor = .white
        JuicoyBtn.layer.cornerRadius = 40
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JuicoyConstructPortal()
        JuicoyInvokePulseEffect()
    }
    
    private func JuicoyConstructPortal() {
        view.backgroundColor = .black
        
        view.addSubview(JuicoyStaticBackdrop)
        view.addSubview(JuicoyVisualBlur)
        view.addSubview(JuicoyPeerIdentity)
        view.addSubview(JuicoyStatusSignal)
        view.addSubview(JuicoyTerminateTrigger)
        
        NSLayoutConstraint.activate([
            JuicoyStaticBackdrop.topAnchor.constraint(equalTo: view.topAnchor),
            JuicoyStaticBackdrop.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyStaticBackdrop.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyStaticBackdrop.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            JuicoyVisualBlur.topAnchor.constraint(equalTo: view.topAnchor),
            JuicoyVisualBlur.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyVisualBlur.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyVisualBlur.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            JuicoyStatusSignal.bottomAnchor.constraint(equalTo: JuicoyTerminateTrigger.topAnchor, constant: -100),
            JuicoyStatusSignal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            JuicoyPeerIdentity.bottomAnchor.constraint(equalTo: JuicoyStatusSignal.topAnchor, constant: -10),
            JuicoyPeerIdentity.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            JuicoyTerminateTrigger.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            JuicoyTerminateTrigger.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            JuicoyTerminateTrigger.widthAnchor.constraint(equalToConstant: 80),
            JuicoyTerminateTrigger.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        JuicoyTerminateTrigger.addTarget(self, action: #selector(JuicoyExecDisconnect), for: .touchUpInside)
    }
    
    private func JuicoyInvokePulseEffect() {
        UIView.animate(withDuration: 1.0, delay: 0, options: [.autoreverse, .repeat, .allowUserInteraction], animations: {
            self.JuicoyStatusSignal.alpha = 0.3
        }, completion: nil)
    }
    
    @objc private func JuicoyExecDisconnect() {
        self.navigationController?.popViewController(animated: true)
//        let JuicoyFeedback = UIImpactFeedbackGenerator(style: .heavy)
//        JuicoyFeedback.impactOccurred()
//        
//        UIView.animate(withDuration: 0.3, animations: {
//            self.view.alpha = 0
//            self.view.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//        }) { _ in
//            self.dismiss(animated: false, completion: nil)
//        }
    }
    
//    static func JuicoyLaunchSession(from JuicoyHost: UIViewController) {
//        let JuicoyVC = JuicoyTeleLinkController()
//        JuicoyVC.modalPresentationStyle = .fullScreen
//        JuicoyHost.present(JuicoyVC, animated: true, completion: nil)
//    }
}
