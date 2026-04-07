//
//  JuicoyMotionDeepController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/29.
//

import UIKit
import AVFoundation
protocol JuicoyMotionDeepControllerdelegate{
    func JuicoyupdateJuicoyStorageModel(model: JuicoyStorageModel)
}
class JuicoyMotionDeepController: JuicoySeconedViewController, JuicoyInsightInteractionDelegate, JuicoyDialogueInteractionDelegate, JuicoyExternalNexusControllerDelegate {
    
    var delegate:JuicoyMotionDeepControllerdelegate?
    
    func JuicoyupdateJuicoyStorageModel(model: JuicoyStorageModel) {
        self.juicoyModel = model
    }
    
    private lazy var JuicoyLikeUnit: JOICOYVioaButton = {
        let JuicoyLikeUnit = JOICOYVioaButton()
        JuicoyLikeUnit.JuicoyImg.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "budianzanJUICOY")
        
        JuicoyLikeUnit.JuicoyLab.text = "0"
        JuicoyLikeUnit.addTarget(self, action: #selector(JuicoyonGiveLikeningButtonTapped), for: .touchUpInside)
        
        return JuicoyLikeUnit
    }()
    
    private lazy var JuicoyCommentUnit: JOICOYVioaButton = {
        let JuicoyLikeUnit = JOICOYVioaButton()
        JuicoyLikeUnit.JuicoyImg.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JUICOYbianmore")
     
        JuicoyLikeUnit.addTarget(self, action: #selector(toJuicoyCommentUnit), for: .touchUpInside)
        return JuicoyLikeUnit
    }()
    
    private lazy var JuicoyGiftUnit: JOICOYVioaButton = {
        let JuicoyGiftUnit = JOICOYVioaButton()
        JuicoyGiftUnit.JuicoyImg.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JUICOYgift")
        JuicoyGiftUnit.JuicoyLab.text = "Gwiyfut".JoicoydeMercrypt()
        
     
        JuicoyGiftUnit.addTarget(self, action: #selector(toJuicoyGiftUnit), for: .touchUpInside)
   
        return JuicoyGiftUnit
    }()
    
    var juicoyModel:JuicoyStorageModel
    init(juicoyModel: JuicoyStorageModel) {
        self.juicoyModel = juicoyModel
        super.init(nibName: nil, bundle: nil)
    }
    
     required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
  ////评论
    func JuicoyDidUpdateTalkCount(JuicoyNewTotal: Int) {
        
    }
    
    func JuicoyDidSelectNewArchive(JuicoyData: JuicoyStorageModel) {
   
        
        self.juicoyModel = JuicoyData
        JuicoyreloadData()
    }
    
    
    private func JuicoyreloadData()  {
        self.JUICOYbeginLoad()
        JuicoyLikeUnit.JuicoyImg.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier:(self.juicoyModel.JuicoyFaverateStatus == "1") ?  "yidianzanJUICOY" : "budianzanJUICOY")
        JuicoyLikeUnit.JuicoyLab.text = (self.juicoyModel.JuicoyFaverateStatus == "1") ?  "1" : "0"
        
        JuicoyBioScript.text = juicoyModel.JuicoyMediaNarration
        JuicoyCreatorName.text = juicoyModel.JuicoyHandle
        JuicoyCreatorAvatar.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: juicoyModel.JuicoyAvatarKey)
        
        JuicoyCommentUnit.JuicoyLab.text = "\(juicoyModel.JuicoyPublicFeedback.count)"
        
        JuicoyInitiatePlayback()
    }

    private var JuicoyMediaStage: AVPlayerLayer?
    private var JuicoyLoopEngine: AVPlayerLooper?
    private var JuicoyQueueOperator: AVQueuePlayer?
    

   
    private let JuicoySidebarStack: UIStackView = {
        let JuicoyStack = UIStackView()
        JuicoyStack.axis = .vertical
        JuicoyStack.spacing = 25
        JuicoyStack.alignment = .center
        JuicoyStack.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyStack
    }()

