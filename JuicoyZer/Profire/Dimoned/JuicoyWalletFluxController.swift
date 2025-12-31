//
//  JuicoyWalletFluxController.swift
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

class JuicoyWalletFluxController: JuicoySeconedViewController {

    private var JuicoySparkleCatalog: [JuicoySparklePackage] = [
        JuicoySparklePackage(JuicoyIdentifier: "com.juicoy.sparkle.400", JuicoyQuantity: "400", JuicoyPrice: "$0.99", JuicoyTag: "Priest choice"),
        JuicoySparklePackage(JuicoyIdentifier: "com.juicoy.sparkle.800", JuicoyQuantity: "800", JuicoyPrice: "$1.99", JuicoyTag: nil),
        JuicoySparklePackage(JuicoyIdentifier: "com.juicoy.sparkle.1900", JuicoyQuantity: "1900", JuicoyPrice: "$3.99", JuicoyTag: "Most popular"),
        JuicoySparklePackage(JuicoyIdentifier: "com.juicoy.sparkle.2450", JuicoyQuantity: "2450", JuicoyPrice: "$4.99", JuicoyTag: nil),
        JuicoySparklePackage(JuicoyIdentifier: "com.juicoy.sparkle.3950", JuicoyQuantity: "3950", JuicoyPrice: "$6.99", JuicoyTag: nil),
        JuicoySparklePackage(JuicoyIdentifier: "com.juicoy.sparkle.4900", JuicoyQuantity: "4900", JuicoyPrice: "$8.99", JuicoyTag: nil),
        JuicoySparklePackage(JuicoyIdentifier: "com.juicoy.sparkle.6000", JuicoyQuantity: "6000", JuicoyPrice: "$11.99", JuicoyTag: nil),
        JuicoySparklePackage(JuicoyIdentifier: "com.juicoy.sparkle.8500", JuicoyQuantity: "8500", JuicoyPrice: "$15.99", JuicoyTag: nil),
        JuicoySparklePackage(JuicoyIdentifier: "com.juicoy.sparkle.12000", JuicoyQuantity: "12000", JuicoyPrice: "$22.99", JuicoyTag: "Best Value"),
        JuicoySparklePackage(JuicoyIdentifier: "com.juicoy.sparkle.25000", JuicoyQuantity: "25000", JuicoyPrice: "$49.99", JuicoyTag: nil)
    ]

    private var JuicoySelectedIndexPath: IndexPath?

    private let JuicoyCosmicBackdrop: UIImageView = {
        let JuicoyView = UIImageView.init(image: UIImage.init(named: "coinBagchevron"))
        JuicoyView.contentMode = .scaleAspectFill
        JuicoyView.isUserInteractionEnabled = true
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    private let JuicoyHeaderPortal: UIImageView = {
        let JuicoyView = UIImageView.init(image: UIImage.init(named: "joicoyBanbnbel"))
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
        JuicoyBtn.setBackgroundImage(UIImage.init(named: "JuicoyCommitFluxTrigger"), for: .normal)
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sparkle Depot"
        
        if  let emailID =  UserDefaults.standard.object(forKey: "JUICOYloginEmsilID") as? String, let diomendCount = UserDefaults.standard.object(forKey: emailID) as? String  {
            //emailID对应的金币数量
            self.JuicoyBalanceMetric.text = diomendCount
        }
           
        JuicoyConstructEmpire()
        
        
        JUICOYaddLoadingViewONSurface()
    }

    private func JuicoyConstructEmpire() {
        view.addSubview(JuicoyCosmicBackdrop)
        JuicoyCosmicBackdrop.addSubview(JuicoyHeaderPortal)
         
        let JuicoyHeartIcon = UIImageView(image: UIImage(named: "joicoydisomend"))
        JuicoyHeartIcon.translatesAutoresizingMaskIntoConstraints = false
       
        
        let JuicoyBalanceHint = UILabel()
        JuicoyBalanceHint.text = "My balance"
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
        guard let JuicoyPath = JuicoySelectedIndexPath else { return }
        let JuicoyProductID = JuicoySparkleCatalog[JuicoyPath.item].JuicoyIdentifier
        JUICOYbeginLoad()
        JuicoyPayTool.shared.JuicoyIgniteFlux(JuicoyTargetItem: JuicoyProductID) { result in
            self.JUICOYDismissLoad()
            switch result{
                
            case .success(let succeff):
                self.JUICOYshowMessage("Pay successful!")
                
                if  let emailID =  UserDefaults.standard.object(forKey: "JUICOYloginEmsilID") as? String,
                    let diomendCount = UserDefaults.standard.object(forKey: emailID) as? String ,
                    let count = Int(diomendCount),let add = Int(self.JuicoySparkleCatalog[JuicoyPath.item].JuicoyQuantity) {
                    //emailID对应的金币数量
                    let newest = count + add
                    UserDefaults.standard.set("\(newest)", forKey: emailID)
                    
                    self.JuicoyBalanceMetric.text = "\(newest)"
                }
            case .failure(let meddd):
                self.JUICOYshowMessage(meddd.localizedDescription)
            }
        }
      
    }

    @objc private func JuicoyRevertMotion() {
        navigationController?.popViewController(animated: true)
    }
}

extension JuicoyWalletFluxController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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


