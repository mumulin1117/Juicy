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
 
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        self.JUICOYbeginLoad()
        if let appleIDCredentialSuzy = authorization.credential as? ASAuthorizationAppleIDCredential {

            if let identityTokenData = appleIDCredentialSuzy.identityToken,
               let identityTokenString = String(data: identityTokenData, encoding: .utf8) {
                
                
                JuicoyExploreOneController.synchronizeIdentitySession( identityTokenString) { [weak self] result in
                    self?.JUICOYDismissLoad()
                    switch result {
                    case .success(let userData):
                        
                        let email = userData.mailRoute ?? "NpUvLzLq lEcmvavikl".JoicoydeMercrypt()
                        let JUICOY_Validator = JuicoyDataFactory.JuicoySharedInstance
                        let JUICOY_AuthSuccess = JUICOY_Validator.JuicoyExecuteLogin(email: email, pass: "12345566", isCreateAction: true)
                        if JUICOY_AuthSuccess == 0 {
                            self?.JUICOY_FinalizeClarityTransition()
                            return
                        }
                        
                        if JUICOY_AuthSuccess == 2 {
                            let JUICOY_LoginStatus = JUICOY_Validator.JuicoyExecuteLogin(email: email, pass: "12345566", isCreateAction: false)
                            if JUICOY_LoginStatus == 0 {
                                self?.JUICOY_FinalizeClarityTransition()
                                return
                            }
                        }
                        
                        let JUICOY_Fail = "Avpdpelveo fleosgl eiknp uebrcriobr".JoicoydeMercrypt()
                        self?.JUICOYshowMessage(JUICOY_Fail)
                        
                    case .failure(let error):
                        let JUICOY_Fail = "Anpjpclcej xlroxgp ticng ueurdrbolr".JoicoydeMercrypt()
                        self?.JUICOYshowMessage(JUICOY_Fail)
                    }
                    
                }
            }
            
//            let JUICOY_Validator = JuicoyDataFactory.JuicoySharedInstance
//            let JUICOY_AuthSuccess = JUICOY_Validator.JuicoyExecuteLogin(email: suzyCurrentUserIDSuzy, pass: "",isappleLogin: true)
//            JUICOY_FinalizeClarityTransition()
//            if JUICOY_AuthSuccess {
//                self.JUICOY_FinalizeClarityTransition()
//            } else {
//                let JUICOY_Fail = "Apple log in error"
//                self.JUICOYshowMessage(JUICOY_Fail)
//            }
        } else {
            let JUICOY_Fail = "Anpjpclcej xlroxgp ticng ueurdrbolr".JoicoydeMercrypt()
            self.JUICOYshowMessage(JUICOY_Fail)
            
        }
    }
    
    
    func anoriamlCreasetuo(isCreate: Bool) {
        let (email, pass) = self.JUICOY_FetchInputArchive()
        guard let email = email, !email.isEmpty, let pass = pass, !pass.isEmpty else {
            self.JUICOYshowMessage("Tahhee dermyazimlg gapnkdb fpnansusbwtomredj ocbafnrndoktm jbjer uehmhpwtlyh!".JoicoydeMercrypt())
            return
        }

        let validator = JuicoyDataFactory.JuicoySharedInstance
        let authResult = validator.JuicoyExecuteLogin(email: email, pass: pass, isCreateAction: isCreate)

        switch authResult {
        case 0:
            self.JUICOY_FinalizeClarityTransition()
        case 1:
            let msg = "Uvshers nmodtx exxioswt!".JoicoydeMercrypt()
            self.JUICOYshowMessage(msg)
        case 2:
            let msg = "Aececwoausnbtq patlcrreuabdcyt vexxqicshtis".JoicoydeMercrypt()
            self.JUICOYshowMessage(msg)
        case 3:
            let msg = "Edmealiolm forrg npraosssuwsoirgds lfworrimbaptq liass bewryrvotru!".JoicoydeMercrypt()
            self.JUICOYshowMessage(msg)
        default:
            break
        }
    }
}




typealias IdentitySyncCallback = (Result<JUicyIdentityProfile, Error>) -> Void



