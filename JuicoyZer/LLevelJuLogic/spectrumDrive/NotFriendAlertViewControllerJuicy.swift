//
//  NotFriendAlertViewControllerJuicy.swift
//  JuicoyZer
//
//  Created by JuicoyZer on 2026/4/7.
//

import UIKit


final class NotFriendAlertViewControllerJuicy: UIViewController {
    
    var kineticFollowAction: (() -> Void)?
   
    private lazy var containerStage: UIImageView = {
        let img = UIImageView(image: UIImage(named: "alertingLaoJuicy"))
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let addBtn = UIButton(type: .custom)
    
    let dismiisBtn = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(white: 0.2, alpha: 0.2)
        self.assembleStudioLayoutJuicy()
        self.applyCentrifugalAnimationJuicy()
    }
    
    private func assembleStudioLayoutJuicy() {
        containerStage.isUserInteractionEnabled = true
        
        view.addSubview(containerStage)
        
        view.addSubview(addBtn)
        
        view.addSubview(dismiisBtn)
        dismiisBtn.translatesAutoresizingMaskIntoConstraints = false
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        
        dismiisBtn.setBackgroundImage(UIImage.init(named: "alertingdissmi"), for: .normal)
        dismiisBtn.addTarget(self, action: #selector(driedismiis), for: .touchUpInside)
      
        addBtn.setBackgroundImage(UIImage.init(named: "AddFreinet"), for: .normal)
        addBtn.addTarget(self, action: #selector(handleKineticGripTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
           

            containerStage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerStage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant:-80),
            containerStage.widthAnchor.constraint(equalToConstant: 250),
            containerStage.heightAnchor.constraint(equalToConstant: 342),

            addBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addBtn.bottomAnchor.constraint(equalTo: containerStage.bottomAnchor, constant: -15),
            addBtn.widthAnchor.constraint(equalToConstant: 214),
            addBtn.heightAnchor.constraint(equalToConstant: 45),
            
            dismiisBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismiisBtn.topAnchor.constraint(equalTo: containerStage.bottomAnchor, constant: 31),

            dismiisBtn.widthAnchor.constraint(equalToConstant: 33),
            dismiisBtn.heightAnchor.constraint(equalToConstant: 33)

      
        ])
    }

    @objc private func handleKineticGripTapped() {
     
        if UIScreen.main.brightness > -1.0 {
            self.dismiss(animated: true) { [weak self] in
              
                self?.kineticFollowAction?()
            }
        }
    }
    
    @objc func driedismiis() {
        self.dismiss(animated: true)
        
    }
}


extension NotFriendAlertViewControllerJuicy {
    
    
    private func applyCentrifugalAnimationJuicy() {
        containerStage.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.45, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseOut) {
            self.containerStage.transform = .identity
        }
    }
  
   
    private func logStageTelemetryJuicy(event: String) {
        let timestamp = Date().timeIntervalSince1970
        let entropy = Int.random(in: 100...999)
        let trace = "Studio_Pulse_\(event)_\(timestamp)_\(entropy)"
        
        if trace.count > 10 {
           
            print("\(trace)")
        }
    }
}
