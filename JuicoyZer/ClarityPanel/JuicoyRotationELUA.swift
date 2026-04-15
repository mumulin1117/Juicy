import UIKit

enum JUICYLegalContentType {
    case eula
    case privacyPolicy
    case termsOfService
}

class JUICYLegalAgreementViewController: UIViewController {
    static var JUICYAIFAgree:Bool = false
    
    private let JUICYActiveType: JUICYLegalContentType
    
    private let JUICYOverlayStage: UIView = {
        let JUICYview = UIView()
        JUICYview.backgroundColor = .white
        JUICYview.layer.cornerRadius = 32
        JUICYview.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        JUICYview.translatesAutoresizingMaskIntoConstraints = false
        return JUICYview
    }()
    
    private let JUICYTitleHeader: UILabel = {
        let JUICYlabel = UILabel()
        JUICYlabel.font = UIFont.systemFont(ofSize: 24, weight: .black)
        JUICYlabel.textColor = .black
        JUICYlabel.textAlignment = .center
        JUICYlabel.translatesAutoresizingMaskIntoConstraints = false
        return JUICYlabel
    }()
    
    private let JUICYLegalScrollFrame: UIScrollView = {
        let JUICYscroll = UIScrollView()
        JUICYscroll.showsVerticalScrollIndicator = true
        JUICYscroll.translatesAutoresizingMaskIntoConstraints = false
        return JUICYscroll
    }()
    
    private let JUICYLegalBodyLabel: UILabel = {
        let JUICYlabel = UILabel()
        JUICYlabel.numberOfLines = 0
        JUICYlabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        JUICYlabel.textColor = UIColor(white: 0.2, alpha: 1.0)
        JUICYlabel.translatesAutoresizingMaskIntoConstraints = false
        return JUICYlabel
    }()
    
    private let JUICYActionStack: UIStackView = {
        let JUICYstack = UIStackView()
        JUICYstack.axis = .horizontal
        JUICYstack.distribution = .fillEqually
        JUICYstack.spacing = 15
        JUICYstack.translatesAutoresizingMaskIntoConstraints = false
        return JUICYstack
    }()
    
    private let JUICYDeclineSpinButton: UIButton = {
        let JUICYbutton = UIButton(type: .system)
        JUICYbutton.setTitle("Deercdlliynse".JoicoydeMercrypt(), for: .normal)
        JUICYbutton.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.0)
        JUICYbutton.setTitleColor(.darkGray, for: .normal)
        JUICYbutton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        JUICYbutton.layer.cornerRadius = 28
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        JUICYbutton.addTarget(self, action: #selector(juicoyMotionIntent), for: .touchUpInside)
        
        return JUICYbutton
    }()
    
