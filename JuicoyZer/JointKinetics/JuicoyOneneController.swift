//
//  JuicoyOneneController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/24.
//

import UIKit

class JuicoyOneneController: JuicoyBasicController, UICollectionViewDelegate , JuicoyExternalNexusControllerDelegate, JuicoyMotionDeepControllerdelegate {
   
    private lazy var JuicoyMainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
      
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()

    private lazy var JuicoyScrollContentView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    
    func JuicoyupdateJuicoyStorageModel(model: JuicoyStorageModel) {
        if let JuicoyTargetIndex = self.cardsModels.firstIndex(where: { $0.JuicoyIdentifier == model.JuicoyIdentifier }) {
                
              
                self.cardsModels[JuicoyTargetIndex] = model
                
               
            }
      
    }
    private var cardsModels:Array<JuicoyStorageModel>  = Array<JuicoyStorageModel>()
    
    private var randomuserModels:Array<JuicoyStorageModel>  = Array<JuicoyStorageModel>()
    
    
    @objc func JuicoyonRightBarButtonTapped() {
        self.navigationController?.pushViewController(JuicoyAlertReportController(), animated: true)
    }
   
    private func JuicoyRefreshDynamicStream() {
      
        let JuicoyPool = JuicoyDataFactory.JuicoySharedInstance.JuicoyObtainCachedPayload().filter {
            !$0.JuicoyMediaCover.isEmpty
        }
     
        let JuicoyShuffledPool = JuicoyPool.shuffled()
        
        let JuicoyRandomCount = Int.random(in: 5...min(7, JuicoyShuffledPool.count))
        
       
        self.cardsModels = Array(JuicoyShuffledPool.prefix(JuicoyRandomCount))
        randomuserModels = Array(JuicoyDataFactory.JuicoySharedInstance.JuicoyObtainCachedPayload().shuffled().suffix(8))
    }
    
  
    @objc func observeJuicoyUserBlacklisted() {
        JuicoyRefreshDynamicStream()
        self.JuicoyConfigureCards()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: DispatchWorkItem(block: {
            self.JUICOYDismissLoad()
            self.JuicoyBottomCollectionView.reloadData()
        }))
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        JUICOYbeginLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(observeJuicoyUserBlacklisted), name: NSNotification.Name("JuicoyUserBlacklisted"), object: nil)
        JuicoyRefreshDynamicStream()
        view.addSubview(JUICYMotionStageContainer)
        view.addSubview(JUICYAddSpinButton)
        view.addSubview(JuicoyMainScrollView)
        JuicoyMainScrollView.addSubview(JuicoyScrollContentView)
        
       
        JuicoyScrollContentView.addSubview(JUICYPoleSpinButton)
        JuicoyScrollContentView.addSubview(JUICYPoleLoveButton)
        JuicoyScrollContentView.addSubview(JuicoyCardContainerView)
        JuicoyScrollContentView.addSubview(JUICYrecommendsr)
        JuicoyScrollContentView.addSubview(JuicoyBottomCollectionView)
        
        JUICOYconstrainet()
        JUICOYaddLoadingViewONSurface()
    }
    
    private var isJuicoyInitialLayoutDone = false

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // 只有在第一次确定了尺寸且模型不为空时才配置
        if !isJuicoyInitialLayoutDone && JuicoyCardContainerView.bounds.width > 0 && !cardsModels.isEmpty {
            JuicoyConfigureCards()
            isJuicoyInitialLayoutDone = true
        }
    }
    func JUICOYconstrainet() {
        // 适配比例因子（沿用上一条建议的比例适配，确保视觉统一）
        let ratio = UIScreen.main.bounds.width / 375.0
        func f(_ v: CGFloat) -> CGFloat { return v * ratio }

        NSLayoutConstraint.activate([
            JUICYMotionStageContainer.centerXAnchor.constraint(equalTo: JuicoyScrollContentView.centerXAnchor),
            JUICYMotionStageContainer.widthAnchor.constraint(equalToConstant: f(69)),
            JUICYMotionStageContainer.heightAnchor.constraint(equalToConstant: f(30)),
            JUICYMotionStageContainer.topAnchor.constraint(equalTo: self.view.topAnchor, constant: JUICOYtopSafeAreaHeight + f(14)),
            
            JUICYAddSpinButton.widthAnchor.constraint(equalToConstant: f(35)),
            JUICYAddSpinButton.heightAnchor.constraint(equalToConstant: f(35)),
            JUICYAddSpinButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -f(19)),
            JUICYAddSpinButton.centerYAnchor.constraint(equalTo: JUICYMotionStageContainer.centerYAnchor),
            // ScrollView 占据全屏
            JuicoyMainScrollView.topAnchor.constraint(equalTo: JUICYAddSpinButton.bottomAnchor,constant: 5),
            JuicoyMainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyMainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyMainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // ContentView 约束（决定滚动范围的关键）
            JuicoyScrollContentView.topAnchor.constraint(equalTo: JuicoyMainScrollView.topAnchor),
            JuicoyScrollContentView.leadingAnchor.constraint(equalTo: JuicoyMainScrollView.leadingAnchor),
            JuicoyScrollContentView.trailingAnchor.constraint(equalTo: JuicoyMainScrollView.trailingAnchor),
            JuicoyScrollContentView.bottomAnchor.constraint(equalTo: JuicoyMainScrollView.bottomAnchor),
            JuicoyScrollContentView.widthAnchor.constraint(equalTo: JuicoyMainScrollView.widthAnchor),
            
         
            JUICYPoleSpinButton.leadingAnchor.constraint(equalTo: JuicoyScrollContentView.leadingAnchor, constant: f(15)),
            JUICYPoleSpinButton.heightAnchor.constraint(equalToConstant: f(83)),
            JUICYPoleSpinButton.topAnchor.constraint(equalTo: JuicoyScrollContentView.topAnchor, constant: f(15)),
            JUICYPoleSpinButton.widthAnchor.constraint(equalTo: JUICYPoleLoveButton.widthAnchor),
            
            JUICYPoleLoveButton.leadingAnchor.constraint(equalTo: JUICYPoleSpinButton.trailingAnchor, constant: 15),
            JUICYPoleLoveButton.trailingAnchor.constraint(equalTo: JuicoyScrollContentView.trailingAnchor, constant: -f(15)),
            JUICYPoleLoveButton.heightAnchor.constraint(equalToConstant: f(83)),
            JUICYPoleLoveButton.topAnchor.constraint(equalTo: JuicoyScrollContentView.topAnchor, constant: f(15)),
           
            JuicoyCardContainerView.leadingAnchor.constraint(equalTo: JuicoyScrollContentView.leadingAnchor, constant: f(15)),
            JuicoyCardContainerView.trailingAnchor.constraint(equalTo: JuicoyScrollContentView.trailingAnchor, constant: -f(15)),
            JuicoyCardContainerView.topAnchor.constraint(equalTo: JUICYPoleSpinButton.bottomAnchor, constant: f(55)),
           
            JuicoyCardContainerView.heightAnchor.constraint(equalToConstant: f( UIScreen.main.bounds.height > 700 ? 380 : 300)),
            
            JUICYrecommendsr.widthAnchor.constraint(equalToConstant: f(130)),
            JUICYrecommendsr.heightAnchor.constraint(equalToConstant: f(21)),
            JUICYrecommendsr.leadingAnchor.constraint(equalTo: JuicoyScrollContentView.leadingAnchor, constant: f(15)),
            JUICYrecommendsr.topAnchor.constraint(equalTo: JuicoyCardContainerView.bottomAnchor, constant: f(20)),
            
            JuicoyBottomCollectionView.heightAnchor.constraint(equalToConstant: f(98)),
            JuicoyBottomCollectionView.leadingAnchor.constraint(equalTo: JuicoyScrollContentView.leadingAnchor),
            JuicoyBottomCollectionView.trailingAnchor.constraint(equalTo: JuicoyScrollContentView.trailingAnchor),
            JuicoyBottomCollectionView.topAnchor.constraint(equalTo: JUICYrecommendsr.bottomAnchor, constant: f(15)),
            
            // 非常重要：最后一个控件的 bottom 必须连接到 ContentView 的 bottom
            JuicoyBottomCollectionView.bottomAnchor.constraint(equalTo: JuicoyScrollContentView.bottomAnchor, constant: -f(40))
        ])
    }
    private lazy var  JUICYMotionStageContainer: UIImageView = {
        let JUICOY = UIImageView.init(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JuicyTitle"))
        JUICOY.translatesAutoresizingMaskIntoConstraints = false
        return JUICOY
    }()
    
    
    private lazy var  JUICYAddSpinButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyCreate"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(juicoyADDSoul), for: .touchUpInside)
        return JUICYbutton
    }()
    
    
    
    private lazy var JUICYPoleSpinButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setBackgroundImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyAI"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(juicoyPoleAI), for: .touchUpInside)
        return JUICYbutton
    }()
    
    private lazy var JUICYPoleLoveButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setBackgroundImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyFaverite"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(juicoyMayfavirateAI), for: .touchUpInside)
        return JUICYbutton
    }()
    
    
    private lazy var JuicoyCardContainerView :UIView = {
        let JUICOY = UIView.init()
        JUICOY.translatesAutoresizingMaskIntoConstraints = false
        return JUICOY
    }()
    
    private lazy var  JUICYrecommendsr: UIImageView = {
        let JUICOY = UIImageView.init(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyGuHand"))
        JUICOY.translatesAutoresizingMaskIntoConstraints = false
        return JUICOY
    }()
    private  lazy var JuicoyBottomCollectionView: UICollectionView = {
        let JuicoyLayout = UICollectionViewFlowLayout()
        
        JuicoyLayout.scrollDirection = .horizontal
        JuicoyLayout.minimumLineSpacing = 24
        JuicoyLayout.itemSize = CGSize(width:20 + 204, height: 98)
        JuicoyLayout.minimumInteritemSpacing = 24
        
        let   JuicoyBottomCollectionView = UICollectionView(frame: .zero, collectionViewLayout: JuicoyLayout)
        JuicoyBottomCollectionView.backgroundColor = .clear
        JuicoyBottomCollectionView.showsHorizontalScrollIndicator = false
        JuicoyBottomCollectionView.register(JuicoyCreatorCell.self, forCellWithReuseIdentifier: "JuicoyCreatorCell")
        JuicoyBottomCollectionView.dataSource = self
        JuicoyBottomCollectionView.delegate = self
        JuicoyBottomCollectionView.translatesAutoresizingMaskIntoConstraints = false
       
        return JuicoyBottomCollectionView
    }()
    
    
    private var JuicoyCardViews: [JuicoyMovementCardView] = []
    
    
    @objc private func juicoyPoleAI() {
        self.navigationController?.pushViewController(JuicoyDanceAibuyController(), animated: true)
    }
    
    @objc private func juicoyMayfavirateAI() {
        self.navigationController?.pushViewController(JuicoyAestheticFavController(), animated: true)
        
    }
    
    @objc private func juicoyADDSoul() {
        self.navigationController?.pushViewController(JuicoyVideoPostController(), animated: true)
    }
    private var JuicoyCardOriginalCenter: CGPoint = .zero
    private let JuicoyCardSpacing: CGFloat = -12
   

    private func JuicoyConfigureCards() {
        JuicoyScrollContentView.layoutIfNeeded()
           
        JuicoyCardContainerView.layoutIfNeeded()
        JuicoyCardViews.forEach { $0.removeFromSuperview() }
        JuicoyCardViews.removeAll()
        
        if JuicoyCardContainerView.bounds.width == 0 {
            
            return
            
        }
        for JuicoyIndex in (0..<cardsModels.count).reversed() {
            let JuicoyCard = JuicoyMovementCardView(frame: JuicoyCardContainerView.bounds)
            JuicoyCard.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            JuicoyCard.isUserInteractionEnabled = true
            JuicoyCard.layer.cornerRadius = 10
            JuicoyCard.JUICYmainfreverr(loie: cardsModels[JuicoyIndex])
           
            JuicoyCard.transform = CGAffineTransform(translationX: 0, y: CGFloat(JuicoyIndex) * JuicoyCardSpacing)
            JuicoyCard.alpha = JuicoyIndex == 0 ? 1 : 0.9
            JuicoyCard.tag = JuicoyIndex
            JuicoyCard.JuicoyWatchButton.tag = JuicoyIndex
            JuicoyCard.addTarget(self, action: #selector(JuicoyOpenDetail(juiocyTa:)), for: .touchUpInside)
            JuicoyCard.JuiaddButton.addTarget(self, action: #selector(toJOUICY(juicoy:)), for: .touchUpInside)
            JuicoyCard.JuicoyWatchButton.addTarget(self, action: #selector(JuicoyOpenDetail(juiocyTa:)), for: .touchUpInside)
            JuicoyCard.JuicoyMoreButton.addTarget(self, action: #selector(JuicoyonRightBarButtonTapped), for: .touchUpInside)
            JuicoyCardContainerView.addSubview(JuicoyCard)
            JuicoyCardViews.insert(JuicoyCard, at: 0)
            JuicoyCardContainerView.bringSubviewToFront(JuicoyCard)
        }
        
   
        JuicoyAttachPanToTopCard()
    }

    private func JuicoyAttachPanToTopCard() {
        guard let JuicoyTopCard = JuicoyCardViews.first else { return }
        
     
        JuicoyTopCard.gestureRecognizers?.forEach { JuicoyTopCard.removeGestureRecognizer($0) }
        
        let JuicoyPan = UIPanGestureRecognizer(target: self, action: #selector(JuicoyHandlePan))
        JuicoyTopCard.addGestureRecognizer(JuicoyPan)
        JuicoyPan.cancelsTouchesInView = false
        JuicoyTopCard.isUserInteractionEnabled = true
    }

    @objc private func JuicoyHandlePan(_ JuicoyGesture: UIPanGestureRecognizer) {
        guard let JuicoyTopCard = JuicoyGesture.view else { return }
        let JuicoyTranslation = JuicoyGesture.translation(in: JuicoyCardContainerView)

        switch JuicoyGesture.state {
        case .began:
            JuicoyCardOriginalCenter = JuicoyTopCard.center

        case .changed:
           
            let JuicoyNewX = JuicoyCardOriginalCenter.x + JuicoyTranslation.x
            let JuicoyNewY = JuicoyCardOriginalCenter.y + JuicoyTranslation.y * 0.2
            JuicoyTopCard.center = CGPoint(x: JuicoyNewX, y: JuicoyNewY)
            
           
            let JuicoyRotationAngle = (JuicoyTranslation.x / JuicoyCardContainerView.bounds.width) * 0.4
            JuicoyTopCard.transform = CGAffineTransform(rotationAngle: JuicoyRotationAngle)

        case .ended, .cancelled:
            
        
            let JuicoyVelocity = JuicoyGesture.velocity(in: JuicoyCardContainerView)
            let JuicoyOffsetX = JuicoyTopCard.center.x - JuicoyCardOriginalCenter.x
            
           
            if abs(JuicoyOffsetX) > 120 || abs(JuicoyVelocity.x) > 500 {
                JuicoyAnimateCardDismiss(JuicoyTopCard, direction: JuicoyOffsetX > 0)
            } else {
                JuicoyResetTopCard(JuicoyTopCard)
            }

        default:
            break
        }
    }

    private func JuicoyResetTopCard(_ JuicoyCard: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            JuicoyCard.center = self.JuicoyCardOriginalCenter
            JuicoyCard.transform = .identity
        })
    }

    private func JuicoyAnimateCardDismiss(_ JuicoyCard: UIView, direction: Bool) {
        JuicoyCard.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0.3, animations: {
           
            let JuicoyExitX = direction ? self.view.bounds.width * 1.5 : -self.view.bounds.width * 0.5
            JuicoyCard.center = CGPoint(x: JuicoyExitX, y: JuicoyCard.center.y)
            JuicoyCard.alpha = 0
        }) { _ in
            JuicoyCard.removeFromSuperview()
            if !self.JuicoyCardViews.isEmpty {
                self.JuicoyCardViews.removeFirst()
            }
            if self.JuicoyCardViews.isEmpty {
                        // 如果卡片刷完了，重新获取数据并配置
                        self.JuicoyRefreshDynamicStream() // 重新随机数据
                        self.JuicoyConfigureCards()       // 重新生成卡片视图
                    } else {
                        self.JuicoyPromoteNextCard()
                    }
            
//            self.JuicoyPromoteNextCard()
        }
    }

    private func JuicoyPromoteNextCard() {
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: .allowUserInteraction, animations: {
            for (JuicoyIndex, JuicoyCard) in self.JuicoyCardViews.enumerated() {
               
                JuicoyCard.transform = CGAffineTransform(translationX: 0, y: CGFloat(JuicoyIndex) * self.JuicoyCardSpacing)
                JuicoyCard.alpha = JuicoyIndex == 0 ? 1 : 0.9
            }
        }) { _ in
           
            self.JuicoyAttachPanToTopCard()
        }
    }
    
    @objc private func JuicoyOpenDetail(juiocyTa:UIButton) {
        let data = self.cardsModels[juiocyTa.tag]
        if data.JUICOYUneedVIP == "1" && JuicoyDataFactory.currentUserModel?.JuicoyPremiumStatus == "0" {
            JuicoyShowVipVideoAlert()
            return
        }
        let detailTo = JuicoyMotionDeepController(juicoyModel: data)
       
        
        detailTo.delegate = self
        self.navigationController?.pushViewController(detailTo, animated: true)
       
    }
    

}

   

extension JuicoyOneneController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        randomuserModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let JuicoyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JuicoyCreatorCell", for: indexPath) as! JuicoyCreatorCell
        JuicoyCell.JUICYmainfreverr(loie: randomuserModels[indexPath.row])
        return JuicoyCell
    }
    
   @objc func toJOUICY(juicoy:UIButton) {
      let indexData = cardsModels[juicoy.tag]
       let userdetail = JuicoyExternalNexusController.init(juicoyModel: indexData)
       userdetail.delegate = self
       self.navigationController?.pushViewController(userdetail, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userdetail = JuicoyExternalNexusController.init(juicoyModel: randomuserModels[indexPath.row])
        userdetail.delegate = self
        self.navigationController?.pushViewController(userdetail, animated: true)
        
    }
}
