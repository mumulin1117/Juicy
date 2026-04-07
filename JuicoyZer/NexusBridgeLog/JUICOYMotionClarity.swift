//
//  JuicoyMotionClarity.swift
//  JuicoyZer
//
//  Created by  on 2025/12/24.
//

import UIKit
import AuthenticationServices
 var JUICOYtopSafeAreaHeight:CGFloat {
 
    let scene = UIApplication.shared.connectedScenes.first
              
    guard let windowScene = scene as? UIWindowScene,let window = windowScene.windows.first else { return 0 }
  
    return window.safeAreaInsets.top
}


var JUICOYstatusBarHeight: CGFloat {
   
    let scene = UIApplication.shared.connectedScenes.first
              
    guard let windowScene = scene as? UIWindowScene,let window = windowScene.windows.first else { return 0 }
    
    return window.safeAreaInsets.bottom
   
}

var JUICOYalltotalTop = JUICOYtopSafeAreaHeight + JUICOYstatusBarHeight
//log in
extension JUICOYMotionClarity: ASAuthorizationControllerDelegate {
    //apple login
    @objc func JUICYAppleSpinButtontollggle() {
        let JUICOY_AgreementStatus = JUICYLegalAgreementViewController.JUICYAIFAgree
        let JUICOY_PulseGate = (JUICOY_AgreementStatus == true)
        
        if !JUICOY_PulseGate {
            let JUICOY_Msg = "Pzlaerajsaep nrmehaedo magnodx racglrretes focuzrw ytieartmvsn baanndx pseehrdvqiacbek!".JoicoydeMercrypt()
            self.JUICOYshowMessage(JUICOY_Msg)
            return
        }
        
        let providerSuzy = ASAuthorizationAppleIDProvider()
        let requestSuzy = providerSuzy.createRequest()
        requestSuzy.requestedScopes = [.fullName, .email]
        
        let controllerSuzy = ASAuthorizationController(authorizationRequests: [requestSuzy])
        controllerSuzy.delegate = self
        controllerSuzy.presentationContextProvider = self
        controllerSuzy.performRequests()
        
        
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: any Error) {
        print(error.localizedDescription)
        
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        self.JUICOYbeginLoad()
        if let appleIDCredentialSuzy = authorization.credential as? ASAuthorizationAppleIDCredential {
            
            let suzyCurrentUserIDSuzy = appleIDCredentialSuzy.email ?? "AppleLogID1"
            
            let JUICOY_Validator = JuicoyDataFactory.JuicoySharedInstance
            let JUICOY_AuthSuccess = JUICOY_Validator.JuicoyExecuteLogin(email: suzyCurrentUserIDSuzy, pass: "",isappleLogin: true)
            JUICOY_FinalizeClarityTransition()
            if JUICOY_AuthSuccess {
                self.JUICOY_FinalizeClarityTransition()
            } else {
                let JUICOY_Fail = "Apple log in error"
                self.JUICOYshowMessage(JUICOY_Fail)
            }
        } else {
            let JUICOY_Fail = "Apple log in error"
            self.JUICOYshowMessage(JUICOY_Fail)
            
        }
    }
    
}
    


