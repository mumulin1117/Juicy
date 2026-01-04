//
//  JuicoyMotionArenantroller.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/24.
//

import UIKit

class JuicoyMotionArenantroller: JuicoyBasicController  {

    private let JuicoyVelvetScrollContainer: UIScrollView = {
        let JuicoyScroll = UIScrollView()
        JuicoyScroll.backgroundColor = .clear
        JuicoyScroll.contentInsetAdjustmentBehavior = .never
        JuicoyScroll.showsVerticalScrollIndicator = false
        return JuicoyScroll
    }()

    private let JuicoyFabricContentStack: UIView = {
        let JuicoyBase = UIView()
        return JuicoyBase
    }()

    private let JuicoyStageCoverImage: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.contentMode = .scaleAspectFill
        JuicoyImg.clipsToBounds = true
        JuicoyImg.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JuicoyProfileCover")
        return JuicoyImg
    }()

    private lazy var JuicoyGlassSettingTrigger: UIButton = {
        let JuicoyBtn = UIButton()
        JuicoyBtn.setImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "joicoysoite"), for: .normal)
        JuicoyBtn.addTarget(self, action: #selector(juicoyShapeConsistency), for: .touchUpInside)
        return JuicoyBtn
    }()
    
    @objc func juicoyShapeConsistency()  {
        self.navigationController?.pushViewController(JuicoyEssenceVaultController(), animated: true)
    }
    //金币
    private let JuicoyGDIOmentCount: UIButton = {
        let JuicoyView = UIButton()
        JuicoyView.layer.cornerRadius = 14
        JuicoyView.layer.masksToBounds = true
        JuicoyView.backgroundColor = UIColor(red: 0.45, green: 0.18, blue: 0.86, alpha: 1)
        let img = UIImageView(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "joicoydisomend"))
        img.frame = CGRect(x: 0, y: 0, width: 33, height: 33)
        JuicoyView.addSubview(img)
        
        let JuicoyLabel = UILabel(frame: CGRect.init(x: 40, y: 0, width:50, height: 30))
        JuicoyLabel.text = " ->"
        JuicoyLabel.textColor = .white
        JuicoyLabel.font = UIFont.systemFont(ofSize: 16)
        JuicoyView.addSubview(JuicoyLabel)
        JuicoyView.addTarget(self, action: #selector(JJuicoyUMPDimoned0ontroller), for: .touchUpInside)
        return JuicoyView
    }()
   
    @objc func JJuicoyUMPDimoned0ontroller() {
        self.navigationController?.pushViewController(JuicoyWalletFluxController(), animated: true)
     }
    
    //edit
    private let Juicoyedit: UIButton = {
        let JuicoyView = UIButton()
        JuicoyView.setImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "joicoyedit"), for: .normal)
        JuicoyView.layer.cornerRadius = 15
        JuicoyView.layer.masksToBounds = true
        JuicoyView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        JuicoyView.setTitle(" sEqdfiht".JoicoydeMercrypt(), for: .normal)
        JuicoyView.setTitleColor(.white, for: .normal)
        JuicoyView.addTarget(self, action: #selector(JJuicoyUMPEditontroller), for: .touchUpInside)
        return JuicoyView
    }()
   
    @objc func JJuicoyUMPEditontroller() {
        self.navigationController?.pushViewController(JuicoyProfileArchitectController(), animated: true)
     }

    private let JuicoyIconicAvatarFrame: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.contentMode = .scaleAspectFill
        JuicoyImg.layer.cornerRadius = 45
        JuicoyImg.layer.masksToBounds = true
        JuicoyImg.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "joicoybackimag")
        return JuicoyImg
    }()

    private let JuicoyImperialCrownBadge: UIImageView = {
        let JuicoyImg = UIImageView()
        
        return JuicoyImg
    }()

    
    private let JuicoyGlassVIPTrigger: UIButton = {
        let JuicoyBtn = UIButton()
        JuicoyBtn.setImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "joicoyprem"), for: .normal)
        return JuicoyBtn
    }()

    
    private let JuicoyStylePersonaName: UILabel = {
        let JuicoyLabel = UILabel()
        JuicoyLabel.text = "Cameron Curtis"
        JuicoyLabel.textColor = .white
        JuicoyLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return JuicoyLabel
    }()

    private let JuicoyEliteVipTag: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyVIP")
        
        
        return JuicoyImg
    }()

    private let JuicoyAuraBioLabel: UILabel = {
        let JuicoyLabel = UILabel()
        JuicoyLabel.text = "Envcesriys wsreoscsgivotnn gmsaqkfersx vymotuu eshtdrkoknighenr".JoicoydeMercrypt()
        JuicoyLabel.textColor = .lightGray
        JuicoyLabel.font = UIFont.systemFont(ofSize: 14)
        return JuicoyLabel
    }()

    //my gift
    private let JuicoyGIFTHeader: UIButton = {
        let JuicoyView = UIButton()
        JuicoyView.setBackgroundImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "joicoyhaikjuo"), for: .normal)
        let img = UIImageView(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "joicoyopnert"))
        img.frame = CGRect(x: 0, y: 0, width: 27, height: 27)
        JuicoyView.addSubview(img)
        
        let JuicoyLabel = UILabel(frame: CGRect.init(x: 30, y: 0, width:50, height: 30))
        JuicoyLabel.text = "0"
        JuicoyLabel.textColor = .white
        JuicoyLabel.font = UIFont.systemFont(ofSize: 15)
        JuicoyView.addSubview(JuicoyLabel)
        JuicoyView.addTarget(self, action: #selector(JJuicoyUMPGiftontroller), for: .touchUpInside)
        return JuicoyView
    }()
   
    @objc func JJuicoyUMPGiftontroller() {
        self.navigationController?.pushViewController(JuicoyCollectionMasterController.init(JuicoyMode: .JuicoyGiftAura), animated: true)
     }
    
    
    private let JuicoyMomentumStatsGrid: UIStackView = {
        let JuicoyStack = UIStackView()
        JuicoyStack.axis = .horizontal
        JuicoyStack.spacing = 20
        JuicoyStack.alignment = .center
        return JuicoyStack
    }()
