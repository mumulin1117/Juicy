//
//  JuicoyMotionDeepController.swift
//  JuicoyZer
//
//  Created by mumu on 2025/12/29.
//

import UIKit
import AVFoundation

class JuicoyMotionDeepController: JuicoySeconedViewController, JuicoyInsightInteractionDelegate, JuicoyDialogueInteractionDelegate {
  ////评论
    func JuicoyDidUpdateTalkCount(JuicoyNewTotal: Int) {
        
    }
    
    func JuicoyDidSelectNewArchive(JuicoyData: [String : String]) {
        print("change video")
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
        let JuicoyImg = UIImageView(image: UIImage(named: "JuicoyUserDefault"))
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
        JuicoyLab.text = "David James"
        JuicoyLab.textColor = .white
        JuicoyLab.font = .systemFont(ofSize: 18, weight: .bold)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    
    private lazy var JuicoyGoCallPulse: UIButton = {
        let JuicoyBtn = UIButton()
        JuicoyBtn.setImage(UIImage(named: "JUICOYvideocall"), for: .normal)
        JuicoyBtn.addTarget(self, action: #selector(JuicoyGoCallPulseTo), for: .touchUpInside)
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyBtn
    }()
    
    @objc func JuicoyGoCallPulseTo()  {
        
    }

    private let JuicoyBioScript: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.text = "A quiet moment where strength, balance, and flow come together."
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

    
   @objc func toJuicoyDrawerTrigger()  {
       let moaler = JuicoyInsightPanelController.init()
       moaler.modalPresentationStyle = .overCurrentContext
       moaler.JuicoyInteractionDelegate = self
       self.present(moaler, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        JuicoyInitiatePlayback()
        JuicoyAssembleScene()
        
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
    //more
//    override func JuicoyonRightBarButtonTapped(){
//        
//    }
    //comment
   @objc func toJuicoyCommentUnit()  {
       let moaler = JuicoyDialoguePanelController.init()
       moaler.modalPresentationStyle = .overCurrentContext
       moaler.JuicoyDelegate = self
       self.present(moaler, animated: true)
    }
    //gift
    @objc func toJuicoyGiftUnit()  {
        let moaler = JuicoyTributePanelController.init()
        moaler.modalPresentationStyle = .overCurrentContext
        moaler.JuicoyDelegate = self
        self.present(moaler, animated: true)
     }
    
    
    private func JuicoyAssembleScene() {
        let moreimh = UIImage(named: "jocoymoieh")
      
        self.JuicoyaddRightBarButton(image:moreimh )
         
        view.addSubview(JuicoySidebarStack)
        view.addSubview(JuicoyNarrativeBase)
        view.addSubview(JuicoyPlaybackTrigger)
        view.addSubview(JuicoyProgressRail)
        view.addSubview(JuicoyDrawerTrigger)
        
        JuicoyNarrativeBase.addSubview(JuicoyCreatorName)
        JuicoyNarrativeBase.addSubview(JuicoyGoCallPulse)
        JuicoyNarrativeBase.addSubview(JuicoyBioScript)
        
        let JuicoyLikeUnit = JuicoyBuildMetric(JuicoyIcon: "budianzanJUICOY", JuicoyCount: "235", JuicoyColor: .systemRed)
        let JuicoyCommentUnit = JuicoyBuildMetric(JuicoyIcon: "JUICOYbianmore", JuicoyCount: "112", JuicoyColor: .white)
        JuicoyCommentUnit.addTarget(self, action: #selector(toJuicoyCommentUnit), for: .touchUpInside)
        let JuicoyGiftUnit = JuicoyBuildMetric(JuicoyIcon: "JUICOYgift", JuicoyCount: "Gift", JuicoyColor: .systemPink)
        JuicoyGiftUnit.addTarget(self, action: #selector(toJuicoyGiftUnit), for: .touchUpInside)
        
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
        
        JuicoySetupDrawerLabel()
        
    }

    private func JuicoyBuildMetric(JuicoyIcon: String, JuicoyCount: String, JuicoyColor: UIColor) -> UIButton {
        let JuicoyContainer = UIButton()
        let JuicoyImg = UIImageView(image: UIImage(named: JuicoyIcon))
        JuicoyImg.tintColor = JuicoyColor
        JuicoyImg.contentMode = .scaleAspectFit
        
        let JuicoyLab = UILabel()
        JuicoyLab.text = JuicoyCount
        JuicoyLab.textColor = .white
        JuicoyLab.font = .systemFont(ofSize: 12, weight: .medium)
        
        JuicoyContainer.addSubview(JuicoyImg)
        JuicoyContainer.addSubview(JuicoyLab)
        
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            JuicoyImg.topAnchor.constraint(equalTo: JuicoyContainer.topAnchor),
            JuicoyImg.centerXAnchor.constraint(equalTo: JuicoyContainer.centerXAnchor),
            JuicoyImg.widthAnchor.constraint(equalToConstant: 30),
            JuicoyImg.heightAnchor.constraint(equalToConstant: 30),
            
            JuicoyLab.topAnchor.constraint(equalTo: JuicoyImg.bottomAnchor, constant: 4),
            JuicoyLab.centerXAnchor.constraint(equalTo: JuicoyContainer.centerXAnchor),
            JuicoyLab.bottomAnchor.constraint(equalTo: JuicoyContainer.bottomAnchor)
        ])
        
//        let JuicoyTap = UITapGestureRecognizer(target: self, action: #selector(JuicoyMetricInteract(_:)))
//        JuicoyContainer.addGestureRecognizer(JuicoyTap)
        
        return JuicoyContainer
    }

    private func JuicoySetupDrawerLabel() {
        let JuicoyStack = UIStackView()
        JuicoyStack.axis = .horizontal
        JuicoyStack.spacing = 8
        JuicoyStack.translatesAutoresizingMaskIntoConstraints = false
        
        let JuicoyIcon = UIImageView(image: UIImage(systemName: "rectangle.stack.fill"))
        JuicoyIcon.tintColor = .lightGray
        
        let JuicoyLab = UILabel()
        JuicoyLab.text = "Recommend more videos"
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
        guard let JuicoyPath = Bundle.main.path(forResource: "@gbserikaa-2025-12-11_0915-poledance-7582650161252371734", ofType: "mp4") else { return }
        let JuicoyURL = URL(fileURLWithPath: JuicoyPath)
        let JuicoyItem = AVPlayerItem(url: JuicoyURL)
        
        JuicoyQueueOperator = AVQueuePlayer(playerItem: JuicoyItem)
        JuicoyLoopEngine = AVPlayerLooper(player: JuicoyQueueOperator!, templateItem: JuicoyItem)
        
        JuicoyMediaStage = AVPlayerLayer(player: JuicoyQueueOperator)
        JuicoyMediaStage?.videoGravity = .resizeAspectFill
        JuicoyMediaStage?.frame = view.bounds
        self.view.layer.addSublayer(JuicoyMediaStage!)
        JuicoySyncProgress()
                
                
        NotificationCenter.default.addObserver(self, selector: #selector(JuicoyReplaySequence), name: .AVPlayerItemDidPlayToEndTime, object: JuicoyItem)
               
        JuicoyQueueOperator?.play()
    }

//    @objc private func JuicoyMetricInteract(_ sender: UITapGestureRecognizer) {
//        let JuicoyPulse = UIImpactFeedbackGenerator(style: .light)
//        JuicoyPulse.impactOccurred()
//        
//        UIView.animate(withDuration: 0.1, animations: {
//            sender.view?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
//        }) { _ in
//            UIView.animate(withDuration: 0.1) {
//                sender.view?.transform = .identity
//            }
//        }
//    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        JuicoyQueueOperator?.pause()
    }
    
    
}
