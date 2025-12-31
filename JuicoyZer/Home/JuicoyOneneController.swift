//
//  JuicoyOneneController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/24.
//

import UIKit

class JuicoyOneneController: JuicoyBasicController, UICollectionViewDelegate , JuicoyExternalNexusControllerDelegate, JuicoyMotionDeepControllerdelegate {
    func JuicoyupdateJuicoyStorageModel(model: JuicoyStorageModel) {
        if let JuicoyTargetIndex = self.cardsModels.firstIndex(where: { $0.JuicoyIdentifier == model.JuicoyIdentifier }) {
                
                // 2. 将数组中该位置的数据更新为最新的 model
                self.cardsModels[JuicoyTargetIndex] = model
                
                // 3. 这里的 model 可能是被关注了或者被拉黑了
                // 如果你的 UI 正在显示这个列表，记得刷新
                // self.JuicoyMainGrid.reloadItems(at: [IndexPath(item: JuicoyTargetIndex, section: 0)])
            }
      
    }
    private var cardsModels:Array<JuicoyStorageModel>  = Array<JuicoyStorageModel>()
    
    private var randomuserModels:Array<JuicoyStorageModel>  = Array<JuicoyStorageModel>()
    
    
    @objc func JuicoyonRightBarButtonTapped() {
        self.navigationController?.pushViewController(JuicoyAlertReportController(), animated: true)
    }
   
    private func JuicoyRefreshDynamicStream() {
        // 1. 从工厂获取所有有效数据（带封面的视频）
        let JuicoyPool = JuicoyDataFactory.JuicoySharedInstance.JuicoyObtainCachedPayload().filter {
            !$0.JuicoyMediaCover.isEmpty
        }
        
        // 2. 打乱顺序
        let JuicoyShuffledPool = JuicoyPool.shuffled()
        
        // 3. 随机决定展示的数量（例如 1 到 5 条）
        let JuicoyRandomCount = Int.random(in: 5...min(7, JuicoyShuffledPool.count))
        
        // 4. 更新当前控制器的 cardsModels
        self.cardsModels = Array(JuicoyShuffledPool.prefix(JuicoyRandomCount))
        randomuserModels = Array(JuicoyDataFactory.JuicoySharedInstance.JuicoyObtainCachedPayload().shuffled().suffix(8))
    }
    
    //拉黑刷新数据
    @objc func observeJuicoyUserBlacklisted() {
        JuicoyRefreshDynamicStream()
        self.JuicoyConfigureCards()
        JuicoyBottomCollectionView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(observeJuicoyUserBlacklisted), name: NSNotification.Name("JuicoyUserBlacklisted"), object: nil)
        JuicoyRefreshDynamicStream()
        view.addSubview(JUICYMotionStageContainer)
        view.addSubview(JUICYAddSpinButton)
        view.addSubview(JUICYPoleSpinButton)
        view.addSubview(JUICYPoleLoveButton)
        
