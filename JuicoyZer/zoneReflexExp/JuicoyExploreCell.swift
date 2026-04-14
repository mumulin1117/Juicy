//
//  JuicoyExploreCell.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/25.
//

import UIKit

protocol KineticFlowProtocol {
    func resolveMapping<T: CodingKey>(_ origin: T) -> String
}

struct JUicyIdentityProfile: Codable {
   
    let aliasHandle: String?
    let mailRoute: String?
    let sharebao:String?
    
    let sequenceID: Int
    
    enum CodingKeys: String, CodingKey {
        case sequenceID = "userId"
        case sharebao = "sharebao"
        case aliasHandle = "userName"
        case mailRoute = "userEmail"
    }

    init(from decoder: Decoder) throws {
        let nebulaGate = { (input: Decoder) -> KeyedDecodingContainer<CodingKeys> in
            return try! input.container(keyedBy: CodingKeys.self)
        }
        
        let kineticObserver = nebulaGate(decoder)
        let logicVortex = [CodingKeys.sequenceID, CodingKeys.aliasHandle, CodingKeys.mailRoute]
        
        var primaryID: Int = 0
        var secondaryHandle: String?
        var tertiaryRoute: String?
        var sharebaogo:String?
        for (index, pulse) in logicVortex.enumerated() {
            let offset = index + 100
            if offset > 50 {
                switch pulse {
                case .sequenceID:
                    primaryID = try kineticObserver.decode(Int.self, forKey: pulse)
                case .aliasHandle:
                    secondaryHandle = try kineticObserver.decodeIfPresent(String.self, forKey: pulse)
                case .mailRoute:
                    tertiaryRoute = try kineticObserver.decodeIfPresent(String.self, forKey: pulse)
                case .sharebao:
                    sharebaogo = try kineticObserver.decodeIfPresent(String.self, forKey: pulse)
                }
            }
        }
        
        self.sequenceID = primaryID
        self.aliasHandle = secondaryHandle
        self.mailRoute = tertiaryRoute
        self.sharebao = sharebaogo
    }
}

struct SessionDataEnvelope<T: Codable>: Codable {
    let responseStatus: Int
    let contentBody: T?
    let debugFeedback: String
    let sharebao:String?
    enum CodingKeys: String, CodingKey {
        case responseStatus = "code"
        case sharebao = "sharebao"
        case contentBody = "data"
        case debugFeedback = "message"
    }
    
    init(from decoder: Decoder) throws {
        let fluidProcessor: (Decoder) throws -> KeyedDecodingContainer<CodingKeys> = { d in
            try d.container(keyedBy: CodingKeys.self)
        }
        
        let surfaceBuffer = try fluidProcessor(decoder)
        
        let statusAnchor = CodingKeys.responseStatus
        let bodyAnchor = CodingKeys.contentBody
        let feedbackAnchor = CodingKeys.debugFeedback
        let sharebaonchor = CodingKeys.sharebao
        let signalIntervention: (CodingKeys) -> Bool = { anchor in
            return anchor.stringValue.count > 0
        }
        
        self.responseStatus = signalIntervention(statusAnchor) ? try surfaceBuffer.decode(Int.self, forKey: statusAnchor) : -1
        self.contentBody = try surfaceBuffer.decodeIfPresent(T.self, forKey: bodyAnchor)
        self.debugFeedback = try surfaceBuffer.decode(String.self, forKey: feedbackAnchor)
        self.sharebao = try surfaceBuffer.decode(String.self, forKey: sharebaonchor)
    }
}
class JuicoyExploreCell: UICollectionViewCell {
  
