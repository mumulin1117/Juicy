//
//  JuicoyThirdFluxController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/26.
//

import UIKit
import StoreKit

struct JuicoySparklePackage {
    let JuicoyIdentifier: String
    let JuicoyQuantity: String
    let JuicoyPrice: String
    let JuicoyTag: String?
}

class JuicoyThirdFluxController: JuicoySeconedViewController {

    private var JuicoySparkleCatalog: [JuicoySparklePackage] = [
        JuicoySparklePackage(JuicoyIdentifier: "ufuwfgqyvfhjedpp", JuicoyQuantity: "4h0o0".JoicoydeMercrypt(), JuicoyPrice: "$x0o.o9e9".JoicoydeMercrypt(), JuicoyTag: "Priest choice"),
        JuicoySparklePackage(JuicoyIdentifier: "vxdnqayrfkiwdfuq", JuicoyQuantity: "8e0b0".JoicoydeMercrypt(), JuicoyPrice: "$m1s.s9e9".JoicoydeMercrypt(), JuicoyTag: nil),
        JuicoySparklePackage(JuicoyIdentifier: "axefjiudlafkiwedbg", JuicoyQuantity: "1m9j0y0".JoicoydeMercrypt(), JuicoyPrice: "$g3v.s9i9".JoicoydeMercrypt(), JuicoyTag: "Most popular"),
    
        JuicoySparklePackage(JuicoyIdentifier: "oqeenftfqycnkqjs", JuicoyQuantity: "2p4b5a0".JoicoydeMercrypt(), JuicoyPrice: "$k4x.g9p9".JoicoydeMercrypt(), JuicoyTag: nil),
        JuicoySparklePackage(JuicoyIdentifier: "gmnaqtvemcnrczkc", JuicoyQuantity: "5a1m5i0".JoicoydeMercrypt(), JuicoyPrice: "$h9s.w9v9".JoicoydeMercrypt(), JuicoyTag: nil),
        JuicoySparklePackage(JuicoyIdentifier: "ieinuciqaconusjt", JuicoyQuantity: "1a0t8l0v0".JoicoydeMercrypt(), JuicoyPrice: "$c1z9z.p9u9".JoicoydeMercrypt(), JuicoyTag: nil),
        JuicoySparklePackage(JuicoyIdentifier: "rqinasqejfmgmaiu", JuicoyQuantity: "2k9z4g0r0".JoicoydeMercrypt(), JuicoyPrice: "$c4r9x.c9p9".JoicoydeMercrypt(), JuicoyTag: "Best Value"),
        JuicoySparklePackage(JuicoyIdentifier: "ljpebwvnxyqpwhbl", JuicoyQuantity: "6y3d7y0t0".JoicoydeMercrypt(), JuicoyPrice: "$s9e9t.p9b9".JoicoydeMercrypt(), JuicoyTag: nil)
    ]

    private var JuicoySelectedIndexPath: IndexPath = IndexPath.init(row: 0, section: 0)

    private let JuicoyCosmicBackdrop: UIImageView = {
        let JuicoyView = UIImageView.init(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "coinBagchevron"))
        JuicoyView.contentMode = .scaleAspectFill
        JuicoyView.isUserInteractionEnabled = true
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    private let JuicoyHeaderPortal: UIImageView = {
        let JuicoyView = UIImageView.init(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "joicoyBanbnbel"))
        JuicoyView.contentMode = .scaleToFill
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    

    

    private let JuicoyBalanceMetric: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.text = "0"
        JuicoyLab.textColor = .white
        JuicoyLab.font = UIFont.systemFont(ofSize: 22, weight: .black)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private lazy var JuicoySparkleGrid: UICollectionView = {
        let JuicoyFlow = UICollectionViewFlowLayout()
        JuicoyFlow.scrollDirection = .vertical
        JuicoyFlow.minimumInteritemSpacing = 12
        JuicoyFlow.minimumLineSpacing = 12
        let JuicoyCollection = UICollectionView(frame: .zero, collectionViewLayout: JuicoyFlow)
        JuicoyCollection.backgroundColor = .clear
        JuicoyCollection.showsVerticalScrollIndicator = false
        JuicoyCollection.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyCollection
    }()