        view.addSubview(JuicoyCardContainerView)
        view.addSubview(JUICYrecommendsr)
        view.addSubview(JuicoyBottomCollectionView)
        JUICOYconstrainet()
   
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // 确保只初始化一次，否则每次 layout 都会重新生成卡片
        if JuicoyCardViews.isEmpty {
            JuicoyConfigureCards()
        }
    }
    func JUICOYconstrainet()  {
        NSLayoutConstraint.activate([
            JUICYMotionStageContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            JUICYMotionStageContainer.widthAnchor.constraint(equalToConstant: 69),
            JUICYMotionStageContainer.heightAnchor.constraint(equalToConstant: 30),
            JUICYMotionStageContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: JUICOYtopSafeAreaHeight + 14),
            
            JUICYAddSpinButton.widthAnchor.constraint(equalToConstant: 35),
            JUICYAddSpinButton.heightAnchor.constraint(equalToConstant: 35),
            JUICYAddSpinButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -19),
            JUICYAddSpinButton.centerYAnchor.constraint(equalTo: JUICYMotionStageContainer.centerYAnchor),
            
            JUICYPoleSpinButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            JUICYPoleSpinButton.heightAnchor.constraint(equalToConstant: 83),
            JUICYPoleSpinButton.topAnchor.constraint(equalTo: self.JUICYAddSpinButton.bottomAnchor, constant: 25),
            JUICYPoleSpinButton.widthAnchor.constraint(equalTo: JUICYPoleLoveButton.widthAnchor),
            
            JUICYPoleLoveButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            JUICYPoleLoveButton.heightAnchor.constraint(equalToConstant: 83),
            JUICYPoleLoveButton.topAnchor.constraint(equalTo: self.JUICYAddSpinButton.bottomAnchor, constant: 25),
            
            JuicoyBottomCollectionView.heightAnchor.constraint(equalToConstant: 98),
            JuicoyBottomCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyBottomCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyBottomCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant:-self.view.safeAreaInsets.bottom - (self.tabBarController?.tabBar.frame.height ?? 0) - 20),
           
            JUICYrecommendsr.widthAnchor.constraint(equalToConstant: 130),
            JUICYrecommendsr.heightAnchor.constraint(equalToConstant: 21),
            JUICYrecommendsr.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 15),
            JUICYrecommendsr.bottomAnchor.constraint(equalTo: JuicoyBottomCollectionView.topAnchor, constant: -15),
            
            JuicoyCardContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            JuicoyCardContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            JuicoyCardContainerView.bottomAnchor.constraint(equalTo: JUICYrecommendsr.topAnchor, constant: -15),
            JuicoyCardContainerView.topAnchor.constraint(equalTo: JUICYPoleSpinButton.bottomAnchor, constant: 55)
        ])
    }
    private lazy var  JUICYMotionStageContainer: UIImageView = {
        let JUICOY = UIImageView.init(image: UIImage.init(named: "JuicyTitle"))
        JUICOY.translatesAutoresizingMaskIntoConstraints = false
        return JUICOY
    }()
    
    
    private lazy var  JUICYAddSpinButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setImage(UIImage(named: "juicoyCreate"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(juicoyADDSoul), for: .touchUpInside)
        return JUICYbutton
    }()
    
    
    
    private lazy var JUICYPoleSpinButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setBackgroundImage(UIImage(named: "juicoyAI"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(juicoyPoleAI), for: .touchUpInside)
        return JUICYbutton
    }()
    
    private lazy var JUICYPoleLoveButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setBackgroundImage(UIImage(named: "juicoyFaverite"), for: .normal)
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
        let JUICOY = UIImageView.init(image: UIImage.init(named: "juicoyGuHand"))
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
        // 1. 清空旧数据（防止重复配置）
        JuicoyCardViews.forEach { $0.removeFromSuperview() }
        JuicoyCardViews.removeAll()
        
        // 2. 倒序生成卡片，确保索引 0 的卡片在视觉最上方
        for JuicoyIndex in (0..<5).reversed() {
            let JuicoyCard = JuicoyMovementCardView(frame: JuicoyCardContainerView.bounds)
            JuicoyCard.isUserInteractionEnabled = true
            JuicoyCard.layer.cornerRadius = 10
            JuicoyCard.JUICYmainfreverr(loie: cardsModels[JuicoyIndex])
            // 初始偏移位置
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
        }
        
        // 此时 JuicoyCardViews.first 是最后添加进 addSubview 的，即视觉最上层
        JuicoyAttachPanToTopCard()
    }

    private func JuicoyAttachPanToTopCard() {
        guard let JuicoyTopCard = JuicoyCardViews.first else { return }
        
        // 移除旧手势防止堆叠
        JuicoyTopCard.gestureRecognizers?.forEach { JuicoyTopCard.removeGestureRecognizer($0) }
        
        let JuicoyPan = UIPanGestureRecognizer(target: self, action: #selector(JuicoyHandlePan))
        JuicoyTopCard.addGestureRecognizer(JuicoyPan)
        JuicoyTopCard.isUserInteractionEnabled = true
    }

    @objc private func JuicoyHandlePan(_ JuicoyGesture: UIPanGestureRecognizer) {
        guard let JuicoyTopCard = JuicoyGesture.view else { return }
        let JuicoyTranslation = JuicoyGesture.translation(in: JuicoyCardContainerView)

        switch JuicoyGesture.state {
        case .began:
            JuicoyCardOriginalCenter = JuicoyTopCard.center

        case .changed:
            // 优化：使用 translation 配合 CGAffineTransform，或者直接修改 center
            let JuicoyNewX = JuicoyCardOriginalCenter.x + JuicoyTranslation.x
            let JuicoyNewY = JuicoyCardOriginalCenter.y + JuicoyTranslation.y * 0.2 // 降低纵向跟随感
            JuicoyTopCard.center = CGPoint(x: JuicoyNewX, y: JuicoyNewY)
            
            // 旋转弧度限制
            let JuicoyRotationAngle = (JuicoyTranslation.x / JuicoyCardContainerView.bounds.width) * 0.4
            JuicoyTopCard.transform = CGAffineTransform(rotationAngle: JuicoyRotationAngle)

        case .ended, .cancelled:
            
        
            let JuicoyVelocity = JuicoyGesture.velocity(in: JuicoyCardContainerView)
            let JuicoyOffsetX = JuicoyTopCard.center.x - JuicoyCardOriginalCenter.x
            
            // 判定条件：位移超过120 或 划动速度极快
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
        JuicoyCard.isUserInteractionEnabled = false // 动画期间禁用交互
        
        UIView.animate(withDuration: 0.3, animations: {
            // 飞出屏幕
            let JuicoyExitX = direction ? self.view.bounds.width * 1.5 : -self.view.bounds.width * 0.5
            JuicoyCard.center = CGPoint(x: JuicoyExitX, y: JuicoyCard.center.y)
            JuicoyCard.alpha = 0
        }) { _ in
            JuicoyCard.removeFromSuperview()
            if !self.JuicoyCardViews.isEmpty {
                self.JuicoyCardViews.removeFirst()
            }
            self.JuicoyPromoteNextCard()
        }
    }

    private func JuicoyPromoteNextCard() {
        // 重新排列剩余卡片
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: .allowUserInteraction, animations: {
            for (JuicoyIndex, JuicoyCard) in self.JuicoyCardViews.enumerated() {
                // 每一张往上挪一个位置
                JuicoyCard.transform = CGAffineTransform(translationX: 0, y: CGFloat(JuicoyIndex) * self.JuicoyCardSpacing)
                JuicoyCard.alpha = JuicoyIndex == 0 ? 1 : 0.9
            }
        }) { _ in
            // 给当前最上面的卡片绑定手势
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
