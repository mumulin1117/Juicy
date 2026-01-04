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
        JUICYbutton.setTitle("Decline", for: .normal)
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
            JUICYTitleHeader.text = "EULA"
            JUICYLegalBodyLabel.text = JUICYFetchEULAText()
        case .privacyPolicy:
            JUICYTitleHeader.text = "Privacy Policy"
            JUICYLegalBodyLabel.text = JUICYFetchPrivacyText()
            JUICYDeclineSpinButton.isHidden = true
            JUICYAcceptSpinButton.setImage(nil, for: .normal)
            JUICYAcceptSpinButton.setTitle("I Know", for: .normal)
            JUICYAcceptSpinButton.backgroundColor = UIColor.purple
            JUICYAcceptSpinButton.setTitleColor(.white, for: .normal)
            JUICYAcceptSpinButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            JUICYAcceptSpinButton.layer.cornerRadius = 28
        case .termsOfService:
            JUICYTitleHeader.text = "Terms of Service"
            JUICYLegalBodyLabel.text = JUICYFetchTermsText()
            JUICYDeclineSpinButton.isHidden = true
            JUICYAcceptSpinButton.setImage(nil, for: .normal)
            JUICYAcceptSpinButton.setTitle("I Know", for: .normal)
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
Effective Date: January 01, 2026

Contact: juicy@gmail.com

Welcome to Juicy, the active video community for pole dance artistry and movement. This EULA is a legal agreement between you and Juicy. By accessing our "open studio" environment, you agree to the following standards of conduct designed to keep our creative space safe and inspiring.

User Conduct & Movement Restrictions: Juicy is a space for artistry, drills, and technical progression. While we celebrate the human form in motion, we maintain a zero-tolerance policy for the following:

Harm to Minors: Any content involving the exploitation or harm of children is strictly prohibited and will be reported to authorities.

Explicit Material: While pole dance is expressive, Juicy is not a platform for pornography. Content must remain focused on the "artistry behind every spin and hold." Openly pornographic or sexually explicit content is forbidden.

Safety & Harassment: Bullying, stalking, or harassment during 1v1 video calls or in comment sections is prohibited. You may not use movement as a vehicle for violence or hate speech.

Misinformation: Posting false or harmful information regarding current events that disrupts the community harmony is prohibited.

Termination of Access: Juicy reserves the right, at its sole discretion, to terminate your account and license to use the app immediately if:

You violate any of the conduct restrictions listed above.

Our AI moderation or community flagging systems identify recurring patterns of "toxic" behavior.

You attempt to reverse-engineer the "AI Dancer" suggestions or scrap video content for unauthorized use. Upon termination, your "creative routines" and "training progress" data will be deleted, and you will be banned from future access. Movement is a language of respect; those who speak otherwise will be removed from the studio.
"""
    }
    
    private func JUICYFetchPrivacyText() -> String {
        return """
Privacy Policy
Effective Date: January 01, 2026

1. Data Collection: To facilitate the "alive and expressive" nature of Juicy, we collect:

Video Content: Clips you upload to your training highlights.

Real-time Interaction Data: Metadata from 1v1 video calls (we do not record the audio/video of private calls unless reported for a safety violation).

AI Training Data: Your interactions with the AI Dancer to improve drill suggestions.

2. How We Use Your Data: Your data is used to populate your feed with "new people" appearing naturally through shared content. We use your activity patterns to ensure that your "style ideas" remain relevant to your skill level and interests.

3. Third-Party Sharing: We do not sell your personal routines or contact information to advertisers. Data may be shared with service providers who assist in video hosting or AI processing, ensuring the "open studio" stays functional 24/7.

4. Your Rights: You have the right to delete your account at any time. Doing so will remove your profile from the community feed and disconnect your message history. For data portability requests regarding your "practice highlights," contact juicy@gmail.com.

5. Security: We implement industry-standard encryption for all 1v1 video calls to protect your "closer look" conversations from unauthorized interception.
"""
    }
    
    private func JUICYFetchTermsText() -> String {
        return """
Terms of Service (ToS)
Effective Date: January 01, 2026

1. Service Description: Juicy provides a real-time video community where users can share clips, engage in 1v1 video calls, and interact with an AI Dancer. By using the "quick switch" to open video calls, you acknowledge that you are interacting with real people in real-time.

2. Content Ownership & License: You retain ownership of the videos you record. However, by posting highlights or routines, you grant Juicy a worldwide, royalty-free license to host, store, and display your movement clips to other users within the feed to "spark inspiration." This allows the community to see the "artistry behind every spin."

3. AI Interactions: The "AI Dancer" provides drill suggestions and style ideas based on community trends. These are for informational purposes only. You are responsible for your own physical safety while performing any drills or holds suggested. Always ensure your equipment is secure before attempting a new spin.

4. User Accountability: You are responsible for maintaining the confidentiality of your login credentials. Any activity originating from your account—whether in the feed or during a 1v1 call—is your legal responsibility.

5. Dispute Resolution: Any disputes arising from the use of Juicy will be governed by the laws of the jurisdiction in which the company is registered, focusing first on mediation to resolve creative or community-based conflicts.
"""
        
    }
    
    //拒绝
    @objc func juicoyMotionIntent()  {
        JUICYLegalAgreementViewController.JUICYAIFAgree = false
        self.dismiss(animated: true)
    }
    
    //同意
    @objc func juicoyCreativeSignature()  {
        
        if JUICYActiveType == .eula {
            JUICYLegalAgreementViewController.JUICYAIFAgree = true
        }
        
        self.dismiss(animated: true)
    }
    
    
    @objc func juicoyStyleIdentity()  {
        
    }
    
}
