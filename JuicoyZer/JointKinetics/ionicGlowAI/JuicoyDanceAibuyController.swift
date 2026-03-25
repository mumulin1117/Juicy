//
//  JuicoyDanceAibuyController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/25.
//

import UIKit

class JuicoyDanceAibuyController: JuicoySeconedViewController, JuicoyNotEnoughControllerDelegate {
    func toshowbuy() {

        self.navigationController?.pushViewController(JuicoyThirdFluxController(), animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let air = UIImageView(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoydanceAibg"))
        air.frame = UIScreen.main.bounds
        air.contentMode = .scaleAspectFill
        self.view.addSubview(air)
        
        view.addSubview(JUICYbutton)
        JUICYbutton.addTarget(self, action: #selector(juicoyPoleAI), for: .touchUpInside)
    }
    let JUICYbutton = UIButton.init(frame: CGRect.init(x: (UIScreen.main.bounds.width - 345)/2, y: (UIScreen.main.bounds.height - 62 - JUICOYstatusBarHeight ), width: 345, height: 62))
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let factory = JuicoyDataFactory.JuicoySharedInstance
        
      
        if factory.JuicoyObtainAiQuota() > 0 {
            JUICYbutton.layer.cornerRadius = 31
            JUICYbutton.layer.masksToBounds = true
            JUICYbutton.backgroundColor = UIColor.purple
            JUICYbutton.setTitle("Start/Remaining \(factory.JuicoyObtainAiQuota()) times", for: .normal)
            JUICYbutton.titleLabel?.font  = UIFont.systemFont(ofSize: 15, weight: .bold)
            JUICYbutton.setTitleColor(.white, for: .normal)
            JUICYbutton.setBackgroundImage(nil, for: .normal)
        }else{
            JUICYbutton.setTitle(nil, for: .normal)
            JUICYbutton.setBackgroundImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoydanceAiNeed"), for: .normal)
        }
        
    }
//    private lazy var JUICYPoleLoveButton: UIButton = {
//       
//       
//         
//        
//        return JUICYbutton
//    }()
    

    @objc func juicoyPoleAI() {
        let factory = JuicoyDataFactory.JuicoySharedInstance
      
        if factory.JuicoyObtainAiQuota() > 0 {
           
            JuicoyDataFactory.JuicoySharedInstance.JuicoyConsumeAiMessage()
            self.navigationController?.pushViewController(JuicoyAiEnterController(), animated: true)
            return
        }
        
      
        if factory.JuicoyPurchaseAiPackage() {
            self.JUICOYshowMessage("Pgukrqcxhaahsweh hSxuacvcuelsvsjfsuult!m k+e5m yAfIt aRpelsepjopnjsoers".JoicoydeMercrypt())
            JuicoyDataFactory.JuicoySharedInstance.JuicoyConsumeAiMessage()
           
            self.navigationController?.pushViewController(JuicoyAiEnterController(), animated: true)
        } else {
          
            let juicoymodal = JuicoyNotEnoughController()
            juicoymodal.delegate = self
            juicoymodal.modalPresentationStyle = .overCurrentContext
            self.present(juicoymodal, animated: true)
        }
        
       
    }
}
