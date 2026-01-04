//
//  JuicoyExploreOneView.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/24.
//

import UIKit

class JuicoyExploreOneController: JuicoyBasicController, UICollectionViewDelegate, JuicoyExternalNexusControllerDelegate, JuicoyMotionDeepControllerdelegate {
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
    
    private lazy var  JUICYMotionStageContainer: UIImageView = {
        let JUICOY = UIImageView.init(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JUICYExplore"))
        JUICOY.translatesAutoresizingMaskIntoConstraints = false
        return JUICOY
    }()
    
    
    private lazy var  JUICYPoleDanceButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setBackgroundImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JUICYAcade"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(juicoyPoleDanceAcademy), for: .touchUpInside)
        return JUICYbutton
    }()
    
    @objc func juicoyPoleDanceAcademy() {
        
        self.navigationController?.pushViewController(JuicoyAcademyVaultController(), animated: true)
    }
    
    private lazy var JUICYpololaurButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setTitle("Popular", for: .normal)
        JUICYbutton.setTitleColor(.white, for:.selected)
        
        JUICYbutton.setTitleColor(UIColor(white: 1, alpha: 0.45), for: .normal)
        
        JUICYbutton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(juicoypicjcademy(noeua:)), for: .touchUpInside)
        return JUICYbutton
    }()
    
    private lazy var JUICYnewButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setTitle("New", for: .normal)
        JUICYbutton.setTitleColor(.white, for:.selected)
        
        JUICYbutton.setTitleColor(UIColor(white: 1, alpha: 0.45), for: .normal)
        
        JUICYbutton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(juicoypicjcademy(noeua:)), for: .touchUpInside)
        return JUICYbutton
    }()
    
    private lazy var JUICYforyouButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setTitle("For you", for: .normal)
        JUICYbutton.setTitleColor(.white, for:.selected)
        
        JUICYbutton.setTitleColor(UIColor(white: 1, alpha: 0.45), for: .normal)
        
        JUICYbutton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(juicoypicjcademy(noeua:)), for: .touchUpInside)
        return JUICYbutton
    }()
    
    @objc func juicoypicjcademy(noeua:UIButton) {
        JUICYpololaurButton.isSelected = false
        JUICYnewButton.isSelected = false
        JUICYforyouButton.isSelected = false
        noeua.isSelected = true
        JUICYIndicaterContainer.center.x = noeua.center.x
        
        observeJuicoyUserBlacklisted()
    }
    
    
    private lazy var  JUICYIndicaterContainer: UIImageView = {
        let JUICOY = UIImageView.init(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JUICYpath"))
        JUICOY.translatesAutoresizingMaskIntoConstraints = false
        return JUICOY
    }()
    private  lazy var JuicoyBottomCollectionView: UICollectionView = {
        let JuicoyLayout = UICollectionViewFlowLayout()
        
        JuicoyLayout.scrollDirection = .vertical
        JuicoyLayout.minimumLineSpacing = 15
        JuicoyLayout.itemSize = CGSize(width:UIScreen.main.bounds.width - 30, height: 223)
        JuicoyLayout.minimumInteritemSpacing = 15
        
        let   JuicoyBottomCollectionView = UICollectionView(frame: .zero, collectionViewLayout: JuicoyLayout)
        JuicoyBottomCollectionView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        JuicoyBottomCollectionView.showsHorizontalScrollIndicator = false
        JuicoyBottomCollectionView.register(JuicoyExploreCell.self, forCellWithReuseIdentifier: "JuicoyExploreCell")
        JuicoyBottomCollectionView.dataSource = self
        JuicoyBottomCollectionView.delegate = self
        JuicoyBottomCollectionView.translatesAutoresizingMaskIntoConstraints = false
        JuicoyBottomCollectionView.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0)
        return JuicoyBottomCollectionView
    }()
    
    //拉黑刷新数据
    @objc func observeJuicoyUserBlacklisted() {
       
        JuicoyRefreshDynamicStream()
        JuicoyBottomCollectionView.reloadData()
    }
    // 在 JuicoyExploreOneController 中

    private func JuicoyRefreshDynamicStream() {
        // 1. 从工厂获取所有有效数据（带封面的视频）
        let JuicoyPool = JuicoyDataFactory.JuicoySharedInstance.JuicoyObtainCachedPayload().filter {
            !$0.JuicoyMediaCover.isEmpty
        }
        
        // 2. 打乱顺序
        let JuicoyShuffledPool = JuicoyPool.shuffled()
        
        // 3. 随机决定展示的数量（例如 1 到 5 条）
        let JuicoyRandomCount = Int.random(in: 1...min(5, JuicoyShuffledPool.count))
        
        // 4. 更新当前控制器的 cardsModels
        self.cardsModels = Array(JuicoyShuffledPool.prefix(JuicoyRandomCount))
        
        // 5. 刷新界面
        // 假设你的列表变量名为 JuicoyMainGrid
//        self.JuicoyMainGrid.reloadData()
        
        // 6. 可选：添加轻微的震动反馈增加真实感
        let JuicoyImpact = UIImpactFeedbackGenerator(style: .light)
        JuicoyImpact.impactOccurred()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(observeJuicoyUserBlacklisted), name: NSNotification.Name("JuicoyUserBlacklisted"), object: nil)
        JuicoyRefreshDynamicStream()
        
        JUICOYconstrainet()
        JUICYpololaurButton.isSelected = true
    }
    
    private func JUICOYconstrainet()  {
        view.addSubview(JUICYMotionStageContainer)
        view.addSubview(JUICYPoleDanceButton)
        view.addSubview(JUICYpololaurButton)
        view.addSubview(JUICYnewButton)
        view.addSubview(JUICYforyouButton)
        
        view.addSubview(JUICYIndicaterContainer)
        view.addSubview(JuicoyBottomCollectionView)
        
        NSLayoutConstraint.activate([
            JUICYMotionStageContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            JUICYMotionStageContainer.widthAnchor.constraint(equalToConstant: 104),
            JUICYMotionStageContainer.heightAnchor.constraint(equalToConstant: 30),
            JUICYMotionStageContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: JUICOYtopSafeAreaHeight + 14),
            
            JUICYPoleDanceButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            JUICYPoleDanceButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            JUICYPoleDanceButton.heightAnchor.constraint(equalToConstant: 82),
            JUICYPoleDanceButton.topAnchor.constraint(equalTo: JUICYMotionStageContainer.bottomAnchor,constant: 29),
            
            JUICYpololaurButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            JUICYpololaurButton.heightAnchor.constraint(equalToConstant: 25),
            JUICYpololaurButton.topAnchor.constraint(equalTo: self.JUICYPoleDanceButton.bottomAnchor, constant: 15),
            JUICYpololaurButton.widthAnchor.constraint(equalToConstant: 70),
            
            JUICYnewButton.leadingAnchor.constraint(equalTo: self.JUICYpololaurButton.trailingAnchor, constant: 35),
            JUICYnewButton.heightAnchor.constraint(equalToConstant: 25),
            JUICYnewButton.topAnchor.constraint(equalTo: self.JUICYPoleDanceButton.bottomAnchor, constant: 15),
            JUICYnewButton.widthAnchor.constraint(equalToConstant: 70),
            
            JUICYforyouButton.heightAnchor.constraint(equalToConstant: 25),
            JUICYforyouButton.widthAnchor.constraint(equalToConstant: 70),
            JUICYforyouButton.leadingAnchor.constraint(equalTo: JUICYnewButton.trailingAnchor,constant: 35),
            JUICYforyouButton.topAnchor.constraint(equalTo: self.JUICYPoleDanceButton.bottomAnchor, constant: 15),
           
            JUICYIndicaterContainer.widthAnchor.constraint(equalToConstant: 60),
            JUICYIndicaterContainer.heightAnchor.constraint(equalToConstant: 8),
            JUICYIndicaterContainer.centerXAnchor.constraint(equalTo: self.JUICYpololaurButton.centerXAnchor,constant: 15),
            JUICYIndicaterContainer.topAnchor.constraint(equalTo: JUICYforyouButton.bottomAnchor, constant:4),
            
            JuicoyBottomCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            JuicoyBottomCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            JuicoyBottomCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:0),
            JuicoyBottomCollectionView.topAnchor.constraint(equalTo: JUICYIndicaterContainer.bottomAnchor, constant: 13)
        ])
    }

}
extension JuicoyExploreOneController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cardsModels.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let data = self.cardsModels[indexPath.row]
        
        if data.JUICOYUneedVIP == "1" && JuicoyDataFactory.currentUserModel?.JuicoyPremiumStatus == "0" {
            JuicoyShowVipVideoAlert()
            return
        }
        let detailTo = JuicoyMotionDeepController(juicoyModel: data)
        detailTo.delegate = self
        self.navigationController?.pushViewController(detailTo, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let JuicoyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JuicoyExploreCell", for: indexPath) as! JuicoyExploreCell
        JuicoyCell.JUICYmainfreverr(loie: cardsModels[indexPath.row])
        JuicoyCell.JuiaddButton.addTarget(self, action: #selector(toJOUICY(juicoy:)), for: .touchUpInside)
        JuicoyCell.JuicoysendmesageButton.tag = indexPath.row
        JuicoyCell.JuicoyviovakkButton.tag = indexPath.row
        
        JuicoyCell.JuicoyviovakkButton.addTarget(self, action: #selector(toJuicoyVideoCallEmit(juicoy:)), for: .touchUpInside)
        JuicoyCell.JuicoysendmesageButton.addTarget(self, action: #selector(toJuicoyMessageEmit(juicoy:)), for: .touchUpInside)
        return JuicoyCell
    }
    
    @objc func toJOUICY(juicoy:UIButton) {
       let indexData = cardsModels[juicoy.tag]
        let userdetail = JuicoyExternalNexusController.init(juicoyModel: indexData)
        userdetail.delegate = self
        self.navigationController?.pushViewController(userdetail, animated: true)
     }
    
    @objc func toJuicoyMessageEmit(juicoy:UIButton)  {
        let indexData = cardsModels[juicoy.tag]
        self.navigationController?.pushViewController(JuicoyMeadggFotuseController(juicoyModel: indexData), animated: true)
    }
    
    
    @objc func toJuicoyVideoCallEmit(juicoy:UIButton)  {
        let indexData = cardsModels[juicoy.tag]
        self.navigationController?.pushViewController(JuicoyTeleLinkController(juicoyModel: indexData), animated: true)
    }
}
