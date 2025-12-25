//
//  JuicoyMotionClarity.swift
//  JuicoyZer
//
//  Created by  on 2025/12/24.
//

import UIKit

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
class JUICOYMotionClarity: UIViewController {
    
    
    private let JUICYMotionStageContainer: UIImageView = {
        let JUICOY = UIImageView.init(image: UIImage.init(named: "juicoyBodyLinearity"))
        JUICOY.frame = UIScreen.main.bounds
        return JUICOY
    }()
    
    
    private let JUICYELUASpinButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setImage(UIImage(named: "juicoyDynamicTransition"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(juicoyELUASoul), for: .touchUpInside)
        return JUICYbutton
    }()
    
    
    
    private let JUICYMainHeadingLabel:  UIImageView = {
        let JUICOYview = UIImageView.init(image: UIImage.init(named: "juicoyMomentumShift"))
        JUICOYview.contentMode = .scaleAspectFill
        JUICOYview.translatesAutoresizingMaskIntoConstraints = false
        return JUICOYview
    }()
    
   
    
  
    private let JUICYEmailTextField: UITextField = {
        let JUICOYfield = UITextField()
        JUICOYfield.textColor = .white
        JUICOYfield.placeholder = "Enter Email"
        JUICOYfield.font = UIFont.systemFont(ofSize: 17)
        JUICOYfield.translatesAutoresizingMaskIntoConstraints = false
        let JUICYIconView = UIImageView(image: UIImage(named: "juicoyMovementDialect"))
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
        field.textColor = .white
        field.placeholder = "Enter Password"
        field.font = UIFont.systemFont(ofSize: 17)
        field.translatesAutoresizingMaskIntoConstraints = false
        
        let JUICYLeftIcon = UIImageView(image: UIImage(named: "juicoyFlowContinuity"))
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
        JUICYbutton.setBackgroundImage(UIImage(named: "JUICOYlogin"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(juicoyMovementSoul), for: .touchUpInside)
        return JUICYbutton
    }()
    
    
    
    private let JUICYcircleSpinButton: UIButton = {
        let JUICYbutton = UIButton()
       
        JUICYbutton.setImage(UIImage(named: "juicoyPoleAlignment"), for: .normal)
        JUICYbutton.setImage(UIImage(named: "juicoyHoldStability"), for: .selected)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        JUICYbutton.addTarget(self, action: #selector(juicoyArtisticEssence(jiucoy:)), for: .touchUpInside)
        
        return JUICYbutton
    }()
    private let JUICYagreenbyTitle: UILabel = {
        let JUICYlabel = UILabel()
        JUICYlabel.text = "By continuing, you agree to our"
        JUICYlabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        JUICYlabel.textColor = .white
        JUICYlabel.translatesAutoresizingMaskIntoConstraints = false
        return JUICYlabel
    }()
    
    private let JUICYtermButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setTitle("Terms of Service", for: .normal)
        JUICYbutton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        JUICYbutton.setTitleColor(.white, for: .normal)
        JUICYbutton.addTarget(self, action: #selector(juicoyMotionFeeling), for: .touchUpInside)
        
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        return JUICYbutton
    }()
    
    
    private let JUICYpriButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setTitle("Privacy service", for: .normal)
        JUICYbutton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        JUICYbutton.setTitleColor(.white, for: .normal)
        JUICYbutton.addTarget(self, action: #selector(juicoyArtisticLayer), for: .touchUpInside)
        
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        return JUICYbutton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        JUICYInitializeSpinInterface()
        JUICOYaddLoadingViewONSurface()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      
    
    }
    
    private func JUICYInitializeSpinInterface() {
         
        view.addSubview(JUICYMotionStageContainer)
        
        view.addSubview(JUICYMainHeadingLabel)
        view.addSubview(JUICYELUASpinButton)
       
        view.addSubview(JUICYEmailTextField)
        
      
        view.addSubview(JUICYPasswordTextField)
        view.addSubview(JUICYContinueSpinButton)
        
      
        view.addSubview(JUICYcircleSpinButton)
        view.addSubview(JUICYagreenbyTitle)
        view.addSubview(JUICYtermButton)
        view.addSubview(JUICYpriButton)
      
        
        
        NSLayoutConstraint.activate([
          
            JUICYELUASpinButton.widthAnchor.constraint(equalToConstant: 40),
            JUICYELUASpinButton.heightAnchor.constraint(equalToConstant: 30),
            JUICYELUASpinButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -15),
            JUICYELUASpinButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: JUICOYalltotalTop + 40),
        
            JUICYMainHeadingLabel.topAnchor.constraint(equalTo: JUICYELUASpinButton.bottomAnchor, constant:70),
            JUICYMainHeadingLabel.widthAnchor.constraint(equalToConstant: 198),
            JUICYMainHeadingLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            JUICYMainHeadingLabel.heightAnchor.constraint(equalToConstant: 124),
              
         
            JUICYEmailTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor,constant: 0),
            JUICYEmailTextField.widthAnchor.constraint(equalToConstant: 300),
            JUICYEmailTextField.topAnchor.constraint(equalTo: JUICYMainHeadingLabel.bottomAnchor,constant: 70),
            JUICYEmailTextField.heightAnchor.constraint(equalToConstant: 56),
            
            
            JUICYPasswordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor,constant: 0),
            JUICYPasswordTextField.widthAnchor.constraint(equalToConstant: 300),
            JUICYPasswordTextField.topAnchor.constraint(equalTo: JUICYEmailTextField.bottomAnchor,constant: 33),
            JUICYPasswordTextField.heightAnchor.constraint(equalToConstant: 56),
            
            
            JUICYContinueSpinButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor,constant: 0),
            JUICYContinueSpinButton.widthAnchor.constraint(equalToConstant: 300),
            JUICYContinueSpinButton.topAnchor.constraint(equalTo: JUICYPasswordTextField.bottomAnchor,constant: 38),
            JUICYContinueSpinButton.heightAnchor.constraint(equalToConstant: 55),
            
            
            JUICYcircleSpinButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 25),
            JUICYcircleSpinButton.widthAnchor.constraint(equalToConstant: 25),
            JUICYcircleSpinButton.heightAnchor.constraint(equalToConstant: 25),
            JUICYcircleSpinButton.bottomAnchor.constraint(equalTo:self.view.bottomAnchor ,constant: -self.view.safeAreaInsets.bottom - 35),
            
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