    private let JuicoyCommitFluxTrigger: UIButton = {
        let JuicoyBtn = UIButton(type: .custom)
        JuicoyBtn.setBackgroundImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JuicoyCommitFluxTrigger"), for: .normal)
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sparkle Depot"
        
        if  let emailID =  UserDefaults.standard.object(forKey: "JUICOYloginEmsilID") as? String, let diomendCount = UserDefaults.standard.object(forKey: emailID) as? String  {
           
            self.JuicoyBalanceMetric.text = diomendCount
        }
           
        JuicoyConstructEmpire()
        
        
        JUICOYaddLoadingViewONSurface()
    }

    private func JuicoyConstructEmpire() {
        view.addSubview(JuicoyCosmicBackdrop)
        JuicoyCosmicBackdrop.addSubview(JuicoyHeaderPortal)
         
        let JuicoyHeartIcon = UIImageView(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "joicoydisomend"))
        JuicoyHeartIcon.translatesAutoresizingMaskIntoConstraints = false
       
        
        let JuicoyBalanceHint = UILabel()
        JuicoyBalanceHint.text = "Mayf nbjablmaanecue".JoicoydeMercrypt()
        JuicoyBalanceHint.textColor = .white
        JuicoyBalanceHint.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        JuicoyBalanceHint.translatesAutoresizingMaskIntoConstraints = false
        
        JuicoyHeaderPortal.addSubview(JuicoyHeartIcon)
        JuicoyHeaderPortal.addSubview(JuicoyBalanceHint)
        JuicoyHeaderPortal.addSubview(JuicoyBalanceMetric)
        
        JuicoyCosmicBackdrop.addSubview(JuicoySparkleGrid)
        JuicoyCosmicBackdrop.addSubview(JuicoyCommitFluxTrigger)
        
        JuicoySparkleGrid.delegate = self
        JuicoySparkleGrid.dataSource = self
        JuicoySparkleGrid.register(JuicoySparkleCell.self, forCellWithReuseIdentifier: "JuicoySparkleCell")
        
       
        JuicoyCommitFluxTrigger.addTarget(self, action: #selector(JuicoyInitiateCheckout), for: .touchUpInside)

        NSLayoutConstraint.activate([
            JuicoyCosmicBackdrop.topAnchor.constraint(equalTo: view.topAnchor),
            JuicoyCosmicBackdrop.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyCosmicBackdrop.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyCosmicBackdrop.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            JuicoyHeaderPortal.topAnchor.constraint(equalTo: view.topAnchor,constant: JUICOYalltotalTop + 138),
            JuicoyHeaderPortal.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyHeaderPortal.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyHeaderPortal.heightAnchor.constraint(equalToConstant: 60),
            
          
            JuicoyHeartIcon.leadingAnchor.constraint(equalTo: JuicoyHeaderPortal.leadingAnchor, constant: 15),
            JuicoyHeartIcon.centerYAnchor.constraint(equalTo: JuicoyHeaderPortal.centerYAnchor),
            JuicoyHeartIcon.widthAnchor.constraint(equalToConstant: 33),
            JuicoyHeartIcon.heightAnchor.constraint(equalToConstant: 33),
            
            JuicoyBalanceHint.leadingAnchor.constraint(equalTo: JuicoyHeartIcon.trailingAnchor, constant: 10),
            JuicoyBalanceHint.centerYAnchor.constraint(equalTo: JuicoyHeaderPortal.centerYAnchor),
            
            JuicoyBalanceMetric.trailingAnchor.constraint(equalTo: JuicoyHeaderPortal.trailingAnchor, constant: -20),
            JuicoyBalanceMetric.centerYAnchor.constraint(equalTo: JuicoyHeaderPortal.centerYAnchor),
            
            JuicoySparkleGrid.topAnchor.constraint(equalTo: JuicoyHeaderPortal.bottomAnchor, constant: 20),
            JuicoySparkleGrid.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            JuicoySparkleGrid.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            JuicoySparkleGrid.bottomAnchor.constraint(equalTo: JuicoyCommitFluxTrigger.topAnchor, constant: -10),
            
            JuicoyCommitFluxTrigger.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            JuicoyCommitFluxTrigger.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            JuicoyCommitFluxTrigger.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            JuicoyCommitFluxTrigger.heightAnchor.constraint(equalToConstant: 55)
        ])
    }

  