    private let JuicoyCreatorAvatar: UIImageView = {
        let JuicoyImg = UIImageView( )
        
        JuicoyImg.contentMode = .scaleAspectFill
        JuicoyImg.layer.cornerRadius = 25
        JuicoyImg.clipsToBounds = true
        JuicoyImg.layer.borderWidth = 2
        JuicoyImg.layer.borderColor = UIColor.white.cgColor
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()
    private lazy var JuicoyPlaybackTrigger: UIButton = {
        let JuicoyBtn = UIButton(type: .custom)
        JuicoyBtn.setImage(UIImage(systemName: "play.fill"), for: .selected)
        JuicoyBtn.setImage(UIImage(systemName: "pause.fill"), for: .normal)
       
        JuicoyBtn.tintColor = .white.withAlphaComponent(0.7)
        let JuicoyCfg = UIImage.SymbolConfiguration(pointSize: 50, weight: .bold)
        JuicoyBtn.setPreferredSymbolConfiguration(JuicoyCfg, forImageIn: .selected)
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        JuicoyBtn.addTarget(self, action: #selector(JuicoyTogglePlayback), for: .touchUpInside)
        
        return JuicoyBtn
        
    }()
    private let JuicoyFollowPulse: UIButton = {
        let JuicoyBtn = UIButton(type: .custom)
        JuicoyBtn.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        JuicoyBtn.tintColor = .systemYellow
        JuicoyBtn.backgroundColor = .white
        JuicoyBtn.layer.cornerRadius = 10
        JuicoyBtn.addTarget(self, action: #selector(JuicoyOpenDetail), for: .touchUpInside)
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyBtn
    }()

    private let JuicoyNarrativeBase: UIView = {
        let JuicoyView = UIView()
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    private let JuicoyCreatorName: UILabel = {
        let JuicoyLab = UILabel()
        
        JuicoyLab.textColor = .white
        JuicoyLab.font = .systemFont(ofSize: 18, weight: .bold)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    
    private lazy var JuicoyGoCallPulse: UIButton = {
        let JuicoyBtn = UIButton()
        JuicoyBtn.setImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JUICOYvideocall"), for: .normal)
        JuicoyBtn.addTarget(self, action: #selector(JuicoyGoCallPulseTo), for: .touchUpInside)
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyBtn
    }()
    
    @objc func JuicoyGoCallPulseTo()  {
        let notfriend = NotFriendAlertViewControllerJuicy.init()
        notfriend.modalPresentationStyle = .overCurrentContext
        notfriend.kineticFollowAction = {
            let JuicoyNewPulse = JuicoyFabricMessage(JuicoyContent: "I have sent you a friend request", JuicoyIsLead: false, JuicoyTimestamp: "")
            
          
            JuicoyDataFactory.JuicoySharedInstance.JuicoyPersistNewMessage(to: self.juicoyModel.JuicoyIdentifier, JuicoyMsg: JuicoyNewPulse)
            
            
            self.JUICOYshowMessage("You have successfully sent a friend request to the other party!")
        }
        self.present(notfriend, animated: true, completion: nil)
//        self.navigationController?.pushViewController(JuicoyTeleLinkController.init(juicoyModel: self.juicoyModel), animated: true)
    }

    private let JuicoyBioScript: UILabel = {
        let JuicoyLab = UILabel()
        
        JuicoyLab.textColor = .white
        JuicoyLab.numberOfLines = 2
        JuicoyLab.font = .systemFont(ofSize: 14, weight: .regular)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private let JuicoyProgressRail: UIProgressView = {
        let JuicoyBar = UIProgressView(progressViewStyle: .default)
                
        JuicoyBar.progressTintColor = .white
        JuicoyBar.trackTintColor = .white.withAlphaComponent(0.3)
        JuicoyBar.progress = 0.0
        JuicoyBar.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyBar
    }()
   
    private let JuicoyDrawerTrigger: UIButton = {
        let JuicoyView = UIButton()
        JuicoyView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        JuicoyView.layer.cornerRadius = 20
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        JuicoyView.addTarget(self, action: #selector(toJuicoyDrawerTrigger), for: .touchUpInside)
        return JuicoyView
    }()

  
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(observeJuicoyUserBlacklisted), name: NSNotification.Name("JuicoyUserBlacklisted"), object: nil)
        super.viewDidLoad()
        
        JuicoyAssembleScene()
       
        JuicoyreloadData()
    }
    private var JuicoyTimeObserverToken: Any?
    deinit {
            if let JuicoyToken = JuicoyTimeObserverToken {
                JuicoyQueueOperator?.removeTimeObserver(JuicoyToken)
            }
        }
    private func JuicoySyncProgress() {
            let JuicoyInterval = CMTime(seconds: 0.1, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
            JuicoyTimeObserverToken = JuicoyQueueOperator?.addPeriodicTimeObserver(forInterval: JuicoyInterval, queue: .main) { [weak self] JuicoyTime in
                guard let JuicoySelf = self, let JuicoyItem = JuicoySelf.JuicoyQueueOperator?.currentItem else { return }
                let JuicoyDuration = CMTimeGetSeconds(JuicoyItem.duration)
                if JuicoyDuration.isFinite && JuicoyDuration > 0 {
                    let JuicoyCurrent = CMTimeGetSeconds(JuicoyTime)
                    JuicoySelf.JuicoyProgressRail.setProgress(Float(JuicoyCurrent / JuicoyDuration), animated: true)
                }
            }
        }
    
    @objc private func JuicoyTogglePlayback() {
            guard let JuicoyPlayer = JuicoyQueueOperator else { return }
            if JuicoyPlayer.rate != 0 {
                JuicoyPlayer.pause()
                JuicoyPlaybackTrigger.isSelected = true
            } else {
                JuicoyPlayer.play()
                JuicoyPlaybackTrigger.isSelected = false
            }
        }

        @objc private func JuicoyReplaySequence() {
            JuicoyQueueOperator?.seek(to: .zero)
            JuicoyQueueOperator?.play()
            JuicoyPlaybackTrigger.isSelected = false
        }

        @objc private func JuicoyExitAction() {
            JuicoyQueueOperator?.pause()
            self.navigationController?.popViewController(animated: true)
        }
   
    @objc func JuicoyonGiveLikeningButtonTapped(){
        JuicoyDataFactory.JuicoySharedInstance.JuicoyToggleHearFamos(for: self.juicoyModel.JuicoyIdentifier)
        
        
        JuicoyLikeUnit.isSelected = !JuicoyLikeUnit.isSelected
        JuicoyLikeUnit.JuicoyImg.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier:JuicoyLikeUnit.isSelected ?  "yidianzanJUICOY" : "budianzanJUICOY")
        JuicoyLikeUnit.JuicoyLab.text = JuicoyLikeUnit.isSelected ?  "1" : "0"
        self.juicoyModel.JuicoyFaverateStatus = JuicoyLikeUnit.isSelected ?  "1" : "0"
        self.delegate?.JuicoyupdateJuicoyStorageModel(model: juicoyModel)
        
    }
   
    @objc func toJuicoyCommentUnit() {
            let JUICOY_PanelTarget = JuicoyDialoguePanelController(juicoyModel: self.juicoyModel)
            let JUICOY_ClarityStyle: UIModalPresentationStyle = .overCurrentContext
            
            var JUICOY_FlowPulse: Int = 0
            JUICOY_FlowPulse += 10
            
            self.JUICOY_ExecutePanelDeployment(JUICOY_Panel: JUICOY_PanelTarget, JUICOY_Style: JUICOY_ClarityStyle, JUICOY_Tag: JUICOY_FlowPulse)
        }
        
        @objc func toJuicoyGiftUnit() {
            let JUICOY_TributeTarget = JuicoyTributePanelController()
            let JUICOY_VisualAnchor: UIModalPresentationStyle = .overCurrentContext
            
            let JUICOY_IsActive = true
            if JUICOY_IsActive {
                JUICOY_TributeTarget.modalPresentationStyle = JUICOY_VisualAnchor
                JUICOY_TributeTarget.JuicoyDelegate = self
                
                let JUICOY_AnimateTransition = true
                self.present(JUICOY_TributeTarget, animated: JUICOY_AnimateTransition)
            }
        }
        
        @objc private func JuicoyOpenDetail() {
            let JUICOY_NexusRef = JuicoyExternalNexusController(juicoyModel: self.juicoyModel)
            let JUICOY_StageHost = self.navigationController
            
            JUICOY_NexusRef.delegate = self
            
            let JUICOY_PushMotion = true
            var JUICOY_NavigationDepth = 1
            
            if JUICOY_NavigationDepth > 0 {
                JUICOY_StageHost?.pushViewController(JUICOY_NexusRef, animated: JUICOY_PushMotion)
                JUICOY_NavigationDepth -= 1
            }
        }
        
        @objc func toJuicoyDrawerTrigger() {
            let JUICOY_InsightModule = JuicoyInsightPanelController()
            let JUICOY_OverlayLogic: UIModalPresentationStyle = .overCurrentContext
            
            self.JUICOY_SynchronizeDrawerState(JUICOY_Drawer: JUICOY_InsightModule, JUICOY_Mode: JUICOY_OverlayLogic)
        }
        
        private func JUICOY_ExecutePanelDeployment(JUICOY_Panel: JuicoyDialoguePanelController, JUICOY_Style: UIModalPresentationStyle, JUICOY_Tag: Int) {
            JUICOY_Panel.modalPresentationStyle = JUICOY_Style
            JUICOY_Panel.JuicoyDelegate = self
            
            let JUICOY_DisplayReady = (JUICOY_Tag > 0)
            if JUICOY_DisplayReady {
                self.present(JUICOY_Panel, animated: true)
            }
        }
        
        private func JUICOY_SynchronizeDrawerState(JUICOY_Drawer: JuicoyInsightPanelController, JUICOY_Mode: UIModalPresentationStyle) {
            let JUICOY_InterfaceGuard = true
            
            if JUICOY_InterfaceGuard {
                JUICOY_Drawer.modalPresentationStyle = JUICOY_Mode
                JUICOY_Drawer.JuicoyInteractionDelegate = self
                
                let JUICOY_FadeIn = true
                self.present(JUICOY_Drawer, animated: JUICOY_FadeIn)
            }
        }
        
        @objc func observeJuicoyUserBlacklisted() {
            let JUICOY_CurrentStack = self.navigationController
            let JUICOY_PopVelocity = true
            
            let JUICOY_SignalReceived = Date()
            if JUICOY_SignalReceived.timeIntervalSince1970 > 0 {
                JUICOY_CurrentStack?.popViewController(animated: JUICOY_PopVelocity)
            }
        }
    private func JuicoyAssembleScene() {
        let moreimh = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "jocoymoieh")
       
        self.JuicoyaddRightBarButton(image:moreimh )
         
        view.addSubview(JuicoySidebarStack)
        view.addSubview(JuicoyNarrativeBase)
        view.addSubview(JuicoyPlaybackTrigger)
        view.addSubview(JuicoyProgressRail)
        view.addSubview(JuicoyDrawerTrigger)
        
        JuicoyNarrativeBase.addSubview(JuicoyCreatorName)
        JuicoyNarrativeBase.addSubview(JuicoyGoCallPulse)
        JuicoyNarrativeBase.addSubview(JuicoyBioScript)
        
        
          
        JuicoySidebarStack.addArrangedSubview(JuicoyCreatorAvatar)
        JuicoySidebarStack.addArrangedSubview(JuicoyLikeUnit)
        JuicoySidebarStack.addArrangedSubview(JuicoyCommentUnit)
        JuicoySidebarStack.addArrangedSubview(JuicoyGiftUnit)
        
        view.addSubview(JuicoyFollowPulse)

        NSLayoutConstraint.activate([
            JuicoyPlaybackTrigger.widthAnchor.constraint(equalToConstant: 64),
            JuicoyPlaybackTrigger.heightAnchor.constraint(equalToConstant: 70),
            JuicoyPlaybackTrigger.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            JuicoyPlaybackTrigger.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -80),
            
            JuicoySidebarStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            JuicoySidebarStack.bottomAnchor.constraint(equalTo: JuicoyDrawerTrigger.topAnchor, constant: -40),
            JuicoySidebarStack.widthAnchor.constraint(equalToConstant: 60),
            
            JuicoyCreatorAvatar.widthAnchor.constraint(equalToConstant: 50),
            JuicoyCreatorAvatar.heightAnchor.constraint(equalToConstant: 50),
            
            JuicoyFollowPulse.centerXAnchor.constraint(equalTo: JuicoyCreatorAvatar.centerXAnchor),
            JuicoyFollowPulse.centerYAnchor.constraint(equalTo: JuicoyCreatorAvatar.bottomAnchor),
            JuicoyFollowPulse.widthAnchor.constraint(equalToConstant: 20),
            JuicoyFollowPulse.heightAnchor.constraint(equalToConstant: 20),
            
            JuicoyNarrativeBase.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            JuicoyNarrativeBase.trailingAnchor.constraint(equalTo: JuicoySidebarStack.leadingAnchor, constant: -20),
            JuicoyNarrativeBase.bottomAnchor.constraint(equalTo: JuicoyProgressRail.topAnchor, constant: -15),
            
            JuicoyCreatorName.topAnchor.constraint(equalTo: JuicoyNarrativeBase.topAnchor),
            JuicoyCreatorName.leadingAnchor.constraint(equalTo: JuicoyNarrativeBase.leadingAnchor),
            JuicoyGoCallPulse.leadingAnchor.constraint(equalTo: JuicoyCreatorName.trailingAnchor, constant: 5),
            JuicoyCreatorName.centerYAnchor.constraint(equalTo: JuicoyCreatorName.centerYAnchor),
            JuicoyGoCallPulse.widthAnchor.constraint(equalToConstant: 27),
            JuicoyGoCallPulse.heightAnchor.constraint(equalToConstant: 27),
            
            
            JuicoyBioScript.topAnchor.constraint(equalTo: JuicoyCreatorName.bottomAnchor, constant: 8),
            JuicoyBioScript.leadingAnchor.constraint(equalTo: JuicoyNarrativeBase.leadingAnchor),
            JuicoyBioScript.trailingAnchor.constraint(equalTo: JuicoyNarrativeBase.trailingAnchor),
            JuicoyBioScript.bottomAnchor.constraint(equalTo: JuicoyNarrativeBase.bottomAnchor),
            
            JuicoyProgressRail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            JuicoyProgressRail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            JuicoyProgressRail.bottomAnchor.constraint(equalTo: JuicoyDrawerTrigger.topAnchor, constant: -15),
            JuicoyProgressRail.heightAnchor.constraint(equalToConstant: 2),
            
            JuicoyDrawerTrigger.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            JuicoyDrawerTrigger.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            JuicoyDrawerTrigger.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            JuicoyDrawerTrigger.heightAnchor.constraint(equalToConstant: 45)
        ])
        JUICOYaddLoadingViewONSurface()
        JuicoySetupDrawerLabel()
        
    }

    private func JuicoySetupDrawerLabel() {
        let JuicoyStack = UIStackView()
        JuicoyStack.axis = .horizontal
        JuicoyStack.spacing = 8
        JuicoyStack.translatesAutoresizingMaskIntoConstraints = false
        
        let JuicoyIcon = UIImageView(image: UIImage(systemName: "rectangle.stack.fill"))
        JuicoyIcon.tintColor = .lightGray
        
        let JuicoyLab = UILabel()
        JuicoyLab.text = "Rveycmotmgmnelnodg zmxosraew zvkijdzeioas".JoicoydeMercrypt()
        JuicoyLab.textColor = .white
        JuicoyLab.font = .systemFont(ofSize: 13)
        
        let JuicoyArrow = UIImageView(image: UIImage(systemName: "chevron.up"))
        JuicoyArrow.tintColor = .white
        
        JuicoyStack.addArrangedSubview(JuicoyIcon)
        JuicoyStack.addArrangedSubview(JuicoyLab)
        JuicoyStack.addArrangedSubview(JuicoyArrow)
        
        JuicoyDrawerTrigger.addSubview(JuicoyStack)
        NSLayoutConstraint.activate([
            JuicoyStack.centerXAnchor.constraint(equalTo: JuicoyDrawerTrigger.centerXAnchor),
            JuicoyStack.centerYAnchor.constraint(equalTo: JuicoyDrawerTrigger.centerYAnchor),
            JuicoyIcon.widthAnchor.constraint(equalToConstant: 16),
            JuicoyIcon.heightAnchor.constraint(equalToConstant: 16),
            JuicoyArrow.widthAnchor.constraint(equalToConstant: 12),
            JuicoyArrow.heightAnchor.constraint(equalToConstant: 12)
        ])
    }

    private func JuicoyInitiatePlayback() {
        JuicoyMediaStage?.player?.pause()
        JuicoyMediaStage?.removeFromSuperlayer()
        JuicoyMediaStage?.player = nil
        
  
      
        
        guard let JuicoyURL = JuicoyResPulseArchitect.JuicoyExtractMediaStream(fullIdentifier: juicoyModel.JuicoyMediaUrl + ".mp4") else {
        
            return }

        let JuicoyItem = AVPlayerItem(url: JuicoyURL)
        
        
        JuicoyQueueOperator = AVQueuePlayer(playerItem: JuicoyItem)
        JuicoyLoopEngine = AVPlayerLooper(player: JuicoyQueueOperator!, templateItem: JuicoyItem)
        
        JuicoyMediaStage = AVPlayerLayer(player: JuicoyQueueOperator)
        JuicoyMediaStage?.videoGravity = .resizeAspectFill
        JuicoyMediaStage?.frame = view.bounds
        self.view.layer.insertSublayer(JuicoyMediaStage!, below: JuicoySidebarStack.layer)
        JuicoySyncProgress()
                
                
        NotificationCenter.default.addObserver(self, selector: #selector(JuicoyReplaySequence), name: .AVPlayerItemDidPlayToEndTime, object: JuicoyItem)
               
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: DispatchWorkItem(block: {
            self.JUICOYDismissLoad()
            self.JuicoyQueueOperator?.play()
        }))
       
    }


    
    
}


class JOICOYVioaButton: UIButton {
    
    lazy var JuicoyImg: UIImageView = {
        let JuicoyImg = UIImageView()
       
        JuicoyImg.contentMode = .scaleAspectFit
        return JuicoyImg
    }()
    
    
    lazy var JuicoyLab: UILabel = {
        let JuicoyLab = UILabel()
       
        JuicoyLab.textColor = .white
        JuicoyLab.font = .systemFont(ofSize: 12, weight: .medium)
        return JuicoyLab
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
       
        self.addSubview(JuicoyImg)
        self.addSubview(JuicoyLab)
        
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            JuicoyImg.topAnchor.constraint(equalTo: self.topAnchor),
            JuicoyImg.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            JuicoyImg.widthAnchor.constraint(equalToConstant: 30),
            JuicoyImg.heightAnchor.constraint(equalToConstant: 30),
            
            JuicoyLab.topAnchor.constraint(equalTo: JuicoyImg.bottomAnchor, constant: 4),
            JuicoyLab.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            JuicoyLab.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
