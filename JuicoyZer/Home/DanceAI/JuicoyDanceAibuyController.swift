//
//  JuicoyDanceAibuyController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/25.
//

import UIKit

class JuicoyDanceAibuyController: JuicoySeconedViewController, JuicoyNotEnoughControllerDelegate {
    func toshowbuy() {
//        JuicoyDataFactory.JuicoySharedInstance.JuicoyConsumeAiMessage()
        self.navigationController?.pushViewController(JuicoyWalletFluxController(), animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let air = UIImageView(image: UIImage.init(named: "juicoydanceAibg"))
        air.frame = UIScreen.main.bounds
        air.contentMode = .scaleAspectFill
        self.view.addSubview(air)
        
        view.addSubview(JUICYPoleLoveButton)
    }
    let JUICYbutton = UIButton.init(frame: CGRect.init(x: (UIScreen.main.bounds.width - 345)/2, y: (UIScreen.main.bounds.height - 62 - JUICOYstatusBarHeight - 30), width: 345, height: 62))
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let factory = JuicoyDataFactory.JuicoySharedInstance
        
        // 1. 检查是否还有剩余次数
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
            JUICYbutton.setBackgroundImage(UIImage(named: "juicoydanceAiNeed"), for: .normal)
        }
        
    }
    private lazy var JUICYPoleLoveButton: UIButton = {
       
       
         
        JUICYbutton.addTarget(self, action: #selector(juicoyPoleAI), for: .touchUpInside)
        return JUICYbutton
    }()
    

    @objc func juicoyPoleAI() {
        let factory = JuicoyDataFactory.JuicoySharedInstance
        
        // 1. 检查是否还有剩余次数
        if factory.JuicoyObtainAiQuota() > 0 {
            // 直接进入 AI 对话界面
            JuicoyDataFactory.JuicoySharedInstance.JuicoyConsumeAiMessage()
            self.navigationController?.pushViewController(JuicoyAiEnterController(), animated: true)
            return
        }
        
        // 2. 剩余次数为 0，尝试扣除 300 金币进行购买
        if factory.JuicoyPurchaseAiPackage() {
            self.JUICOYshowMessage("Purchase Successful! +5 AI Responses")
            JuicoyDataFactory.JuicoySharedInstance.JuicoyConsumeAiMessage()
            // 购买成功后进入对话界面
            self.navigationController?.pushViewController(JuicoyAiEnterController(), animated: true)
        } else {
            // 3. 金币不足，展示余额不足页面
            let juicoymodal = JuicoyNotEnoughController()
            juicoymodal.delegate = self
            juicoymodal.modalPresentationStyle = .overCurrentContext
            self.present(juicoymodal, animated: true)
        }
        
       
    }
}