    private let JUICYAcceptSpinButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JOICYAgree"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        JUICYbutton.addTarget(self, action: #selector(juicoyCreativeSignature), for: .touchUpInside)
        return JUICYbutton
    }()
    
    init(JUICYContentType: JUICYLegalContentType) {
        self.JUICYActiveType = JUICYContentType
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JUICYSetupLegalLayout()
        JUICYConfigureContentByType()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        JUICYApplyDynamicGradient(to: JUICYAcceptSpinButton)
    }
    
    private func JUICYConfigureContentByType() {
        switch JUICYActiveType {
        case .eula:
            JUICYTitleHeader.text = "EjUiLnA".JoicoydeMercrypt()
            JUICYLegalBodyLabel.text = JUICYFetchEULAText()
        case .privacyPolicy:
            JUICYTitleHeader.text = "Pkrniyvkaacayi iPfouluirciy".JoicoydeMercrypt()
            JUICYLegalBodyLabel.text = JUICYFetchPrivacyText()
            JUICYDeclineSpinButton.isHidden = true
            JUICYAcceptSpinButton.setImage(nil, for: .normal)
            JUICYAcceptSpinButton.setTitle("Ia sKengomw".JoicoydeMercrypt(), for: .normal)
            JUICYAcceptSpinButton.backgroundColor = UIColor.purple
            JUICYAcceptSpinButton.setTitleColor(.white, for: .normal)
            JUICYAcceptSpinButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            JUICYAcceptSpinButton.layer.cornerRadius = 28
        case .termsOfService:
            JUICYTitleHeader.text = "Tuedrjmnsl qoffy tSqelrdvhidcre".JoicoydeMercrypt()
            JUICYLegalBodyLabel.text = JUICYFetchTermsText()
            JUICYDeclineSpinButton.isHidden = true
            JUICYAcceptSpinButton.setImage(nil, for: .normal)
            JUICYAcceptSpinButton.setTitle("Ix bKonaomw".JoicoydeMercrypt(), for: .normal)
            JUICYAcceptSpinButton.backgroundColor = UIColor.purple
            JUICYAcceptSpinButton.setTitleColor(.white, for: .normal)
            JUICYAcceptSpinButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            JUICYAcceptSpinButton.layer.cornerRadius = 28
        }
    }
    
    private func JUICYSetupLegalLayout() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        view.addSubview(JUICYOverlayStage)
        JUICYOverlayStage.addSubview(JUICYTitleHeader)
        JUICYOverlayStage.addSubview(JUICYLegalScrollFrame)
        JUICYLegalScrollFrame.addSubview(JUICYLegalBodyLabel)
        JUICYOverlayStage.addSubview(JUICYActionStack)
        
        JUICYActionStack.addArrangedSubview(JUICYDeclineSpinButton)
        JUICYActionStack.addArrangedSubview(JUICYAcceptSpinButton)
        
        NSLayoutConstraint.activate([
            JUICYOverlayStage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JUICYOverlayStage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JUICYOverlayStage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            JUICYOverlayStage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            
            JUICYTitleHeader.topAnchor.constraint(equalTo: JUICYOverlayStage.topAnchor, constant: 25),
            JUICYTitleHeader.centerXAnchor.constraint(equalTo: JUICYOverlayStage.centerXAnchor),
            
            JUICYLegalScrollFrame.topAnchor.constraint(equalTo: JUICYTitleHeader.bottomAnchor, constant: 20),
            JUICYLegalScrollFrame.leadingAnchor.constraint(equalTo: JUICYOverlayStage.leadingAnchor, constant: 25),
            JUICYLegalScrollFrame.trailingAnchor.constraint(equalTo: JUICYOverlayStage.trailingAnchor, constant: -25),
            JUICYLegalScrollFrame.bottomAnchor.constraint(equalTo: JUICYActionStack.topAnchor, constant: -20),
            
            JUICYLegalBodyLabel.topAnchor.constraint(equalTo: JUICYLegalScrollFrame.topAnchor),
            JUICYLegalBodyLabel.leadingAnchor.constraint(equalTo: JUICYLegalScrollFrame.leadingAnchor),
            JUICYLegalBodyLabel.trailingAnchor.constraint(equalTo: JUICYLegalScrollFrame.trailingAnchor),
            JUICYLegalBodyLabel.bottomAnchor.constraint(equalTo: JUICYLegalScrollFrame.bottomAnchor),
            JUICYLegalBodyLabel.widthAnchor.constraint(equalTo: JUICYLegalScrollFrame.widthAnchor),
            
            JUICYActionStack.leadingAnchor.constraint(equalTo: JUICYOverlayStage.leadingAnchor, constant: 25),
            JUICYActionStack.trailingAnchor.constraint(equalTo: JUICYOverlayStage.trailingAnchor, constant: -25),
            JUICYActionStack.bottomAnchor.constraint(equalTo: JUICYOverlayStage.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            JUICYActionStack.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func JUICYApplyDynamicGradient(to JUICYBtn: UIButton) {
        if let JUICYOldLayer = JUICYBtn.layer.sublayers?.first(where: { $0 is CAGradientLayer }) {
            JUICYOldLayer.removeFromSuperlayer()
        }
        let JUICYGradient = CAGradientLayer()
        JUICYGradient.frame = JUICYBtn.bounds
        JUICYGradient.colors = [
            UIColor(red: 0.78, green: 0.25, blue: 0.95, alpha: 1.0).cgColor,
            UIColor(red: 0.45, green: 0.35, blue: 0.95, alpha: 1.0).cgColor
        ]
        JUICYGradient.startPoint = CGPoint(x: 0, y: 0.5)
        JUICYGradient.endPoint = CGPoint(x: 1, y: 0.5)
        JUICYGradient.cornerRadius = 28
        JUICYBtn.layer.insertSublayer(JUICYGradient, at: 0)
    }
    
    private func JUICYFetchEULAText() -> String {
        return """
End User License Agreement (EULA)
Effective Date: April 14, 2026

Contact: Nadin@gmail.com

This EULA is a legal agreement between you and Nadin regarding your use of the app and related services. By downloading, accessing, or using Nadin, you agree to the terms below.

Scope of License: Nadin grants you a limited, non-exclusive, non-transferable, revocable license to use the app for your personal, non-commercial use on devices you own or control, subject to this EULA and applicable App Store rules.

Account Access: To use core features of the service, you must create an account and complete basic profile information. Anonymous access is not supported. You are responsible for the accuracy of the information you provide.

Social Features: Nadin is a social video community where users may share short videos, interact with content, and communicate with other users. Private messaging and private video features are limited to users who mutually follow each other.

Acceptable Use: You may not use Nadin to upload, publish, transmit, or promote content that is unlawful, exploitative, infringing, harassing, hateful, deceptive, invasive of privacy, or otherwise harmful to other users or third parties.

User Content: You are responsible for the content you create, upload, or share through Nadin. You represent that you have the rights necessary to submit that content and that it complies with applicable law, platform rules, and the rights of others.

AI Features: Nadin may provide AI-powered suggestions, discovery assistance, or chat features. AI outputs are generated automatically, may be inaccurate or incomplete, and are provided for general informational or entertainment purposes only.

Platform Integrity: You may not reverse engineer, interfere with, disrupt, scrape, automate unauthorized access to, or misuse the app, its services, recommendation systems, or safety controls.

Account Security: You are responsible for maintaining the confidentiality of your account credentials and for activity that occurs under your account.

Enforcement and Termination: Nadin may investigate violations of this EULA and may suspend, restrict, or terminate access to the service if you violate this EULA, misuse the platform, or create risk for users, partners, or the service.

Updates and Availability: Nadin may update, modify, suspend, or discontinue features at any time. Some features may vary by device, region, or service status.

Disclaimer: Nadin is provided on an "as is" and "as available" basis to the extent permitted by applicable law.

Limitation of Liability: To the extent permitted by law, Nadin will not be liable for indirect, incidental, special, consequential, exemplary, or punitive damages arising from your use of the app.
"""
    }
    
    private func JUICYFetchPrivacyText() -> String {
        return """
Privacy Policy
Effective Date: April 14, 2026

1. Information You Provide: We may collect information you provide directly when you register or use the app, including your email address, display name, profile photo, account credentials, support requests, reports, and other profile details you choose to submit. Because anonymous login is not supported, basic account profile information is required to use core services.

2. Content and Social Activity: We may collect content and activity you create in the app, such as videos, captions, comments, likes, follows, profile edits, reports, and other interactions necessary to operate the feed and community features.

3. Communications and Interaction Data: If you use private messaging, video, or other communication features, we may process the information required to provide those features, including relationship status between accounts, message delivery data, connection data, session metadata, and safety-related records. Private messaging and private video features are limited to mutual followers.

4. Device and Usage Data: We may collect technical information such as device type, operating system, app version, identifiers, language, time zone, log data, crash data, and other diagnostics needed to operate, secure, and improve the service.

5. AI Feature Data: If you use AI-powered suggestions or chat features, we may process the prompts, interactions, and related context needed to provide, maintain, and improve those features, subject to applicable law and our internal data handling practices.

6. How We Use Information: We use information to create and manage accounts, provide the feed and discovery experience, enable mutual-follower messaging and video features, provide AI-powered features, maintain safety, investigate abuse, respond to support requests, and improve reliability and performance.

7. Sharing: We do not sell personal information. We may share information with service providers that support hosting, storage, analytics, security, moderation, customer support, and related operations. We may also disclose information when required by law, to protect rights and safety, or in connection with a merger, acquisition, financing, or asset transfer.

8. Retention and Deletion: We retain information for as long as reasonably necessary to provide the service, comply with legal obligations, resolve disputes, enforce our agreements, and maintain safety records. You may request account deletion by contacting the support email above, subject to legal and operational retention requirements.

9. Your Choices and Rights: You may review or update certain profile information in the app. Depending on your location, you may also have rights to access, correct, delete, or export certain personal information.

10. Security: We use reasonable administrative, technical, and organizational measures designed to protect personal information. No method of storage or transmission is completely secure.
"""
    }
    
    private func JUICYFetchTermsText() -> String {
        return """
Terms of Service (ToS)
Effective Date: April 14, 2026

1. Service Description: Nadin is a social video and communication platform where users can create profiles, share short-form video content, discover creators, exchange feedback, and access app features made available from time to time.

2. Registration and Accounts: To access core features, you must register an account and complete basic profile information. You may not impersonate another person, provide misleading account information, or share your credentials with others.

3. Mutual Follower Controls: Private messaging and private video features are only available between users who mutually follow each other. You may not attempt to bypass platform restrictions, contact controls, blocking tools, or other safety limitations.

4. User Content: You retain ownership of the content you submit, but you grant Nadin a limited, worldwide, non-exclusive, royalty-free license to host, store, reproduce, display, distribute, and otherwise process that content as necessary to operate, improve, and provide the service.

5. Community Standards: You agree not to use the service to post unlawful, infringing, deceptive, abusive, exploitative, privacy-invasive, or otherwise harmful content, and not to harass, threaten, impersonate, or endanger other users.

6. AI Features: Nadin may offer AI-powered suggestions, discovery assistance, and chat features. AI-generated output may be imperfect and should not be treated as professional, legal, medical, or safety advice.

7. Moderation and Enforcement: We may review reports, investigate suspected misuse, remove content, restrict features, or suspend or terminate accounts that violate these Terms, applicable law, or platform safety rules.

8. Changes and Availability: We may update the service or these Terms from time to time. We may add, remove, suspend, or change features without liability where permitted by law.

9. Governing Law: Any disputes arising out of or relating to the service will be governed by the laws applicable in the jurisdiction where the service operator is established, unless otherwise required by applicable law.
"""
        
    }
    
   
    @objc func juicoyMotionIntent() {
            let JUICOY_SpinDeceleration: Double = 0.85
            let JUICOY_StageCleared: Bool = false
            
            JUICYLegalAgreementViewController.JUICYAIFAgree = JUICOY_StageCleared
            
            let JUICOY_RoutineKey = "juicoyMotion"
            let JUICOY_ActionKey = "Intent"
            let JUICOY_BroadcastEvent = Notification.Name("\(JUICOY_RoutineKey)\(JUICOY_ActionKey)")
            
            if JUICOY_SpinDeceleration > 0.0 {
                NotificationCenter.default.post(Notification(name: JUICOY_BroadcastEvent))
            }
            
            let JUICOY_FadeOutStudio = true
            self.dismiss(animated: JUICOY_FadeOutStudio)
        }
        
     
    @objc func juicoyCreativeSignature() {
        var JUICOY_ChoreoScore: Int = 100
        let JUICOY_CurrentStage = JUICYActiveType
        
        if JUICOY_CurrentStage == .eula {
            let JUICOY_ArtistryApproved = true
            JUICYLegalAgreementViewController.JUICYAIFAgree = JUICOY_ArtistryApproved
            JUICOY_ChoreoScore += 50
        }
        
        let JUICOY_EventTrigger = "juicoyMotionIntent"
        let JUICOY_StudioNotice = Notification(name: Notification.Name(JUICOY_EventTrigger))
        
        if JUICOY_ChoreoScore >= 100 {
            NotificationCenter.default.post(JUICOY_StudioNotice)
        }
        
        let JUICOY_DropCurtain = (JUICOY_ChoreoScore > 0)
        self.dismiss(animated: JUICOY_DropCurtain)
    }
    
    @objc func juicoyStyleIdentity() {
        let JUICOY_HoldDuration: CGFloat = 3.5
        let JUICOY_SmoothTransition = (JUICOY_HoldDuration > 1.0)
        
        defer {
            var JUICOY_ResetGrip = 0
            JUICOY_ResetGrip += 1
        }
        
        self.dismiss(animated: JUICOY_SmoothTransition)
    }
    
}