extension JUICOYMotionClarity{
    @objc private func juicoyELUASoul() {
        let eluai = JUICYLegalAgreementViewController.init(JUICYContentType: .eula)
        eluai.modalPresentationStyle = .overCurrentContext
        self.present(eluai, animated: true)
    }
     //log
    @objc private func juicoyMovementSoul() {
        guard  JUICYLegalAgreementViewController.JUICYAIFAgree == false else{
            self.JUICOYshowMessage("Please read and agree our terms and service!")
            return
        }
        
        JUICOYbeginLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: DispatchWorkItem(block: {
            UserDefaults.standard.set(true, forKey: "JUICOYlogin")
            self.JUICOYshowMessage("Log in successful!")
            self.JUICOYDismissLoad()
            (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = JuicoyTabarcontroller()
        }))
    }
    
 
    //
    @objc private func juicoyArtisticEssence(jiucoy:UIButton) {
        jiucoy.isSelected = !jiucoy.isSelected
    }
    
    
    @objc private func juicoyMotionFeeling() {
        let eluai = JUICYLegalAgreementViewController.init(JUICYContentType: .termsOfService)
        eluai.modalPresentationStyle = .overCurrentContext
        self.present(eluai, animated: true)
    }
    
    
    @objc private func juicoyArtisticLayer() {
        let eluai = JUICYLegalAgreementViewController.init(JUICYContentType: .privacyPolicy)
        eluai.modalPresentationStyle = .overCurrentContext
        self.present(eluai, animated: true)
    }
}


//Juicy文案素材
//
//视频动态
//Strength feels different when you’re upside down.
//Some days it’s flow, some days it’s just holding on.
//This took way more effort than the video shows.
//Pole taught me patience before it taught me tricks.
//Not trying to be perfect — just trying again.
//Every bruise has a story, and most of them start with “almost.”
//I stopped doubting my body when I learned how much it could carry.
//Grace isn’t lightness. It’s control.
//Falling, climbing, repeating — that’s the practice.
//Still learning how to trust my grip and my mind at the same time.
//
//
//知识库（配三张图
//Pole Dance — Grip, Not Panic Content:
//Grip in pole dance isn’t about squeezing as hard as possible. It’s about knowing when to engage and when to relax. A calm, responsive grip gives you better control, smoother spins, and way less wasted energy.
//
//Pole Dance Inverts: Built, Not Rushed Content:
//In pole dance, inverts don’t come from throwing yourself upside down. They come from strong shoulders, an active core, and patience. Slow progress builds cleaner lines and a lot more confidence in the air.
//
//Flow Mode: Pole Dance in Control Content:
//Pole dance flow happens when strength meets awareness. Slowing your transitions, feeling each weight shift, and breathing through movement turns separate tricks into something that feels connected and effortless.


extension UIViewController{
    
    func JUICOYaddLoadingViewONSurface()  {
        let Surfaceloading = UIActivityIndicatorView(style: .large)
        Surfaceloading.hidesWhenStopped = true
        Surfaceloading.tag = 99999
        Surfaceloading.color = .darkGray
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