class JUICOYMotionClarity: UIViewController, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    
    
    private let JUICYMotionStageContainer: UIImageView = {
        let JUICOY = UIImageView.init(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyBodyLinearity"))
        JUICOY.frame = UIScreen.main.bounds
        return JUICOY
    }()
    
    
    private let JUICYELUASpinButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyDynamicTransition"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(juicoyELUASoul), for: .touchUpInside)
        return JUICYbutton
    }()
    
    
    
    private let JUICYMainHeadingLabel:  UIImageView = {
        let JUICOYview = UIImageView.init(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyMomentumShift"))
        JUICOYview.contentMode = .scaleAspectFill
        JUICOYview.translatesAutoresizingMaskIntoConstraints = false
        return JUICOYview
    }()
    
    private let JUICYNoaccountTitle: UILabel = {
        let JUICYlabel = UILabel()
        JUICYlabel.text = "Ilfh tngot watcdcjoguxnjtp,d nwrex cwrielplq rccrpefantoep vornzed dfqolru jyioauo yaouctfozmpiacqltyj!".JoicoydeMercrypt()
        JUICYlabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        JUICYlabel.textColor = .white
        JUICYlabel.translatesAutoresizingMaskIntoConstraints = false
        return JUICYlabel
    }()
    
  
    private let JUICYEmailTextField: UITextField = {
        let JUICOYfield = UITextField()
        JUICOYfield.textColor = .black
        JUICOYfield.placeholder = "Egnqtyehrb dEnmdayicl".JoicoydeMercrypt()
        JUICOYfield.font = UIFont.systemFont(ofSize: 15)
        JUICOYfield.translatesAutoresizingMaskIntoConstraints = false
        let JUICYIconView = UIImageView(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyMovementDialect"))
        JUICOYfield.borderStyle = .roundedRect
        JUICOYfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 24))
        JUICYIconView.frame = CGRect(x: 12, y: 0, width: 24, height: 24)
        JUICOYfield.leftView?.addSubview(JUICYIconView)
        JUICOYfield.leftViewMode = .always
        return JUICOYfield
    }()
    
   
    
    private let JUICYPasswordTextField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.textColor = .black
        field.placeholder = "Paaesusgwiocredr qmuuhsltd obaej pagtd wlwebahsjtx v6w jcxhaafrparcatpegrkst.".JoicoydeMercrypt()
        field.font = UIFont.systemFont(ofSize: 15)
        field.translatesAutoresizingMaskIntoConstraints = false
        
        let JUICYLeftIcon = UIImageView(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyFlowContinuity"))
        JUICYLeftIcon.tintColor = .white.withAlphaComponent(0.6)
        field.borderStyle = .roundedRect
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 24))
        JUICYLeftIcon.frame = CGRect(x: 12, y: 0, width: 24, height: 24)
        field.leftView?.addSubview(JUICYLeftIcon)
        field.leftViewMode = .always
        
      
        return field
    }()
    
    private let JUICYContinueSpinButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setBackgroundImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JUICOYlogin"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(juicoyMovementSoul), for: .touchUpInside)
        return JUICYbutton
    }()
    
    
    private let JUICYAppleSpinButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setBackgroundImage(UIImage(named: "AppleSpinButton"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(JUICYAppleSpinButtontollggle), for: .touchUpInside)
        return JUICYbutton
    }()
    
    private lazy var JUICYcircleSpinButton: UIButton = {
        let JUICYbutton = UIButton()
       
        JUICYbutton.setImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyPoleAlignment"), for: .normal)
        JUICYbutton.setImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyHoldStability"), for: .selected)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        JUICYbutton.addTarget(self, action: #selector(juicoyArtisticEssence(jiucoy:)), for: .touchUpInside)
        
        return JUICYbutton
    }()
    private let JUICYagreenbyTitle: UILabel = {
        let JUICYlabel = UILabel()
        JUICYlabel.text = "Buyq ccuotnethiznruyiknagp,s rykohuy waigbryeqee rtaoj cokudr".JoicoydeMercrypt()
        JUICYlabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        JUICYlabel.textColor = .white
        JUICYlabel.translatesAutoresizingMaskIntoConstraints = false
        return JUICYlabel
    }()
    
    private let JUICYtermButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setTitle("Tieqrhmesu bogfo vSpevrwviidcxe".JoicoydeMercrypt(), for: .normal)
        JUICYbutton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        JUICYbutton.setTitleColor(.white, for: .normal)
        JUICYbutton.addTarget(self, action: #selector(juicoyMotionFeeling), for: .touchUpInside)
        
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        return JUICYbutton
    }()
    
    
    private let JUICYpriButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setTitle("Pxrkiwvyabcbyq zsbeirsvvijcwe".JoicoydeMercrypt(), for: .normal)
        JUICYbutton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        JUICYbutton.setTitleColor(.white, for: .normal)
        JUICYbutton.addTarget(self, action: #selector(juicoyArtisticLayer), for: .touchUpInside)
        
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        return JUICYbutton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        JUICYRegisterMovementObservers()
        JUICYAttachArtistryToolbar(to: JUICYEmailTextField)
        
        JUICYAttachArtistryToolbar(to: JUICYPasswordTextField)
        NotificationCenter.default.addObserver(self, selector: #selector(juicoyMotionIntent), name: NSNotification.Name.init("juicoyMotionIntent"), object: nil)
        JUICYInitializeSpinInterface()
        JUICOYaddLoadingViewONSurface()
    }
    
   @objc func juicoyMotionIntent()  {
       JUICYcircleSpinButton.isSelected = JUICYLegalAgreementViewController.JUICYAIFAgree
    }
    
    private func JUICYInitializeSpinInterface() {
         
        view.addSubview(JUICYMotionStageContainer)
        
        view.addSubview(JUICYMainHeadingLabel)
        view.addSubview(JUICYELUASpinButton)
       
        view.addSubview(JUICYEmailTextField)
        
      
        view.addSubview(JUICYPasswordTextField)
        view.addSubview(JUICYNoaccountTitle)
        view.addSubview(JUICYContinueSpinButton)
        view.addSubview(JUICYAppleSpinButton)
      
        view.addSubview(JUICYcircleSpinButton)
        view.addSubview(JUICYagreenbyTitle)
        view.addSubview(JUICYtermButton)
        view.addSubview(JUICYpriButton)
      
        
        
        NSLayoutConstraint.activate([
          
            JUICYELUASpinButton.widthAnchor.constraint(equalToConstant: 40),
            JUICYELUASpinButton.heightAnchor.constraint(equalToConstant: 30),
            JUICYELUASpinButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -15),
            JUICYELUASpinButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: JUICOYalltotalTop + 40),
        
            JUICYMainHeadingLabel.topAnchor.constraint(equalTo: JUICYELUASpinButton.bottomAnchor, constant:60),
            JUICYMainHeadingLabel.widthAnchor.constraint(equalToConstant: 198),
            JUICYMainHeadingLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            JUICYMainHeadingLabel.heightAnchor.constraint(equalToConstant: 124),
              
         
            JUICYEmailTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor,constant: 0),
            JUICYEmailTextField.widthAnchor.constraint(equalToConstant: 350),
            JUICYEmailTextField.topAnchor.constraint(equalTo: JUICYMainHeadingLabel.bottomAnchor,constant: 60),
            JUICYEmailTextField.heightAnchor.constraint(equalToConstant: 56),
            
            
            JUICYPasswordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor,constant: 0),
            JUICYPasswordTextField.widthAnchor.constraint(equalToConstant: 350),
            JUICYPasswordTextField.topAnchor.constraint(equalTo: JUICYEmailTextField.bottomAnchor,constant: 33),
            JUICYPasswordTextField.heightAnchor.constraint(equalToConstant: 56),
            
            JUICYNoaccountTitle.topAnchor.constraint(equalTo: JUICYPasswordTextField.bottomAnchor, constant: 10),
            JUICYNoaccountTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