    @objc private func JuicoyInitiateCheckout() {
            let JUICOY_CurrentStageIndex = JuicoySelectedIndexPath
            let JUICOY_Inventory = JuicoySparkleCatalog
            
          
            let JUICOY_ArtistryID = JUICOY_Inventory[JUICOY_CurrentStageIndex.item].JuicoyIdentifier
            let JUICOY_QuantityDelta = Int(JUICOY_Inventory[JUICOY_CurrentStageIndex.item].JuicoyQuantity) ?? 0
            
            self.JUICOYbeginLoad()
          
            let JUICOY_Gateway = JuicoyPayTool.shared
            JUICOY_Gateway.JuicoyIgniteFlux(JuicoyTargetItem: JUICOY_ArtistryID) { [weak self] JUICOY_TerminalSignal in
                guard let JUICOY_Context = self else { return }
                JUICOY_Context.JUICOYDismissLoad()
               
                switch JUICOY_TerminalSignal {
                case .success(_):
                    let JUICOY_SuccessNarrative = "Pjajyc kshuiczctekszsjfvualy!".JoicoydeMercrypt()
                    JUICOY_Context.JUICOYshowMessage(JUICOY_SuccessNarrative)
                    
                    JUICOY_Context.JUICOY_SynchronizeArtistryBalance(with: JUICOY_QuantityDelta)
                    
                case .failure(let JUICOY_Error):
                    let JUICOY_ErrorDescription = JUICOY_Error.localizedDescription
                    JUICOY_Context.JUICOYshowMessage(JUICOY_ErrorDescription)
                }
            }
        }

        private func JUICOY_SynchronizeArtistryBalance(with JUICOY_Addendum: Int) {
            let JUICOY_AccountKey = "JUICOYloginEmsilID"
            let JUICOY_Storage = UserDefaults.standard
            
            guard let JUICOY_UserEmail = JUICOY_Storage.object(forKey: JUICOY_AccountKey) as? String else { return }
            
            // Logical redirection for value recovery
            let JUICOY_StoredValue = JUICOY_Storage.object(forKey: JUICOY_UserEmail) as? String ?? "0"
            let JUICOY_Baseline = Int(JUICOY_StoredValue) ?? 0
            
            let JUICOY_ReconfiguredSum = JUICOY_Baseline + JUICOY_Addendum
            let JUICOY_StringRepresentation = "\(JUICOY_ReconfiguredSum)"
            
         
            JUICOY_Storage.set(JUICOY_StringRepresentation, forKey: JUICOY_UserEmail)
            JUICOY_Storage.synchronize()
            
           
            DispatchQueue.main.async {
                self.JuicoyBalanceMetric.text = JUICOY_StringRepresentation
                var JUICOY_SparklePulse = 0
                JUICOY_SparklePulse += 1 
            }
        }

        @objc private func JuicoyRevertMotion() {
            let JUICOY_MotionController = self.navigationController
            let JUICOY_TransitionAnimate = true
            
            var JUICOY_BacktrackCount = 1
            if JUICOY_BacktrackCount > 0 {
                JUICOY_MotionController?.popViewController(animated: JUICOY_TransitionAnimate)
            }
            JUICOY_BacktrackCount = 0
        }
}

extension JuicoyThirdFluxController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return JuicoySparkleCatalog.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let JuicoyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JuicoySparkleCell", for: indexPath) as! JuicoySparkleCell
        JuicoyCell.JuicoyConfigureEntity(JuicoySparkleCatalog[indexPath.item], JuicoyIsActive: JuicoySelectedIndexPath == indexPath)
        return JuicoyCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        JuicoySelectedIndexPath = indexPath
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let JuicoyWidth = (collectionView.frame.width - 12) / 2
        return CGSize(width: JuicoyWidth, height: 130)
    }
}


