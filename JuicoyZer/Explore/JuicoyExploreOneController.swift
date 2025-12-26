//
//  JuicoyExploreOneView.swift
//  JuicoyZer
//
//  Created by mumu on 2025/12/24.
//

import UIKit

class JuicoyExploreOneController: JuicoyBasicController, UICollectionViewDelegate {
    private lazy var  JUICYMotionStageContainer: UIImageView = {
        let JUICOY = UIImageView.init(image: UIImage.init(named: "JUICYExplore"))
        JUICOY.translatesAutoresizingMaskIntoConstraints = false
        return JUICOY
    }()
    
    
    private lazy var  JUICYPoleDanceButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setBackgroundImage(UIImage(named: "JUICYAcade"), for: .normal)
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
    }
    
    
    private lazy var  JUICYIndicaterContainer: UIImageView = {
        let JUICOY = UIImageView.init(image: UIImage.init(named: "JUICYpath"))
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let JuicoyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JuicoyExploreCell", for: indexPath) as! JuicoyExploreCell
        return JuicoyCell
    }
}