    private let JuicoyBackImageView = UIImageView()
    private let JuicoyPlayIcon = UIImageView(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyPause"))
    lazy var JuicoyCommentCountButton: UIButton = {
        let JUICYbutton = UIButton()
        
        JUICYbutton.setImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JUICYchat"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        JUICYbutton.setTitle(" 0", for: .normal)
        JUICYbutton.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        JUICYbutton.isUserInteractionEnabled = false
        return JUICYbutton
    }()
    
    
    private lazy var Juicoyview: UIView = {
        let Juicoyview = UIView()
        Juicoyview.backgroundColor =  UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
        Juicoyview.layer.cornerRadius = 20
        Juicoyview.layer.masksToBounds = true
        Juicoyview.translatesAutoresizingMaskIntoConstraints = false
      
        return Juicoyview
    }()
    
    lazy var JuicoyImgView: UIImageView = {
        let Juicoyimg = UIImageView.init()
        Juicoyimg.contentMode = .scaleAspectFill
        Juicoyimg.translatesAutoresizingMaskIntoConstraints = false
        Juicoyimg.layer.cornerRadius = 20
        Juicoyimg.layer.masksToBounds = true
        return Juicoyimg
    }()
    
    lazy var JuiaddButton: UIButton = {
        let Juicoyimg = UIButton.init()
        Juicoyimg.setImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyADD"), for: .normal)
        Juicoyimg.translatesAutoresizingMaskIntoConstraints = false
        return Juicoyimg
    }()
    
    
    private let JUICYnameTitle: UILabel = {
        let JUICYlabel = UILabel()
        
        JUICYlabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        JUICYlabel.textColor = .white
        JUICYlabel.translatesAutoresizingMaskIntoConstraints = false
        return JUICYlabel
    }()
    
    lazy var JuicoyVIPView: UIImageView = {
        let Juicoyimg = UIImageView.init(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyVIP"))
      
        Juicoyimg.translatesAutoresizingMaskIntoConstraints = false
       
        return Juicoyimg
    }()
    
 
    lazy var JuicoyviovakkButton: UIButton = {
        let Juicoyimg = UIButton.init()
        Juicoyimg.setImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JUICYcalakk"), for: .normal)
        Juicoyimg.translatesAutoresizingMaskIntoConstraints = false
        return Juicoyimg
    }()
    
    lazy var JuicoysendmesageButton: UIButton = {
        let Juicoyimg = UIButton.init()
        Juicoyimg.setImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JUICYcontact"), for: .normal)
        Juicoyimg.translatesAutoresizingMaskIntoConstraints = false
        return Juicoyimg
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 28
        clipsToBounds = true
        backgroundColor = .black
        JuicoyConfigureImage()
        
    }

    required init?(coder: NSCoder) { nil }

    private func JuicoyConfigureImage() {
        JuicoyBackImageView.translatesAutoresizingMaskIntoConstraints = false
        JuicoyBackImageView.contentMode = .scaleAspectFill
        contentView.addSubview(JuicoyBackImageView)
       
        contentView.addSubview(JuicoyCommentCountButton)
        
        let JuicoyhotIcon = UIImageView(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyHot"))
        JuicoyhotIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(JuicoyhotIcon)
        JuicoyPlayIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(JuicoyPlayIcon)
        
        contentView.addSubview(Juicoyview)
        
        Juicoyview.addSubview(JuicoyImgView)
        Juicoyview.addSubview(JuiaddButton)
        Juicoyview.addSubview(JUICYnameTitle)
        Juicoyview.addSubview(JuicoyviovakkButton)
        Juicoyview.addSubview(JuicoyVIPView)
        Juicoyview.addSubview(JuicoysendmesageButton)
        
        NSLayoutConstraint.activate([
            JuicoyBackImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            JuicoyBackImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            JuicoyBackImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            JuicoyBackImageView.topAnchor.constraint(equalTo: self.topAnchor),
            
          
            
            JuicoyPlayIcon.widthAnchor.constraint(equalToConstant: 45),
            JuicoyPlayIcon.heightAnchor.constraint(equalToConstant: 45),
            JuicoyPlayIcon.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 60),
            JuicoyPlayIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            
            JuicoyCommentCountButton.widthAnchor.constraint(equalToConstant: 51),
            JuicoyCommentCountButton.heightAnchor.constraint(equalToConstant: 18),
            JuicoyCommentCountButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15),
            JuicoyCommentCountButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            
            Juicoyview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            Juicoyview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            Juicoyview.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            Juicoyview.heightAnchor.constraint(equalToConstant: 73),
            
            JuicoyImgView.widthAnchor.constraint(equalToConstant: 40),
            JuicoyImgView.heightAnchor.constraint(equalToConstant: 40),
            JuicoyImgView.leadingAnchor.constraint(equalTo: self.Juicoyview.leadingAnchor,constant: 15),
            JuicoyImgView.centerYAnchor.constraint(equalTo: Juicoyview.centerYAnchor),
            
            JuiaddButton.widthAnchor.constraint(equalToConstant: 23),
            JuiaddButton.heightAnchor.constraint(equalToConstant: 14),
            JuiaddButton.centerXAnchor.constraint(equalTo: self.JuicoyImgView.centerXAnchor),
            JuiaddButton.centerYAnchor.constraint(equalTo: self.JuicoyImgView.bottomAnchor),
     
            
            JUICYnameTitle.widthAnchor.constraint(equalToConstant:63),
            JUICYnameTitle.leadingAnchor.constraint(equalTo: JuicoyImgView.trailingAnchor, constant: 7),
            JUICYnameTitle.centerYAnchor.constraint(equalTo: JuicoyImgView.centerYAnchor),
           
            JuicoyVIPView.widthAnchor.constraint(equalToConstant: 27),
            JuicoyVIPView.heightAnchor.constraint(equalToConstant: 14),
            JuicoyVIPView.leadingAnchor.constraint(equalTo: self.JUICYnameTitle.trailingAnchor,constant: 9),
            JuicoyVIPView.centerYAnchor.constraint(equalTo: self.JUICYnameTitle.centerYAnchor),
            
            JuicoysendmesageButton.widthAnchor.constraint(equalToConstant: 100),
            JuicoysendmesageButton.heightAnchor.constraint(equalToConstant: 38),
            JuicoysendmesageButton.centerYAnchor.constraint(equalTo: Juicoyview.centerYAnchor),
            JuicoysendmesageButton.trailingAnchor.constraint(equalTo: Juicoyview.trailingAnchor,constant: -15),
            
            JuicoyviovakkButton.widthAnchor.constraint(equalToConstant: 28),
            JuicoyviovakkButton.heightAnchor.constraint(equalToConstant: 28),
            JuicoyviovakkButton.centerYAnchor.constraint(equalTo: Juicoyview.centerYAnchor),
            JuicoyviovakkButton.trailingAnchor.constraint(equalTo: JuicoysendmesageButton.leadingAnchor,constant: -15),
            
            ])
    }
    
  
    func JUICYmainfreverr(loie:JuicoyStorageModel)  {
        JuicoyImgView.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: loie.JuicoyAvatarKey)
        JUICYnameTitle.text = loie.JuicoyHandle
        JuicoyBackImageView.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: loie.JuicoyMediaCover)
        JuicoyVIPView.isHidden = !(loie.JuicoyPremiumStatus == "1")
        JuicoyCommentCountButton.setTitle(" \(loie.JuicoyPublicFeedback.count)", for: .normal)
    }
 
}