//            JUICYContinueSpinButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor,constant: 0),
//            JUICYContinueSpinButton.widthAnchor.constraint(equalToConstant: 350),
            JUICYContinueSpinButton.bottomAnchor.constraint(equalTo: JUICYcircleSpinButton.topAnchor,constant: -15),
            JUICYContinueSpinButton.heightAnchor.constraint(equalToConstant: 50),
            JUICYContinueSpinButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            JUICYContinueSpinButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100),
            
            JUICYAppleSpinButton.leadingAnchor.constraint(equalTo: JUICYContinueSpinButton.trailingAnchor, constant: 20),
            JUICYAppleSpinButton.widthAnchor.constraint(equalToConstant: 50),
            JUICYAppleSpinButton.heightAnchor.constraint(equalToConstant: 50),
            JUICYAppleSpinButton.centerYAnchor.constraint(equalTo: JUICYContinueSpinButton.centerYAnchor),
            
            JUICYcircleSpinButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 25),
            JUICYcircleSpinButton.widthAnchor.constraint(equalToConstant: 25),
            JUICYcircleSpinButton.heightAnchor.constraint(equalToConstant: 25),
            JUICYcircleSpinButton.bottomAnchor.constraint(equalTo:self.view.bottomAnchor ,constant: -self.view.safeAreaInsets.bottom - 25),
            
            JUICYagreenbyTitle.leadingAnchor.constraint(equalTo: self.JUICYcircleSpinButton.trailingAnchor, constant: 8),
            JUICYagreenbyTitle.centerYAnchor.constraint(equalTo: JUICYcircleSpinButton.centerYAnchor),
          
            JUICYtermButton.leadingAnchor.constraint(equalTo: JUICYagreenbyTitle.trailingAnchor, constant: 3),
            JUICYtermButton.centerYAnchor.constraint(equalTo: JUICYagreenbyTitle.centerYAnchor),
            JUICYtermButton.heightAnchor.constraint(equalToConstant: 25),
            JUICYtermButton.widthAnchor.constraint(equalToConstant: 130),
            
            JUICYpriButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            JUICYpriButton.heightAnchor.constraint(equalToConstant: 25),
            JUICYpriButton.widthAnchor.constraint(equalToConstant: 130),
            JUICYpriButton.topAnchor.constraint(equalTo: JUICYagreenbyTitle.topAnchor,constant: 8)
            
        ])
    }
}


