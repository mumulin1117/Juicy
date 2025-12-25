//
//  JuicoyDanceAibuyController.swift
//  JuicoyZer
//
//  Created by mumu on 2025/12/25.
//

import UIKit

class JuicoyDanceAibuyController: JuicoySeconedViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let air = UIImageView(image: UIImage.init(named: "juicoydanceAibg"))
        air.frame = UIScreen.main.bounds
        air.contentMode = .scaleAspectFill
        self.view.addSubview(air)
        
        view.addSubview(JUICYPoleLoveButton)
    }
    
    private lazy var JUICYPoleLoveButton: UIButton = {
        let JUICYbutton = UIButton.init(frame: CGRect.init(x: (UIScreen.main.bounds.width - 345)/2, y: (UIScreen.main.bounds.height - 62 - JUICOYstatusBarHeight - 30), width: 345, height: 62))
        JUICYbutton.setBackgroundImage(UIImage(named: "juicoydanceAiNeed"), for: .normal)
         
        JUICYbutton.addTarget(self, action: #selector(juicoyPoleAI), for: .touchUpInside)
        return JUICYbutton
    }()
    
    @objc func juicoyPoleAI()  {
        var ifEnought:Bool = true
        
        if ifEnought {
            self.navigationController?.pushViewController(JuicoyAiEnterController(), animated: true)  
            return
        }
       let  juicoymodal = JuicoyNotEnoughController.init()
        juicoymodal.modalPresentationStyle = .overCurrentContext
        self.present(juicoymodal, animated: true)
    }
}
