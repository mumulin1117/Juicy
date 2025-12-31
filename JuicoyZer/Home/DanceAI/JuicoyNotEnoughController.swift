//
//  JuicoyNotEnoughController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/25.
//

import UIKit
protocol JuicoyNotEnoughControllerDelegate {
    func toshowbuy()
}
class JuicoyNotEnoughController:  JuicoySeconedViewController {
    var delegate:JuicoyNotEnoughControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let air = UIImageView(image: UIImage.init(named: "juicoydanceAinotenuough"))
        air.frame.size = CGSize(width: 347, height: 334)
        air.center = self.view.center
        air.contentMode = .scaleToFill
        air.isUserInteractionEnabled = true
        self.view.addSubview(air)
        
        air.addSubview(JUICYPoleLoveButton)
        
        self.view.addSubview(JUICYcloseButton)
    }
    
    private lazy var JUICYPoleLoveButton: UIButton = {
        let JUICYbutton = UIButton.init(frame: CGRect.init(x: 37, y: 254, width: 270, height: 50))
        JUICYbutton.setBackgroundImage(UIImage(named: "juicoydanceAibuy"), for: .normal)
        
        JUICYbutton.addTarget(self, action: #selector(juicoyPoleAI), for: .touchUpInside)
        return JUICYbutton
    }()
    
    @objc func juicoyPoleAI()  {
        
        self.dismiss(animated: true)
        
        self.delegate?.toshowbuy()
    }
    
    
    private lazy var JUICYcloseButton: UIButton = {
        let JUICYbutton = UIButton.init(frame: CGRect.init(x: 0, y:UIScreen.main.bounds.height/2 + 334/2 + 35, width: 34, height: 34))
        JUICYbutton.setBackgroundImage(UIImage(named: "juicoydanceAiclose"), for: .normal)
        JUICYbutton.center.x = UIScreen.main.bounds.width/2
        JUICYbutton.addTarget(self, action: #selector(juicoycloseAI), for: .touchUpInside)
        return JUICYbutton
    }()
    
    @objc func juicoycloseAI()  {
        self.dismiss(animated: true)
    }
}