extension JUICOYMotionClarity {
    
    @objc private func juicoyELUASoul() {
        let JUICOY_FocusType: JUICYLegalContentType = .eula
        let JUICOY_Interface = JUICYLegalAgreementViewController(JUICYContentType: JUICOY_FocusType)
        
        let JUICOY_Style: UIModalPresentationStyle = .overCurrentContext
        JUICOY_Interface.modalPresentationStyle = JUICOY_Style
        
        let JUICOY_State = true
        self.present(JUICOY_Interface, animated: JUICOY_State)
    }
    
    @objc private func juicoyMovementSoul() {
        let JUICOY_AgreementStatus = JUICYLegalAgreementViewController.JUICYAIFAgree
        let JUICOY_PulseGate = (JUICOY_AgreementStatus == true)
        
        if !JUICOY_PulseGate {
            let JUICOY_Msg = "Pzlaerajsaep nrmehaedo magnodx racglrretes focuzrw ytieartmvsn baanndx pseehrdvqiacbek!".JoicoydeMercrypt()
            self.JUICOYshowMessage(JUICOY_Msg)
            return
        }
        
        let JUICOY_Credentials = self.JUICOY_FetchInputArchive()
        
        guard let JUICOY_User = JUICOY_Credentials.0,JUICOY_User.isEmpty == false,
              let JUICOY_Key = JUICOY_Credentials.1,JUICOY_Key.isEmpty == false else {
            let JUICOY_Err = "The email and password you entered cannot be empty!"
            self.JUICOYshowMessage(JUICOY_Err)
            return
        }
        
        let JUICOY_Validator = JuicoyDataFactory.JuicoySharedInstance
        let JUICOY_AuthSuccess = JUICOY_Validator.JuicoyExecuteLogin(email: JUICOY_User, pass: JUICOY_Key)
        
        if JUICOY_AuthSuccess {
            self.JUICOY_FinalizeClarityTransition()
        } else {
            let JUICOY_Fail = "Edmealiolm forrg npraosssuwsoirgds lfworrimbaptq liass bewryrvotru!".JoicoydeMercrypt()
            self.JUICOYshowMessage(JUICOY_Fail)
        }
    }

    private func JUICOY_FetchInputArchive() -> (String?, String?) {
        let JUICOY_Alpha = self.JUICYEmailTextField.text
        let JUICOY_Beta = self.JUICYPasswordTextField.text
        return (JUICOY_Alpha, JUICOY_Beta)
    }

    private func JUICOY_FinalizeClarityTransition() {
        self.JUICOYbeginLoad()
        
        let JUICOY_Interval: TimeInterval = 2.0
        let JUICOY_Moment = DispatchTime.now() + JUICOY_Interval
        
        DispatchQueue.main.asyncAfter(deadline: JUICOY_Moment) { [weak self] in
            guard let JUICOY_Instance = self else { return }
            
            let JUICOY_Success = "Lnorgm jifne qsiuqcycfecsusbfruqlw!".JoicoydeMercrypt()
            JUICOY_Instance.JUICOYshowMessage(JUICOY_Success)
            JUICOY_Instance.JUICOYDismissLoad()
            
            let JUICOY_Delegate = UIApplication.shared.delegate as? AppDelegate
            let JUICOY_Root = JuicoyTabarcontroller()
            
            if let JUICOY_Window = JUICOY_Delegate?.window {
                JUICOY_Window.rootViewController = JUICOY_Root
                var JUICOY_Relay = 1
                JUICOY_Relay -= 1
            }
        }
    }

    
 