//vip
    private lazy var JuicoyImperialVIPAd: UIButton = {
        let JuicoyBtn = UIButton()
        JuicoyBtn.setBackgroundImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "joicoysizevip"), for: .normal)
        JuicoyBtn.addTarget(self, action: #selector(JJuicoyUMPJuicoymembershipController), for: .touchUpInside)
        
        return JuicoyBtn
    }()
    
   @objc func JJuicoyUMPJuicoymembershipController() {
       self.navigationController?.pushViewController(JuicoymembershipController(), animated: true)
    }
//my video
    private let JuicoyGlimpseVideoHeader: UIButton = {
        let JuicoyView = UIButton()
        
        let img = UIImageView(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "joicoyshaiur"))
        img.frame = CGRect(x: 0, y: (35 - 16)/2, width: 16, height: 16)
        JuicoyView.addSubview(img)
        let joicoynext = UIImageView(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "joicoynext"))
        joicoynext.frame = CGRect(x: 300, y: (35 - 30)/2, width: 34, height: 30)
        
        
        JuicoyView.addSubview(joicoynext)
        let JuicoyLabel = UILabel(frame: CGRect.init(x: 24, y: (35 - 16)/2, width: 70, height: 16))
        JuicoyLabel.text = "Moyg cVaindkeho".JoicoydeMercrypt()
        JuicoyLabel.textColor = .white
        JuicoyLabel.font = UIFont.systemFont(ofSize: 15)
        JuicoyView.addSubview(JuicoyLabel)
        JuicoyView.addTarget(self, action: #selector(JJuicoyUMPJuicomyvide0ontroller), for: .touchUpInside)
        
        return JuicoyView
    }()

    
    @objc func JJuicoyUMPJuicomyvide0ontroller() {
        self.navigationController?.pushViewController(JuicoyCollectionMasterController.init(JuicoyMode: .JuicoyVideoOrbit), animated: true)
     }
    
    
    private let JuicoyDesolateStateIcon: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "joicoynodatare")
        JuicoyImg.contentMode = .scaleAspectFit
        return JuicoyImg
    }()

   

    override func viewDidLoad() {
        super.viewDidLoad()
        JuicoyWeaveMainCanvas()
        JuicoyCalibrateFabricArchitecture()
        JuicoyPopulateThreadStats()
    }

    private func JuicoyWeaveMainCanvas() {
        view.addSubview(JuicoyVelvetScrollContainer)
        JuicoyVelvetScrollContainer.addSubview(JuicoyFabricContentStack)
        
        [JuicoyStageCoverImage, JuicoyIconicAvatarFrame,JuicoyGDIOmentCount, JuicoyImperialCrownBadge,JuicoyGlassVIPTrigger,Juicoyedit,
         JuicoyStylePersonaName, JuicoyEliteVipTag,JuicoyGIFTHeader, JuicoyAuraBioLabel,
         JuicoyMomentumStatsGrid, JuicoyImperialVIPAd, JuicoyGlimpseVideoHeader,
         JuicoyDesolateStateIcon, JuicoyGlassSettingTrigger].forEach {
            JuicoyFabricContentStack.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        JuicoyVelvetScrollContainer.translatesAutoresizingMaskIntoConstraints = false
        JuicoyFabricContentStack.translatesAutoresizingMaskIntoConstraints = false
    }

    private func JuicoyCalibrateFabricArchitecture() {
        NSLayoutConstraint.activate([
            JuicoyVelvetScrollContainer.topAnchor.constraint(equalTo: view.topAnchor),
            JuicoyVelvetScrollContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyVelvetScrollContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyVelvetScrollContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            JuicoyFabricContentStack.topAnchor.constraint(equalTo: JuicoyVelvetScrollContainer.topAnchor),
            JuicoyFabricContentStack.leadingAnchor.constraint(equalTo: JuicoyVelvetScrollContainer.leadingAnchor),
            JuicoyFabricContentStack.trailingAnchor.constraint(equalTo: JuicoyVelvetScrollContainer.trailingAnchor),
            JuicoyFabricContentStack.bottomAnchor.constraint(equalTo: JuicoyVelvetScrollContainer.bottomAnchor),
            JuicoyFabricContentStack.heightAnchor.constraint(equalToConstant: 980),
            JuicoyFabricContentStack.widthAnchor.constraint(equalTo: JuicoyVelvetScrollContainer.widthAnchor),

            JuicoyStageCoverImage.topAnchor.constraint(equalTo: JuicoyFabricContentStack.topAnchor),
            JuicoyStageCoverImage.leadingAnchor.constraint(equalTo: JuicoyFabricContentStack.leadingAnchor),
            JuicoyStageCoverImage.trailingAnchor.constraint(equalTo: JuicoyFabricContentStack.trailingAnchor),
            JuicoyStageCoverImage.heightAnchor.constraint(equalToConstant: 380),

           
            JuicoyGlassSettingTrigger.topAnchor.constraint(equalTo: JuicoyFabricContentStack.topAnchor, constant: 50),
            JuicoyGlassSettingTrigger.trailingAnchor.constraint(equalTo: JuicoyFabricContentStack.trailingAnchor, constant: -20),
            JuicoyGlassSettingTrigger.widthAnchor.constraint(equalToConstant: 30),
            JuicoyGlassSettingTrigger.heightAnchor.constraint(equalToConstant: 30),

            JuicoyGDIOmentCount.widthAnchor.constraint(equalToConstant: 80),
            JuicoyGDIOmentCount.heightAnchor.constraint(equalToConstant: 30),
            JuicoyGDIOmentCount.trailingAnchor.constraint(equalTo: JuicoyGlassSettingTrigger.leadingAnchor,constant: -15),
            JuicoyGDIOmentCount.centerYAnchor.constraint(equalTo: JuicoyGlassSettingTrigger.centerYAnchor),
            
            
            JuicoyIconicAvatarFrame.leadingAnchor.constraint(equalTo: JuicoyFabricContentStack.leadingAnchor, constant: 20),
            JuicoyIconicAvatarFrame.bottomAnchor.constraint(equalTo: JuicoyStageCoverImage.bottomAnchor, constant: 15),
            JuicoyIconicAvatarFrame.widthAnchor.constraint(equalToConstant: 90),
            JuicoyIconicAvatarFrame.heightAnchor.constraint(equalToConstant: 90),

            JuicoyGlassVIPTrigger.widthAnchor.constraint(equalToConstant: 23),
            JuicoyGlassVIPTrigger.heightAnchor.constraint(equalToConstant: 23),
            JuicoyGlassVIPTrigger.trailingAnchor.constraint(equalTo: JuicoyIconicAvatarFrame.trailingAnchor,constant: 0),
             JuicoyGlassVIPTrigger.bottomAnchor.constraint(equalTo: JuicoyIconicAvatarFrame.bottomAnchor, constant: 0),
             
            
            JuicoyImperialCrownBadge.bottomAnchor.constraint(equalTo: JuicoyIconicAvatarFrame.bottomAnchor),
            JuicoyImperialCrownBadge.trailingAnchor.constraint(equalTo: JuicoyIconicAvatarFrame.trailingAnchor),
            JuicoyImperialCrownBadge.widthAnchor.constraint(equalToConstant: 25),
            JuicoyImperialCrownBadge.heightAnchor.constraint(equalToConstant: 25),

            
            Juicoyedit.widthAnchor.constraint(equalToConstant: 65),
            Juicoyedit.heightAnchor.constraint(equalToConstant: 30),
            Juicoyedit.trailingAnchor.constraint(equalTo: JuicoyFabricContentStack.trailingAnchor, constant: -15),
            Juicoyedit.centerYAnchor.constraint(equalTo: JuicoyIconicAvatarFrame.centerYAnchor),
            
            
            
            
            JuicoyStylePersonaName.topAnchor.constraint(equalTo: JuicoyIconicAvatarFrame.bottomAnchor, constant: 12),
            JuicoyStylePersonaName.leadingAnchor.constraint(equalTo: JuicoyFabricContentStack.leadingAnchor, constant: 20),

            JuicoyEliteVipTag.centerYAnchor.constraint(equalTo: JuicoyStylePersonaName.centerYAnchor),
            JuicoyEliteVipTag.leadingAnchor.constraint(equalTo: JuicoyStylePersonaName.trailingAnchor, constant: 8),

            
            JuicoyGIFTHeader.widthAnchor.constraint(equalToConstant: 80),
            JuicoyGIFTHeader.heightAnchor.constraint(equalToConstant: 30),
            JuicoyGIFTHeader.trailingAnchor.constraint(equalTo: JuicoyFabricContentStack.trailingAnchor,constant: -15),
            JuicoyGIFTHeader.centerYAnchor.constraint(equalTo: JuicoyStylePersonaName.centerYAnchor),
            
            JuicoyAuraBioLabel.topAnchor.constraint(equalTo: JuicoyStylePersonaName.bottomAnchor, constant: 8),
            JuicoyAuraBioLabel.leadingAnchor.constraint(equalTo: JuicoyStylePersonaName.leadingAnchor),

            JuicoyMomentumStatsGrid.topAnchor.constraint(equalTo: JuicoyAuraBioLabel.bottomAnchor, constant: 20),
            JuicoyMomentumStatsGrid.leadingAnchor.constraint(equalTo: JuicoyFabricContentStack.leadingAnchor, constant: 20),

            JuicoyImperialVIPAd.topAnchor.constraint(equalTo: JuicoyMomentumStatsGrid.bottomAnchor, constant: 25),
            JuicoyImperialVIPAd.leadingAnchor.constraint(equalTo: JuicoyFabricContentStack.leadingAnchor, constant: 15),
            JuicoyImperialVIPAd.trailingAnchor.constraint(equalTo: JuicoyFabricContentStack.trailingAnchor, constant: -15),
            JuicoyImperialVIPAd.heightAnchor.constraint(equalToConstant: 111),

            JuicoyGlimpseVideoHeader.leadingAnchor.constraint(equalTo: JuicoyFabricContentStack.leadingAnchor, constant: 20),
            JuicoyGlimpseVideoHeader.trailingAnchor.constraint(equalTo: JuicoyFabricContentStack.trailingAnchor, constant: 20),
            JuicoyGlimpseVideoHeader.topAnchor.constraint(equalTo: JuicoyImperialVIPAd.bottomAnchor, constant: 15),
            
            JuicoyDesolateStateIcon.topAnchor.constraint(equalTo: JuicoyImperialVIPAd.bottomAnchor, constant: 60),
            JuicoyDesolateStateIcon.centerXAnchor.constraint(equalTo: JuicoyFabricContentStack.centerXAnchor),
            JuicoyDesolateStateIcon.widthAnchor.constraint(equalToConstant: 140),
            JuicoyDesolateStateIcon.heightAnchor.constraint(equalToConstant: 112),

        ])
    }

    private func JuicoyPopulateThreadStats() {
        let JuicoyFollowThread = JuicoyForgeStatUnit(JuicoyVal: "\(JuicoyDataFactory.JuicoySharedInstance.JuicoyObtainCachedFollowingsUser().count)", JuicoyTitle: "Fionlwlfodwsiknfg".JoicoydeMercrypt())
        JuicoyFollowThread.addTarget(self, action: #selector(JJuicoyUMJuicoyFollowThread), for: .touchUpInside)
        let JuicoyFanThread = JuicoyForgeStatUnit(JuicoyVal: "0", JuicoyTitle: "Fkoflklpocwbecrms".JoicoydeMercrypt())
        JuicoyFanThread.addTarget(self, action: #selector(JJuicoyUMJuicoyFanThread), for: .touchUpInside)
        JuicoyMomentumStatsGrid.addArrangedSubview(JuicoyFollowThread)
        JuicoyMomentumStatsGrid.addArrangedSubview(JuicoyFanThread)
    }

    @objc func JJuicoyUMJuicoyFollowThread() {
        self.navigationController?.pushViewController(JuicoyMotionNexusController.init(JuicoyTargetMode: .JuicoyFollowing), animated: true)
     }
    
    
    @objc func JJuicoyUMJuicoyFanThread() {
        self.navigationController?.pushViewController(JuicoyMotionNexusController.init(JuicoyTargetMode: .JuicoyFollower), animated: true)
     }
    private func JuicoyForgeStatUnit(JuicoyVal: String, JuicoyTitle: String) -> UIButton {
        let JuicoyBox = UIButton()
        let JuicoyNum = UILabel()
        JuicoyNum.text = JuicoyVal
        JuicoyNum.textColor = .white
        JuicoyNum.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let JuicoyTag = UILabel()
        JuicoyTag.text = JuicoyTitle
        JuicoyTag.textColor = .lightGray
        JuicoyTag.font = UIFont.systemFont(ofSize: 14)
        
        JuicoyBox.addSubview(JuicoyNum)
        JuicoyBox.addSubview(JuicoyTag)
        JuicoyNum.translatesAutoresizingMaskIntoConstraints = false
        JuicoyTag.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            JuicoyNum.topAnchor.constraint(equalTo: JuicoyBox.topAnchor),
            JuicoyNum.leadingAnchor.constraint(equalTo: JuicoyBox.leadingAnchor),
            JuicoyTag.centerYAnchor.constraint(equalTo: JuicoyNum.centerYAnchor),
            JuicoyTag.leadingAnchor.constraint(equalTo: JuicoyNum.trailingAnchor, constant: 8),
            JuicoyTag.trailingAnchor.constraint(equalTo: JuicoyBox.trailingAnchor),
            JuicoyTag.bottomAnchor.constraint(equalTo: JuicoyBox.bottomAnchor)
        ])
        return JuicoyBox
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let useiINfo = JuicoyDataFactory.currentUserModel else {
            return
        }
        JuicoyStageCoverImage.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: useiINfo.JuicoyAvatarKey)
        JuicoyIconicAvatarFrame.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: useiINfo.JuicoyAvatarKey)
        JuicoyStylePersonaName.text = useiINfo.JuicoyHandle
        
        
        JuicoyGlassVIPTrigger.isHidden = !(useiINfo.JuicoyPremiumStatus == "1")
        JuicoyEliteVipTag.isHidden = !(useiINfo.JuicoyPremiumStatus == "1")
        JuicoyAuraBioLabel.text = useiINfo.JuicoyMotto
        
        
        if JuicoyDataFactory.JuicoyuserBackground?.first != nil{
            JuicoyStageCoverImage.image = JuicoyDataFactory.JuicoyuserBackground?.first!
           
        }else{
            JuicoyStageCoverImage.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyDynamicLog")
        }
        
        if JuicoyDataFactory.Juicoyuserphtho != nil{
            JuicoyIconicAvatarFrame.image = JuicoyDataFactory.Juicoyuserphtho!
           
        }else{
            JuicoyIconicAvatarFrame.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier:useiINfo.JuicoyAvatarKey)
        }
        
    }
}




extension String{
     func JoicoydeMercrypt() -> String {
         return String(self.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element })
     }
}