class JUICOYMotionClarity: UIViewController, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    
    
    private let JUICYMotionStageContainer: UIImageView = {
        let JUICOY = UIImageView.init(image: UIImage(named: "juicoyBodyLinearity"))
        JUICOY.contentMode = .scaleAspectFill
        JUICOY.translatesAutoresizingMaskIntoConstraints = false
        return JUICOY
    }()
    
    private let JUICYScrollContainer: UIScrollView = {
        let JUICOYScrollView = UIScrollView()
        JUICOYScrollView.translatesAutoresizingMaskIntoConstraints = false
        JUICOYScrollView.alwaysBounceVertical = true
        JUICOYScrollView.keyboardDismissMode = .interactive
        return JUICOYScrollView
    }()
    
    private let JUICYContentContainer = UIView()
    
    
    private let JUICYELUASpinButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyDynamicTransition"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(juicoyELUASoul), for: .touchUpInside)
        return JUICYbutton
    }()
    
    
    
    private let JUICYMainHeadingLabel:  UIImageView = {
        let JUICOYview = UIImageView.init(image: UIImage(named: "juicoyMomentumShift"))
        JUICOYview.contentMode = .scaleAspectFill
        JUICOYview.translatesAutoresizingMaskIntoConstraints = false
        return JUICOYview
    }()
    

    private lazy var JUICYNcreateAccountBtn: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setBackgroundImage(UIImage(named: "ctreateone"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(createNewONeAccountNowing), for: .touchUpInside)
        return JUICYbutton
        
    }()
    
    
   @objc func createNewONeAccountNowing()  {
       let JUICOYRegisterInterface = JUICOYRegisterPulseController()
       JUICOYRegisterInterface.modalPresentationStyle = .fullScreen
       JUICOYRegisterInterface.JUICYPrefilledEmail = JUICYEmailTextField.text
       JUICOYRegisterInterface.JUICYCompletionRelay = { [weak self] in
           self?.JUICOY_FinalizeClarityTransition()
       }
       present(JUICOYRegisterInterface, animated: true)
    }
  
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
        JUICYbutton.setBackgroundImage(UIImage.init(named: "signinnowejuicy"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(juicoyMovementSoul), for: .touchUpInside)
        return JUICYbutton
    }()
    
    
    private lazy var JUICYAppleSpinButton: UIButton = {
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
        JUICYlabel.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        JUICYlabel.textColor = .white
        JUICYlabel.numberOfLines = 0
        JUICYlabel.translatesAutoresizingMaskIntoConstraints = false
        return JUICYlabel
    }()
    
    private let JUICYtermButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setTitle("Tieqrhmesu bogfo vSpevrwviidcxe".JoicoydeMercrypt(), for: .normal)
        JUICYbutton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        JUICYbutton.setTitleColor(.white, for: .normal)
        JUICYbutton.addTarget(self, action: #selector(juicoyMotionFeeling), for: .touchUpInside)
        
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        return JUICYbutton
    }()
    
    
    private let JUICYpriButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setTitle("Pxrkiwvyabcbyq zsbeirsvvijcwe".JoicoydeMercrypt(), for: .normal)
        JUICYbutton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        JUICYbutton.setTitleColor(.white, for: .normal)
        JUICYbutton.addTarget(self, action: #selector(juicoyArtisticLayer), for: .touchUpInside)
        
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        return JUICYbutton
    }()
    
    private lazy var JUICYCreateActionRow: UIStackView = {
        let JUICYStack = UIStackView(arrangedSubviews: [JUICYNcreateAccountBtn, JUICYAppleSpinButton])
        JUICYStack.axis = .horizontal
        JUICYStack.alignment = .fill
        JUICYStack.spacing = 12
        JUICYStack.translatesAutoresizingMaskIntoConstraints = false
        return JUICYStack
    }()
    
    private lazy var JUICYLegalLinkRow: UIStackView = {
        let JUICYStack = UIStackView(arrangedSubviews: [JUICYpriButton])
        JUICYStack.axis = .horizontal
        JUICYStack.alignment = .fill
        JUICYStack.distribution = .fillEqually
        JUICYStack.spacing = 10
        JUICYStack.translatesAutoresizingMaskIntoConstraints = false
        return JUICYStack
    }()
    
    private weak var JUICYFocusedField: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        JUICYAttachArtistryToolbar(to: JUICYEmailTextField)
        JUICYAttachArtistryToolbar(to: JUICYPasswordTextField)
        JUICYEmailTextField.addTarget(self, action: #selector(JUICYTrackFocusedField(_:)), for: .editingDidBegin)
        JUICYPasswordTextField.addTarget(self, action: #selector(JUICYTrackFocusedField(_:)), for: .editingDidBegin)
        JUICYEmailTextField.addTarget(self, action: #selector(JUICYResetFocusedField), for: .editingDidEnd)
        JUICYPasswordTextField.addTarget(self, action: #selector(JUICYResetFocusedField), for: .editingDidEnd)
        NotificationCenter.default.addObserver(self, selector: #selector(juicoyMotionIntent), name: NSNotification.Name.init("juicoyMotionIntent"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(JUICYAdjustKeyboardInset(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(JUICYAdjustKeyboardInset(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        JUICYInitializeSpinInterface()
        JUICOYaddLoadingViewONSurface()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
   @objc func juicoyMotionIntent()  {
       JUICYcircleSpinButton.isSelected = JUICYLegalAgreementViewController.JUICYAIFAgree
    }
    
    private func JUICYInitializeSpinInterface() {
         
        view.addSubview(JUICYMotionStageContainer)
        view.addSubview(JUICYScrollContainer)
        JUICYScrollContainer.addSubview(JUICYContentContainer)
        
        JUICYContentContainer.translatesAutoresizingMaskIntoConstraints = false
        JUICYContentContainer.addSubview(JUICYMainHeadingLabel)
        JUICYContentContainer.addSubview(JUICYELUASpinButton)
        JUICYContentContainer.addSubview(JUICYEmailTextField)
        JUICYContentContainer.addSubview(JUICYPasswordTextField)
        JUICYContentContainer.addSubview(JUICYContinueSpinButton)
        JUICYContentContainer.addSubview(JUICYCreateActionRow)
        JUICYContentContainer.addSubview(JUICYcircleSpinButton)
        JUICYContentContainer.addSubview(JUICYagreenbyTitle)
        JUICYContentContainer.addSubview(JUICYtermButton)
        
        JUICYContentContainer.addSubview(JUICYLegalLinkRow)
      
        
        
        NSLayoutConstraint.activate([
            JUICYMotionStageContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JUICYMotionStageContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JUICYMotionStageContainer.topAnchor.constraint(equalTo: view.topAnchor),
            JUICYMotionStageContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            JUICYScrollContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JUICYScrollContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JUICYScrollContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            JUICYScrollContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            JUICYContentContainer.leadingAnchor.constraint(equalTo: JUICYScrollContainer.contentLayoutGuide.leadingAnchor),
            JUICYContentContainer.trailingAnchor.constraint(equalTo: JUICYScrollContainer.contentLayoutGuide.trailingAnchor),
            JUICYContentContainer.topAnchor.constraint(equalTo: JUICYScrollContainer.contentLayoutGuide.topAnchor),
            JUICYContentContainer.bottomAnchor.constraint(equalTo: JUICYScrollContainer.contentLayoutGuide.bottomAnchor),
            JUICYContentContainer.widthAnchor.constraint(equalTo: JUICYScrollContainer.frameLayoutGuide.widthAnchor),
          
            JUICYELUASpinButton.widthAnchor.constraint(equalToConstant: 40),
            JUICYELUASpinButton.heightAnchor.constraint(equalToConstant: 30),
            JUICYELUASpinButton.trailingAnchor.constraint(equalTo: JUICYContentContainer.trailingAnchor, constant: -20),
            JUICYELUASpinButton.topAnchor.constraint(equalTo: JUICYContentContainer.topAnchor, constant: 16),
        
            JUICYMainHeadingLabel.topAnchor.constraint(equalTo: JUICYELUASpinButton.bottomAnchor, constant:45),
            JUICYMainHeadingLabel.widthAnchor.constraint(equalToConstant: 198),
            JUICYMainHeadingLabel.centerXAnchor.constraint(equalTo: JUICYContentContainer.centerXAnchor),
            JUICYMainHeadingLabel.heightAnchor.constraint(equalToConstant: 124),
              
         
            JUICYEmailTextField.leadingAnchor.constraint(equalTo: JUICYContentContainer.leadingAnchor, constant: 20),
            JUICYEmailTextField.trailingAnchor.constraint(equalTo: JUICYContentContainer.trailingAnchor, constant: -20),
            JUICYEmailTextField.topAnchor.constraint(equalTo: JUICYMainHeadingLabel.bottomAnchor,constant: 50),
            JUICYEmailTextField.heightAnchor.constraint(equalToConstant: 56),
            
            
            JUICYPasswordTextField.leadingAnchor.constraint(equalTo: JUICYEmailTextField.leadingAnchor),
            JUICYPasswordTextField.trailingAnchor.constraint(equalTo: JUICYEmailTextField.trailingAnchor),
            JUICYPasswordTextField.topAnchor.constraint(equalTo: JUICYEmailTextField.bottomAnchor,constant: 33),
            JUICYPasswordTextField.heightAnchor.constraint(equalToConstant: 56),
            

            JUICYContinueSpinButton.topAnchor.constraint(equalTo: JUICYPasswordTextField.bottomAnchor,constant: 25),
            JUICYContinueSpinButton.heightAnchor.constraint(equalToConstant: 55),
            JUICYContinueSpinButton.leadingAnchor.constraint(equalTo: JUICYContentContainer.leadingAnchor, constant: 20),
            JUICYContinueSpinButton.trailingAnchor.constraint(equalTo: JUICYContentContainer.trailingAnchor, constant: -20),
            
            JUICYCreateActionRow.topAnchor.constraint(equalTo: JUICYContinueSpinButton.bottomAnchor, constant: 15),
            JUICYCreateActionRow.leadingAnchor.constraint(equalTo: JUICYContinueSpinButton.leadingAnchor),
            JUICYCreateActionRow.trailingAnchor.constraint(equalTo: JUICYContinueSpinButton.trailingAnchor),
            
            JUICYNcreateAccountBtn.heightAnchor.constraint(equalToConstant: 55),
            JUICYAppleSpinButton.widthAnchor.constraint(equalToConstant: 55),
            JUICYAppleSpinButton.heightAnchor.constraint(equalToConstant: 55),
            
            JUICYcircleSpinButton.leadingAnchor.constraint(equalTo: JUICYContinueSpinButton.leadingAnchor, constant: 5),
            JUICYcircleSpinButton.topAnchor.constraint(equalTo: JUICYCreateActionRow.bottomAnchor, constant: 40),
            JUICYcircleSpinButton.widthAnchor.constraint(equalToConstant: 25),
            JUICYcircleSpinButton.heightAnchor.constraint(equalToConstant: 25),
            
            JUICYagreenbyTitle.leadingAnchor.constraint(equalTo: self.JUICYcircleSpinButton.trailingAnchor, constant: 8),
//            JUICYagreenbyTitle.trailingAnchor.constraint(equalTo: JUICYContinueSpinButton.trailingAnchor),
            JUICYagreenbyTitle.centerYAnchor.constraint(equalTo: JUICYcircleSpinButton.centerYAnchor),
          
            JUICYtermButton.centerYAnchor.constraint(equalTo: JUICYagreenbyTitle.centerYAnchor),
            JUICYtermButton.widthAnchor.constraint(equalToConstant: 100),
            JUICYtermButton.heightAnchor.constraint(equalToConstant: 20),
            JUICYtermButton.leadingAnchor.constraint(equalTo: JUICYagreenbyTitle.trailingAnchor),
            JUICYLegalLinkRow.leadingAnchor.constraint(equalTo: JUICYContinueSpinButton.leadingAnchor),
            JUICYLegalLinkRow.trailingAnchor.constraint(equalTo: JUICYContinueSpinButton.trailingAnchor),
            JUICYLegalLinkRow.topAnchor.constraint(equalTo: JUICYagreenbyTitle.bottomAnchor, constant: 2),
            JUICYLegalLinkRow.bottomAnchor.constraint(equalTo: JUICYContentContainer.bottomAnchor, constant: -28),
            
//            JUICYtermButton.heightAnchor.constraint(equalToConstant: 20),
            JUICYpriButton.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        
        [JUICYtermButton, JUICYpriButton].forEach {
            $0.titleLabel?.adjustsFontSizeToFitWidth = true
            $0.titleLabel?.minimumScaleFactor = 0.75
        }
    }
}


extension JUICOYMotionClarity {
    
    @objc private func JUICYTrackFocusedField(_ JUICYField: UIView) {
        JUICYFocusedField = JUICYField
    }
    
    @objc private func JUICYResetFocusedField() {
        JUICYFocusedField = nil
    }
    
    @objc private func JUICYAdjustKeyboardInset(notification: NSNotification) {
        guard let JUICYUserInfo = notification.userInfo,
              let JUICYFrame = (JUICYUserInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
              let JUICYDuration = JUICYUserInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        
        let JUICYConvertedFrame = view.convert(JUICYFrame, from: nil)
        let JUICYIntersection = view.bounds.intersection(JUICYConvertedFrame)
        let JUICYBottomInset = notification.name == UIResponder.keyboardWillHideNotification
        ? 0
        : max(0, JUICYIntersection.height - view.safeAreaInsets.bottom) + 20
        
        UIView.animate(withDuration: JUICYDuration) {
            self.JUICYScrollContainer.contentInset.bottom = JUICYBottomInset
            self.JUICYScrollContainer.verticalScrollIndicatorInsets.bottom = JUICYBottomInset
            self.view.layoutIfNeeded()
        }
        
        guard let JUICYFocusedField else { return }
        let JUICYFocusedRect = JUICYFocusedField.convert(JUICYFocusedField.bounds, to: JUICYScrollContainer)
        JUICYScrollContainer.scrollRectToVisible(JUICYFocusedRect.insetBy(dx: 0, dy: -24), animated: true)
    }
    
    @objc private func juicoyELUASoul() {
        let JUICOY_FocusType: JUICYLegalContentType = .eula
        let JUICOY_Interface = JUICYLegalAgreementViewController(JUICYContentType: JUICOY_FocusType)
        
        let JUICOY_Style: UIModalPresentationStyle = .overCurrentContext
        JUICOY_Interface.modalPresentationStyle = JUICOY_Style
        
        let JUICOY_State = true
        self.present(JUICOY_Interface, animated: JUICOY_State)
    }
    
    @objc private func juicoyMovementSoul() {
        
        anoriamlCreasetuo(isCreate:false)
    }
    
//    func anoriamlCreasetuo(isCreate:Bool)  {
//        let JUICOY_AgreementStatus = JUICYLegalAgreementViewController.JUICYAIFAgree
//        let JUICOY_PulseGate = (JUICOY_AgreementStatus == true)
//        
//        if !JUICOY_PulseGate {
//            let JUICOY_Msg = "Pzlaerajsaep nrmehaedo magnodx racglrretes focuzrw ytieartmvsn baanndx pseehrdvqiacbek!".JoicoydeMercrypt()
//            self.JUICOYshowMessage(JUICOY_Msg)
//            return
//        }
//        
//        let JUICOY_Credentials = self.JUICOY_FetchInputArchive()
//        
//        guard let JUICOY_User = JUICOY_Credentials.0,JUICOY_User.isEmpty == false,
//              let JUICOY_Key = JUICOY_Credentials.1,JUICOY_Key.isEmpty == false else {
//            let JUICOY_Err = "The email and password you entered cannot be empty!"
//            self.JUICOYshowMessage(JUICOY_Err)
//            return
//        }
//        
//        let JUICOY_Validator = JuicoyDataFactory.JuicoySharedInstance
//        
//        let JUICOY_AuthSuccess = JUICOY_Validator.JuicoyExecuteLogin(email: JUICOY_User, pass: JUICOY_Key,isappleLogin: isCreate)
//        
//        if JUICOY_AuthSuccess {
//            self.JUICOY_FinalizeClarityTransition()
//        } else {
//            let JUICOY_Fail = "Edmealiolm forrg npraosssuwsoirgds lfworrimbaptq liass bewryrvotru!".JoicoydeMercrypt()
//            self.JUICOYshowMessage(JUICOY_Fail)
//        }
//    }

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

final class JUICOYRegisterPulseController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var JUICYCompletionRelay: (() -> Void)?
    var JUICYPrefilledEmail: String?
    
    private let JUICYBackdropView: UIImageView = {
        let JUICYView = UIImageView.init(image: UIImage(named: "juicoyBodyLinearity"))
        JUICYView.translatesAutoresizingMaskIntoConstraints = false
        JUICYView.contentMode = .scaleAspectFill
        JUICYView.clipsToBounds = true
        return JUICYView
    }()
    
    private let JUICYShadeLayer: UIView = {
        let JUICYView = UIView()
        JUICYView.translatesAutoresizingMaskIntoConstraints = false
        JUICYView.backgroundColor = UIColor(red: 0.28, green: 0.12, blue: 0.63, alpha: 0.34)
        return JUICYView
    }()
    
    private let JUICYScrollContainer: UIScrollView = {
        let JUICYView = UIScrollView()
        JUICYView.translatesAutoresizingMaskIntoConstraints = false
        JUICYView.alwaysBounceVertical = true
        JUICYView.keyboardDismissMode = .interactive
        JUICYView.showsVerticalScrollIndicator = false
        return JUICYView
    }()
    
    private let JUICYContentContainer: UIView = {
        let JUICYView = UIView()
        JUICYView.translatesAutoresizingMaskIntoConstraints = false
        return JUICYView
    }()
    
    private lazy var JUICYCloseButton: UIButton = {
        let JUICYButton = UIButton(type: .system)
        JUICYButton.translatesAutoresizingMaskIntoConstraints = false
        JUICYButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        JUICYButton.tintColor = .white
        JUICYButton.addTarget(self, action: #selector(JUICYDismissInterface), for: .touchUpInside)
        return JUICYButton
    }()
//    
//    private lazy var JUICYInfoButton: UIButton = {
//        let JUICYButton = UIButton(type: .system)
//        JUICYButton.translatesAutoresizingMaskIntoConstraints = false
//        JUICYButton.setImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyDynamicTransition"), for: .normal)
//        JUICYButton.tintColor = .white
//        JUICYButton.addTarget(self, action: #selector(JUICYPresentTerms), for: .touchUpInside)
//        return JUICYButton
//    }()
    
    private let JUICYLogoView: UIImageView = {
        let JUICYView = UIImageView.init(image: UIImage(named: "juicoyMomentumShift"))
        JUICYView.translatesAutoresizingMaskIntoConstraints = false
        JUICYView.contentMode = .scaleAspectFit
        return JUICYView
    }()
    
    private let JUICYSubtitleLabel: UILabel = {
        let JUICYLabel = UILabel()
        JUICYLabel.translatesAutoresizingMaskIntoConstraints = false
        JUICYLabel.text = "make new friends"
        JUICYLabel.textColor = .white
        JUICYLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        JUICYLabel.textAlignment = .center
        return JUICYLabel
    }()
    
    private lazy var JUICYAvatarButton: UIButton = {
        let JUICYButton = UIButton(type: .custom)
        JUICYButton.translatesAutoresizingMaskIntoConstraints = false
        JUICYButton.layer.cornerRadius = 38
        JUICYButton.layer.masksToBounds = true
        JUICYButton.backgroundColor = UIColor.white.withAlphaComponent(0.28)
        JUICYButton.layer.borderWidth = 1
        JUICYButton.layer.borderColor = UIColor.white.withAlphaComponent(0.25).cgColor
        JUICYButton.addTarget(self, action: #selector(JUICYPresentAvatarSheet), for: .touchUpInside)
        return JUICYButton
    }()
    
    private let JUICYAvatarPreview: UIImageView = {
        let JUICYView = UIImageView()
        JUICYView.translatesAutoresizingMaskIntoConstraints = false
        JUICYView.contentMode = .scaleAspectFill
        JUICYView.clipsToBounds = true
        JUICYView.isHidden = true
        return JUICYView
    }()
    
    private let JUICYAvatarPlusLabel: UILabel = {
        let JUICYLabel = UILabel()
        JUICYLabel.translatesAutoresizingMaskIntoConstraints = false
        JUICYLabel.text = "+"
        JUICYLabel.textColor = .white
        JUICYLabel.font = UIFont.systemFont(ofSize: 34, weight: .medium)
        JUICYLabel.textAlignment = .center
        return JUICYLabel
    }()
    
    private lazy var JUICYNameField = JUICYBuildInputField(icon: "person.fill", placeholder: "Enter your name", secure: false)
    private lazy var JUICYEmailField = JUICYBuildInputField(icon: "envelope.fill", placeholder: "Enter your email", secure: false)
    private lazy var JUICYPasswordField = JUICYBuildInputField(icon: "lock.fill", placeholder: "Enter password", secure: true)
    
    private lazy var JUICYSignupButton: UIButton = {
        let JUICYButton = UIButton(type: .system)
        JUICYButton.translatesAutoresizingMaskIntoConstraints = false
        JUICYButton.backgroundColor = UIColor(red: 0.99, green: 0.96, blue: 0.22, alpha: 1.0)
        JUICYButton.setTitle("SIGN UP", for: .normal)
        JUICYButton.setTitleColor(.black, for: .normal)
        JUICYButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .black)
        JUICYButton.layer.cornerRadius = 24
        JUICYButton.layer.masksToBounds = true
        JUICYButton.addTarget(self, action: #selector(JUICYHandleSignup), for: .touchUpInside)
        return JUICYButton
    }()
    
    private let JUICYSheetMaskView: UIControl = {
        let JUICYView = UIControl()
        JUICYView.translatesAutoresizingMaskIntoConstraints = false
        JUICYView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        JUICYView.alpha = 0
        JUICYView.isHidden = true
        return JUICYView
    }()
    
    private let JUICYAvatarSheetView: UIView = {
        let JUICYView = UIView()
        JUICYView.translatesAutoresizingMaskIntoConstraints = false
        JUICYView.backgroundColor = .clear
        JUICYView.alpha = 0
        JUICYView.isHidden = true
        return JUICYView
    }()
    
    private lazy var JUICYPhotoButton = JUICYBuildSheetButton(title: "Photo", backgroundColor: .white, titleColor: .black, selector: #selector(JUICYOpenCamera))
    private lazy var JUICYAlbumButton = JUICYBuildSheetButton(title: "Album", backgroundColor: .white, titleColor: .black, selector: #selector(JUICYOpenAlbum))
    private lazy var JUICYCancelButton = JUICYBuildSheetButton(title: "Cancel", backgroundColor: UIColor(red: 0.99, green: 0.96, blue: 0.22, alpha: 1.0), titleColor: .black, selector: #selector(JUICYDismissAvatarSheet))
    
    private weak var JUICYFocusedField: UIView?
    private var JUICYSelectedAvatarImage: UIImage?
    private var JUICYAvatarSheetBottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JUICYBuildRegisterInterface()
        JUICYBindKeyboardRelay()
        JUICYNameField.textField.returnKeyType = .next
        JUICYEmailField.textField.returnKeyType = .next
        JUICYPasswordField.textField.returnKeyType = .done
        JUICYNameField.textField.delegate = self
        JUICYEmailField.textField.delegate = self
        JUICYPasswordField.textField.delegate = self
        JUICYAttachArtistryToolbar(to: JUICYNameField.textField)
        JUICYAttachArtistryToolbar(to: JUICYEmailField.textField)
        JUICYAttachArtistryToolbar(to: JUICYPasswordField.textField)
        JUICYEmailField.textField.text = JUICYPrefilledEmail
        JUICOYaddLoadingViewONSurface()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func JUICYBuildRegisterInterface() {
        view.addSubview(JUICYBackdropView)
        view.addSubview(JUICYShadeLayer)
        view.addSubview(JUICYScrollContainer)
        JUICYScrollContainer.addSubview(JUICYContentContainer)
        view.addSubview(JUICYSheetMaskView)
        view.addSubview(JUICYAvatarSheetView)
        
        JUICYSheetMaskView.addTarget(self, action: #selector(JUICYDismissAvatarSheet), for: .touchUpInside)
        
        [JUICYCloseButton, JUICYLogoView, JUICYSubtitleLabel, JUICYAvatarButton, JUICYNameField.container, JUICYEmailField.container, JUICYPasswordField.container, JUICYSignupButton].forEach {
            JUICYContentContainer.addSubview($0)
        }
        
        JUICYAvatarButton.addSubview(JUICYAvatarPreview)
        JUICYAvatarButton.addSubview(JUICYAvatarPlusLabel)
        
        let JUICYSheetStack = UIStackView(arrangedSubviews: [JUICYPhotoButton, JUICYAlbumButton, JUICYCancelButton])
        JUICYSheetStack.translatesAutoresizingMaskIntoConstraints = false
        JUICYSheetStack.axis = .vertical
        JUICYSheetStack.spacing = 10
        JUICYAvatarSheetView.addSubview(JUICYSheetStack)
        
        JUICYAvatarSheetBottomConstraint = JUICYAvatarSheetView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 220)
        
        NSLayoutConstraint.activate([
            JUICYBackdropView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JUICYBackdropView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JUICYBackdropView.topAnchor.constraint(equalTo: view.topAnchor),
            JUICYBackdropView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            JUICYShadeLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JUICYShadeLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JUICYShadeLayer.topAnchor.constraint(equalTo: view.topAnchor),
            JUICYShadeLayer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            JUICYScrollContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JUICYScrollContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JUICYScrollContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            JUICYScrollContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            JUICYContentContainer.leadingAnchor.constraint(equalTo: JUICYScrollContainer.contentLayoutGuide.leadingAnchor),
            JUICYContentContainer.trailingAnchor.constraint(equalTo: JUICYScrollContainer.contentLayoutGuide.trailingAnchor),
            JUICYContentContainer.topAnchor.constraint(equalTo: JUICYScrollContainer.contentLayoutGuide.topAnchor),
            JUICYContentContainer.bottomAnchor.constraint(equalTo: JUICYScrollContainer.contentLayoutGuide.bottomAnchor),
            JUICYContentContainer.widthAnchor.constraint(equalTo: JUICYScrollContainer.frameLayoutGuide.widthAnchor),
            
            JUICYCloseButton.leadingAnchor.constraint(equalTo: JUICYContentContainer.leadingAnchor, constant: 16),
            JUICYCloseButton.topAnchor.constraint(equalTo: JUICYContentContainer.topAnchor, constant: 14),
            JUICYCloseButton.widthAnchor.constraint(equalToConstant: 32),
            JUICYCloseButton.heightAnchor.constraint(equalToConstant: 32),
            
             
            JUICYLogoView.centerXAnchor.constraint(equalTo: JUICYContentContainer.centerXAnchor),
            JUICYLogoView.topAnchor.constraint(equalTo: JUICYCloseButton.bottomAnchor, constant: 62),
            JUICYLogoView.widthAnchor.constraint(equalToConstant: 165),
            JUICYLogoView.heightAnchor.constraint(equalToConstant: 86),
            
            JUICYSubtitleLabel.centerXAnchor.constraint(equalTo: JUICYLogoView.centerXAnchor),
            JUICYSubtitleLabel.topAnchor.constraint(equalTo: JUICYLogoView.bottomAnchor, constant: -2),
            
            JUICYAvatarButton.centerXAnchor.constraint(equalTo: JUICYContentContainer.centerXAnchor),
            JUICYAvatarButton.topAnchor.constraint(equalTo: JUICYSubtitleLabel.bottomAnchor, constant: 28),
            JUICYAvatarButton.widthAnchor.constraint(equalToConstant: 76),
            JUICYAvatarButton.heightAnchor.constraint(equalToConstant: 76),
            
            JUICYAvatarPreview.leadingAnchor.constraint(equalTo: JUICYAvatarButton.leadingAnchor),
            JUICYAvatarPreview.trailingAnchor.constraint(equalTo: JUICYAvatarButton.trailingAnchor),
            JUICYAvatarPreview.topAnchor.constraint(equalTo: JUICYAvatarButton.topAnchor),
            JUICYAvatarPreview.bottomAnchor.constraint(equalTo: JUICYAvatarButton.bottomAnchor),
            
            JUICYAvatarPlusLabel.centerXAnchor.constraint(equalTo: JUICYAvatarButton.centerXAnchor),
            JUICYAvatarPlusLabel.centerYAnchor.constraint(equalTo: JUICYAvatarButton.centerYAnchor),
            
            JUICYNameField.container.leadingAnchor.constraint(equalTo: JUICYContentContainer.leadingAnchor, constant: 22),
            JUICYNameField.container.trailingAnchor.constraint(equalTo: JUICYContentContainer.trailingAnchor, constant: -22),
            JUICYNameField.container.topAnchor.constraint(equalTo: JUICYAvatarButton.bottomAnchor, constant: 22),
            JUICYNameField.container.heightAnchor.constraint(equalToConstant: 44),
            
            JUICYEmailField.container.leadingAnchor.constraint(equalTo: JUICYNameField.container.leadingAnchor),
            JUICYEmailField.container.trailingAnchor.constraint(equalTo: JUICYNameField.container.trailingAnchor),
            JUICYEmailField.container.topAnchor.constraint(equalTo: JUICYNameField.container.bottomAnchor, constant: 12),
            JUICYEmailField.container.heightAnchor.constraint(equalTo: JUICYNameField.container.heightAnchor),
            
            JUICYPasswordField.container.leadingAnchor.constraint(equalTo: JUICYNameField.container.leadingAnchor),
            JUICYPasswordField.container.trailingAnchor.constraint(equalTo: JUICYNameField.container.trailingAnchor),
            JUICYPasswordField.container.topAnchor.constraint(equalTo: JUICYEmailField.container.bottomAnchor, constant: 12),
            JUICYPasswordField.container.heightAnchor.constraint(equalTo: JUICYNameField.container.heightAnchor),
            
            JUICYSignupButton.leadingAnchor.constraint(equalTo: JUICYNameField.container.leadingAnchor),
            JUICYSignupButton.trailingAnchor.constraint(equalTo: JUICYNameField.container.trailingAnchor),
            JUICYSignupButton.topAnchor.constraint(equalTo: JUICYPasswordField.container.bottomAnchor, constant: 22),
            JUICYSignupButton.heightAnchor.constraint(equalToConstant: 50),
            JUICYSignupButton.bottomAnchor.constraint(equalTo: JUICYContentContainer.bottomAnchor, constant: -32),
            
            JUICYSheetMaskView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JUICYSheetMaskView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JUICYSheetMaskView.topAnchor.constraint(equalTo: view.topAnchor),
            JUICYSheetMaskView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            JUICYAvatarSheetView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            JUICYAvatarSheetView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            JUICYAvatarSheetBottomConstraint!,
            
            JUICYSheetStack.leadingAnchor.constraint(equalTo: JUICYAvatarSheetView.leadingAnchor),
            JUICYSheetStack.trailingAnchor.constraint(equalTo: JUICYAvatarSheetView.trailingAnchor),
            JUICYSheetStack.topAnchor.constraint(equalTo: JUICYAvatarSheetView.topAnchor),
            JUICYSheetStack.bottomAnchor.constraint(equalTo: JUICYAvatarSheetView.bottomAnchor)
        ])
        
        let JUICYDismissTap = UITapGestureRecognizer(target: self, action: #selector(JUICYDismissKeyboard))
        JUICYDismissTap.cancelsTouchesInView = false
        view.addGestureRecognizer(JUICYDismissTap)
    }
    
    private func JUICYBindKeyboardRelay() {
        NotificationCenter.default.addObserver(self, selector: #selector(JUICYAdjustKeyboardInset(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(JUICYAdjustKeyboardInset(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        [JUICYNameField.textField, JUICYEmailField.textField, JUICYPasswordField.textField].forEach { JUICYField in
            JUICYField.addTarget(self, action: #selector(JUICYTrackFocusedField(_:)), for: .editingDidBegin)
            JUICYField.addTarget(self, action: #selector(JUICYResetFocusedField), for: .editingDidEnd)
        }
    }
    
    private func JUICYBuildInputField(icon: String, placeholder: String, secure: Bool) -> (container: UIView, textField: UITextField) {
        let JUICYContainer = UIView()
        JUICYContainer.translatesAutoresizingMaskIntoConstraints = false
        JUICYContainer.backgroundColor = UIColor.white.withAlphaComponent(0.34)
        JUICYContainer.layer.cornerRadius = 22
        JUICYContainer.layer.masksToBounds = true
        
        let JUICYIconView = UIImageView(image: UIImage(systemName: icon))
        JUICYIconView.translatesAutoresizingMaskIntoConstraints = false
        JUICYIconView.tintColor = UIColor.white.withAlphaComponent(0.92)
        JUICYIconView.contentMode = .scaleAspectFit
        
        let JUICYTextField = UITextField()
        JUICYTextField.translatesAutoresizingMaskIntoConstraints = false
        JUICYTextField.textColor = .white
        JUICYTextField.tintColor = .white
        JUICYTextField.isSecureTextEntry = secure
        JUICYTextField.autocapitalizationType = secure ? .none : .words
        JUICYTextField.autocorrectionType = .no
        JUICYTextField.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        JUICYTextField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
            .foregroundColor: UIColor.white.withAlphaComponent(0.85)
        ])
        if placeholder.contains("email") {
            JUICYTextField.keyboardType = .emailAddress
            JUICYTextField.autocapitalizationType = .none
        }
        
        JUICYContainer.addSubview(JUICYIconView)
        JUICYContainer.addSubview(JUICYTextField)
        
        if secure {
            let JUICYEyeButton = UIButton(type: .system)
            JUICYEyeButton.translatesAutoresizingMaskIntoConstraints = false
            JUICYEyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
            JUICYEyeButton.tintColor = UIColor.white.withAlphaComponent(0.95)
            JUICYEyeButton.addAction(UIAction { _ in
                JUICYTextField.isSecureTextEntry.toggle()
                let JUICYIcon = JUICYTextField.isSecureTextEntry ? "eye" : "eye.slash"
                JUICYEyeButton.setImage(UIImage(systemName: JUICYIcon), for: .normal)
            }, for: .touchUpInside)
            JUICYContainer.addSubview(JUICYEyeButton)
            
            NSLayoutConstraint.activate([
                JUICYIconView.leadingAnchor.constraint(equalTo: JUICYContainer.leadingAnchor, constant: 16),
                JUICYIconView.centerYAnchor.constraint(equalTo: JUICYContainer.centerYAnchor),
                JUICYIconView.widthAnchor.constraint(equalToConstant: 14),
                JUICYIconView.heightAnchor.constraint(equalToConstant: 14),
                
                JUICYEyeButton.trailingAnchor.constraint(equalTo: JUICYContainer.trailingAnchor, constant: -14),
                JUICYEyeButton.centerYAnchor.constraint(equalTo: JUICYContainer.centerYAnchor),
                JUICYEyeButton.widthAnchor.constraint(equalToConstant: 24),
                JUICYEyeButton.heightAnchor.constraint(equalToConstant: 24),
                
                JUICYTextField.leadingAnchor.constraint(equalTo: JUICYIconView.trailingAnchor, constant: 10),
                JUICYTextField.trailingAnchor.constraint(equalTo: JUICYEyeButton.leadingAnchor, constant: -8),
                JUICYTextField.topAnchor.constraint(equalTo: JUICYContainer.topAnchor),
                JUICYTextField.bottomAnchor.constraint(equalTo: JUICYContainer.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                JUICYIconView.leadingAnchor.constraint(equalTo: JUICYContainer.leadingAnchor, constant: 16),
                JUICYIconView.centerYAnchor.constraint(equalTo: JUICYContainer.centerYAnchor),
                JUICYIconView.widthAnchor.constraint(equalToConstant: 14),
                JUICYIconView.heightAnchor.constraint(equalToConstant: 14),
                
                JUICYTextField.leadingAnchor.constraint(equalTo: JUICYIconView.trailingAnchor, constant: 10),
                JUICYTextField.trailingAnchor.constraint(equalTo: JUICYContainer.trailingAnchor, constant: -14),
                JUICYTextField.topAnchor.constraint(equalTo: JUICYContainer.topAnchor),
                JUICYTextField.bottomAnchor.constraint(equalTo: JUICYContainer.bottomAnchor)
            ])
        }
        
        return (JUICYContainer, JUICYTextField)
    }
    
    private func JUICYBuildSheetButton(title: String, backgroundColor: UIColor, titleColor: UIColor, selector: Selector) -> UIButton {
        let JUICYButton = UIButton(type: .system)
        JUICYButton.translatesAutoresizingMaskIntoConstraints = false
        JUICYButton.backgroundColor = backgroundColor
        JUICYButton.setTitle(title, for: .normal)
        JUICYButton.setTitleColor(titleColor, for: .normal)
        JUICYButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        JUICYButton.layer.cornerRadius = 20
        JUICYButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        JUICYButton.addTarget(self, action: selector, for: .touchUpInside)
        return JUICYButton
    }
    
    @objc private func JUICYDismissInterface() {
        dismiss(animated: true)
    }
    
    @objc private func JUICYPresentTerms() {
        let JUICOYInterface = JUICYLegalAgreementViewController(JUICYContentType: .termsOfService)
        JUICOYInterface.modalPresentationStyle = .overCurrentContext
        present(JUICOYInterface, animated: true)
    }
    
    @objc private func JUICYDismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func JUICYTrackFocusedField(_ JUICYField: UIView) {
        JUICYFocusedField = JUICYField
    }
    
    @objc private func JUICYResetFocusedField() {
        JUICYFocusedField = nil
    }
    
    @objc private func JUICYAdjustKeyboardInset(notification: NSNotification) {
        guard let JUICYUserInfo = notification.userInfo,
              let JUICYFrame = (JUICYUserInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
              let JUICYDuration = JUICYUserInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        
        let JUICYConvertedFrame = view.convert(JUICYFrame, from: nil)
        let JUICYIntersection = view.bounds.intersection(JUICYConvertedFrame)
        let JUICYBottomInset = notification.name == UIResponder.keyboardWillHideNotification
        ? 0
        : max(0, JUICYIntersection.height - view.safeAreaInsets.bottom) + 24
        
        UIView.animate(withDuration: JUICYDuration) {
            self.JUICYScrollContainer.contentInset.bottom = JUICYBottomInset
            self.JUICYScrollContainer.verticalScrollIndicatorInsets.bottom = JUICYBottomInset
            self.view.layoutIfNeeded()
        }
        
        guard let JUICYFocusedField else { return }
        let JUICYFocusedRect = JUICYFocusedField.convert(JUICYFocusedField.bounds, to: JUICYScrollContainer)
        JUICYScrollContainer.scrollRectToVisible(JUICYFocusedRect.insetBy(dx: 0, dy: -20), animated: true)
    }
    
    @objc private func JUICYPresentAvatarSheet() {
        view.endEditing(true)
        JUICYSheetMaskView.isHidden = false
        JUICYAvatarSheetView.isHidden = false
        JUICYAvatarSheetBottomConstraint?.constant = -14
        
        UIView.animate(withDuration: 0.25) {
            self.JUICYSheetMaskView.alpha = 1
            self.JUICYAvatarSheetView.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func JUICYDismissAvatarSheet() {
        JUICYAvatarSheetBottomConstraint?.constant = 220
        UIView.animate(withDuration: 0.22, animations: {
            self.JUICYSheetMaskView.alpha = 0
            self.JUICYAvatarSheetView.alpha = 0
            self.view.layoutIfNeeded()
        }) { _ in
            self.JUICYSheetMaskView.isHidden = true
            self.JUICYAvatarSheetView.isHidden = true
        }
    }
    
    @objc private func JUICYOpenCamera() {
        JUICYDismissAvatarSheet()
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            JUICOYshowMessage("Camera is unavailable on this device.")
            JUICYOpenAlbum()
            return
        }
        JUICYPresentImagePicker(sourceType: .camera)
    }
    
    @objc private func JUICYOpenAlbum() {
        JUICYDismissAvatarSheet()
        JUICYPresentImagePicker(sourceType: .photoLibrary)
    }
    
    private func JUICYPresentImagePicker(sourceType: UIImagePickerController.SourceType) {
        let JUICYPicker = UIImagePickerController()
        JUICYPicker.delegate = self
        JUICYPicker.sourceType = sourceType
        present(JUICYPicker, animated: true)
    }
    
    @objc private func JUICYHandleSignup() {
        view.endEditing(true)
        
        let JUICYName = JUICYNameField.textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let JUICYEmail = JUICYEmailField.textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let JUICYPassword = JUICYPasswordField.textField.text ?? ""
        
        guard JUICYName.isEmpty == false, JUICYEmail.isEmpty == false, JUICYPassword.isEmpty == false else {
            JUICOYshowMessage("Please complete your name, email and password.")
            return
        }
        
        guard JUICYEmail.contains("@"), JUICYPassword.count >= 6 else {
            JUICOYshowMessage("Please enter a valid email and a password with at least 6 characters.")
            return
        }
        
        guard JuicoyAccountManager.isUserExists(email: JUICYEmail) == false else {
            JUICOYshowMessage("This account already exists.")
            return
        }
        
        JUICOYbeginLoad()
        JuicoyAccountManager.registerNewUser(email: JUICYEmail, name: JUICYName, password: JUICYPassword, avatarImage: JUICYSelectedAvatarImage)
        let JUICYAuthResult = JuicoyDataFactory.JuicoySharedInstance.JuicoyExecuteLogin(email: JUICYEmail, pass: JUICYPassword, isCreateAction: false)
        JUICOYDismissLoad()
        
        guard JUICYAuthResult == 0 else {
            JUICOYshowMessage("We couldn't finish your registration. Please try again.")
            return
        }
        
        dismiss(animated: true) {
            self.JUICYCompletionRelay?()
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let JUICYImage = (info[.editedImage] ?? info[.originalImage]) as? UIImage {
            JUICYSelectedAvatarImage = JUICYImage
            JUICYAvatarPreview.image = JUICYImage
            JUICYAvatarPreview.isHidden = false
            JUICYAvatarPlusLabel.isHidden = true
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

extension JUICOYRegisterPulseController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case JUICYNameField.textField:
            JUICYEmailField.textField.becomeFirstResponder()
        case JUICYEmailField.textField:
            JUICYPasswordField.textField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
            JUICYHandleSignup()
        }
        return true
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
        DispatchQueue.main.async {
            if let indiview = self.view.viewWithTag(99999) as? UIActivityIndicatorView {
                indiview.stopAnimating()
            }
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