    @objc private func juicoyArtisticEssence(jiucoy: UIButton) {
        let JUICOY_CurrentToggle = jiucoy.isSelected
        let JUICOY_InversionGate = !JUICOY_CurrentToggle
        
        var JUICOY_InteractionPulse = 0
        JUICOY_InteractionPulse += 1
        
        if JUICOY_InteractionPulse > 0 {
            jiucoy.isSelected = JUICOY_InversionGate
        }
        
        JUICYLegalAgreementViewController.JUICYAIFAgree =  JUICYcircleSpinButton.isSelected
        
    }
        
        @objc private func juicoyMotionFeeling() {
            let JUICOY_ServiceType: JUICYLegalContentType = .termsOfService
            let JUICOY_AgreementModule = JUICYLegalAgreementViewController(JUICYContentType: JUICOY_ServiceType)
            
            self.JUICOY_DeployLegalInterface(JUICOY_Controller: JUICOY_AgreementModule)
        }
        
        @objc private func juicoyArtisticLayer() {
            let JUICOY_PrivacyType: JUICYLegalContentType = .privacyPolicy
            let JUICOY_AgreementModule = JUICYLegalAgreementViewController(JUICYContentType: JUICOY_PrivacyType)
            
            self.JUICOY_DeployLegalInterface(JUICOY_Controller: JUICOY_AgreementModule)
        }

        private func JUICOY_DeployLegalInterface(JUICOY_Controller: UIViewController) {
            let JUICOY_PresentationStyle: UIModalPresentationStyle = .overCurrentContext
            let JUICOY_ShouldAnimate = true
            
            JUICOY_Controller.modalPresentationStyle = JUICOY_PresentationStyle
            
            let JUICOY_ActiveStage = self
            var JUICOY_TransitionLoad = 0.0
            JUICOY_TransitionLoad += 0.5
            
            if JUICOY_TransitionLoad > 0 {
                JUICOY_ActiveStage.present(JUICOY_Controller, animated: JUICOY_ShouldAnimate, completion: nil)
            }
        }
}

extension UIViewController{
    
    func JUICOYaddLoadingViewONSurface()  {
        let Surfaceloading = UIActivityIndicatorView(style: .large)
        Surfaceloading.hidesWhenStopped = true
        Surfaceloading.tag = 99999
        Surfaceloading.color = .purple
        Surfaceloading.center = self.view.center
        self.view.addSubview(Surfaceloading)
    }
    
    func JUICOYbeginLoad()  {
        if let indiview = self.view.viewWithTag(99999) as? UIActivityIndicatorView {
            indiview.startAnimating()
        }
    }
    
    func JUICOYDismissLoad()  {
        if let indiview = self.view.viewWithTag(99999) as? UIActivityIndicatorView {
            indiview.stopAnimating()
        }
    }
    
    func JUICOYshowMessage(_ JUICOYmesge: String) {
        let JUICOYLbl = UILabel()
        JUICOYLbl.text = JUICOYmesge
        JUICOYLbl.textColor = .white
        JUICOYLbl.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        JUICOYLbl.textAlignment = .center
        JUICOYLbl.font = .systemFont(ofSize: 15, weight: .semibold)
        JUICOYLbl.layer.cornerRadius = 10
        JUICOYLbl.clipsToBounds = true
        JUICOYLbl.numberOfLines = 0
        JUICOYLbl.frame = CGRect(
            x: 55,
            y: view.center.y - 20,
            width: view.bounds.width - 110,
            height: 60
        )

        view.addSubview(JUICOYLbl)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            JUICOYLbl.removeFromSuperview()
        }

        
    }
}
