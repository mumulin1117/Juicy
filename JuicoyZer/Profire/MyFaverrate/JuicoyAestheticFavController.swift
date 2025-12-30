//
//  JuicoyAestheticFavController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/26.
//

import UIKit



class JuicoyAestheticFavController: JuicoySeconedViewController {

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
        self.navigationController?.pushViewController(JuicoyMotionDeepController(juicoyModel: data), animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let JuicoyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JuicoyFavThreadCell", for: indexPath) as! JuicoyFavThreadCell
        JuicoyCell.JuicoySyncVibe(JuicoyVibeCollection[indexPath.row])
        return JuicoyCell
    }
}

