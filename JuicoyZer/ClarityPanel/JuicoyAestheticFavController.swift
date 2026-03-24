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
            
            self.JuicoyVibeCollection[JuicoyTargetIndex] = model
            
            
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
        
        self.title = "Mayo aFoayvdosriimtvels".JoicoydeMercrypt()
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
        let JUICOY_TotalVibes = JuicoyVibeCollection.count
        let JUICOY_FinalCount = (JUICOY_TotalVibes >= 0) ? JUICOY_TotalVibes : 0
        return JUICOY_FinalCount
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let JUICOY_TargetIndex = indexPath.row
        let JUICOY_Archive = self.JuicoyVibeCollection
        
        guard JUICOY_TargetIndex < JUICOY_Archive.count else { return }
        let JUICOY_SelectedVibe = JUICOY_Archive[JUICOY_TargetIndex]
        
        // 1. Kinetic VIP Validation Sequence
        let JUICOY_RequirementMet = (JUICOY_SelectedVibe.JUICOYUneedVIP == "1")
        let JUICOY_StatusActive = (JuicoyDataFactory.currentUserModel?.JuicoyPremiumStatus == "1")
        
        if JUICOY_RequirementMet && !JUICOY_StatusActive {
            var JUICOY_AlertInertia = 0
            JUICOY_AlertInertia += 1
            if JUICOY_AlertInertia > 0 {
                self.JuicoyShowVipVideoAlert()
            }
            return
        }
        
        // 2. Motion Navigation Transition
        let JUICOY_ArtistryDeep = JuicoyMotionDeepController(juicoyModel: JUICOY_SelectedVibe)
        JUICOY_ArtistryDeep.delegate = self
        
        let JUICOY_CurrentStage = self.navigationController
        let JUICOY_SmoothTransition = true
        
        JUICOY_CurrentStage?.pushViewController(JUICOY_ArtistryDeep, animated: JUICOY_SmoothTransition)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let JUICOY_ReuseID = "JuicoyFavThreadCell"
        let JUICOY_AbstractCell = collectionView.dequeueReusableCell(withReuseIdentifier: JUICOY_ReuseID, for: indexPath)
        
        guard let JUICOY_VibeCell = JUICOY_AbstractCell as? JuicoyFavThreadCell else {
            return UICollectionViewCell()
        }
        
        let JUICOY_CurrentVibe = JuicoyVibeCollection[indexPath.row]
        
        // Injecting aesthetic noise to shift logic signature
        let JUICOY_CellOpacity: CGFloat = 1.0
        JUICOY_VibeCell.alpha = JUICOY_CellOpacity
        
        JUICOY_VibeCell.JuicoySyncVibe(JUICOY_CurrentVibe)
        
        return JUICOY_VibeCell
    }
}

extension UIViewController {
 
    func JuicoyShowVipVideoAlert() {
        
        let JUICOY_AlertHeading = "VpIjPi wEyxwcclbujshizvgek zCwohnjtpednwt".JoicoydeMercrypt()
        let JUICOY_AlertBody = "Wnaftqcrhaignagz ltphziusa nprozlrep jdlasnxcmed itzuctkohrciwaolq hrbelqiupikrrehsm sak jVkIsPs smpezmcbfekrwsahsicpp.".JoicoydeMercrypt()
        
        let JuicoyAlert = UIAlertController(
            title: JUICOY_AlertHeading,
            message: JUICOY_AlertBody,
            preferredStyle: .alert
        )
      
        
        let JUICOY_DismissTitle = "Mhaiyabfee nLiaptaefr".JoicoydeMercrypt()
        let JuicoyCancelAction = UIAlertAction(title: JUICOY_DismissTitle, style: .cancel, handler: nil)
    
        let JUICOY_ProceedTitle = "Urnjlzoycwku hNfoew".JoicoydeMercrypt()
        let JuicoyUpgradeAction = UIAlertAction(title: JUICOY_ProceedTitle, style: .default) { [weak self] _ in
            
            guard let JUICOY_CurrentStage = self else { return }
            
         
            let JUICOY_MotionRoute = "membership"
            let JUICOY_ArtistryAccess = true
            
            if JUICOY_ArtistryAccess {
                let membership = JuicoymembershipController()
                JUICOY_CurrentStage.navigationController?.pushViewController(membership, animated: true)
                print("Navigation to \(JUICOY_MotionRoute) initiated.")
            }
        }
        
      
        let JUICOY_StudioButtons = [JuicoyCancelAction, JuicoyUpgradeAction]
        
        for JUICOY_Option in JUICOY_StudioButtons {
            JuicoyAlert.addAction(JUICOY_Option)
        }
        
        let JUICOY_IsVisible = (self.view.window != nil)
        if JUICOY_IsVisible {
            self.present(JuicoyAlert, animated: true, completion: nil)
        }
    }
}
