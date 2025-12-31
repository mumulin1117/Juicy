//
//  JuicoyAestheticFavController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/26.
//

import UIKit



class JuicoyAestheticFavController: JuicoySeconedViewController, JuicoyMotionDeepControllerdelegate {
    func JuicoyupdateJuicoyStorageModel(model: JuicoyStorageModel) {
        if let JuicoyTargetIndex = self.JuicoyVibeCollection.firstIndex(where: { $0.JuicoyIdentifier == model.JuicoyIdentifier }) {
                
                // 2. 将数组中该位置的数据更新为最新的 model
                self.JuicoyVibeCollection[JuicoyTargetIndex] = model
                
                // 3. 这里的 model 可能是被关注了或者被拉黑了
                // 如果你的 UI 正在显示这个列表，记得刷新
                // self.JuicoyMainGrid.reloadItems(at: [IndexPath(item: JuicoyTargetIndex, section: 0)])
            }
    }
    

    private var JuicoyVibeCollection: [JuicoyStorageModel] = {
        JuicoyDataFactory.JuicoySharedInstance.JuicoyObtainCachedFaverateVideo()
    }()
        
    

    private lazy var JuicoyStyleGrid: UICollectionView = {
        let JuicoyKineticLayout = UICollectionViewFlowLayout()
        let JuicoyWidth = (UIScreen.main.bounds.width - 45) / 2
        JuicoyKineticLayout.itemSize = CGSize(width: JuicoyWidth, height: JuicoyWidth * 1.4)
        JuicoyKineticLayout.minimumLineSpacing = 15
        JuicoyKineticLayout.minimumInteritemSpacing = 15
        JuicoyKineticLayout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 20, right: 15)
        
        let JuicoyCollection = UICollectionView(frame: .zero, collectionViewLayout: JuicoyKineticLayout)
        JuicoyCollection.backgroundColor = .clear
        JuicoyCollection.showsVerticalScrollIndicator = false
        JuicoyCollection.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyCollection
    }()

  

   

    override func viewDidLoad() {
        super.viewDidLoad()
        JuicoyInitializeCanvas()
        JuicoyConstructArchitecture()
    }

    private func JuicoyInitializeCanvas() {
        view.backgroundColor = UIColor(red: 29/255, green: 11/255, blue: 50/255, alpha: 1.0)
        
        self.title = "My Favorites"
        view.addSubview(JuicoyStyleGrid)
        
        JuicoyStyleGrid.delegate = self
        JuicoyStyleGrid.dataSource = self
        JuicoyStyleGrid.register(JuicoyFavThreadCell.self, forCellWithReuseIdentifier: "JuicoyFavThreadCell")
       
    }

    private func JuicoyConstructArchitecture() {
        NSLayoutConstraint.activate([
           
            JuicoyStyleGrid.topAnchor.constraint(equalTo: self.view.topAnchor, constant:JUICOYalltotalTop + 20),
            JuicoyStyleGrid.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyStyleGrid.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyStyleGrid.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension JuicoyAestheticFavController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return JuicoyVibeCollection.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = self.JuicoyVibeCollection[indexPath.row]
        if data.JUICOYUneedVIP == "1" && JuicoyDataFactory.currentUserModel?.JuicoyPremiumStatus == "0" {
            JuicoyShowVipVideoAlert()
            return
        }
        
        let detailTo = JuicoyMotionDeepController(juicoyModel: data)
        detailTo.delegate = self
        self.navigationController?.pushViewController(detailTo, animated: true)
       
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let JuicoyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JuicoyFavThreadCell", for: indexPath) as! JuicoyFavThreadCell
        JuicoyCell.JuicoySyncVibe(JuicoyVibeCollection[indexPath.row])
        return JuicoyCell
    }
}


extension UIViewController{
    /// 弹出查看视频需要 VIP 的权限提示
    func JuicoyShowVipVideoAlert() {
        let JuicoyAlert = UIAlertController(
            title: "VIP Exclusive Content",
            message: "Watching this pole dance tutorial requires a VIP membership.",
            preferredStyle: .alert
        )
        
        // 取消按钮
        let JuicoyCancelAction = UIAlertAction(title: "Maybe Later", style: .cancel, handler: nil)
        
        // 跳转到充值/开通页面的动作
        let JuicoyUpgradeAction = UIAlertAction(title: "Unlock Now", style: .default) { _ in
            // 这里跳转到你的 VIP 充值页面
            let membership = JuicoymembershipController()
           
            self.navigationController?.pushViewController(membership, animated: true)
        }
        
        JuicoyAlert.addAction(JuicoyCancelAction)
        JuicoyAlert.addAction(JuicoyUpgradeAction)
        
        self.present(JuicoyAlert, animated: true, completion: nil)
    }
}
