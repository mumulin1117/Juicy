//
//  JuicoyExternalNexusController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/29.
//

import UIKit
protocol JuicoyExternalNexusControllerDelegate {
    func JuicoyupdateJuicoyStorageModel(model:JuicoyStorageModel)
}
class JuicoyExternalNexusController: JuicoySeconedViewController {
    var delegate:JuicoyExternalNexusControllerDelegate?
   
    var juicoyModel:JuicoyStorageModel
    init(juicoyModel: JuicoyStorageModel) {
        self.juicoyModel = juicoyModel
        super.init(nibName: nil, bundle: nil)
    }
    
     required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let JuicoyPrimaryScroller: UIScrollView = {
        let JuicoyScroller = UIScrollView()
        JuicoyScroller.backgroundColor = UIColor(red: 0.1, green: 0.02, blue: 0.15, alpha: 1.0)
        JuicoyScroller.contentInsetAdjustmentBehavior = .never
        JuicoyScroller.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyScroller
    }()

    private let JuicoyProfileHeader: UIImageView = {
        let JuicoyImg = UIImageView()
       
        JuicoyImg.contentMode = .scaleAspectFill
        JuicoyImg.clipsToBounds = true
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()

    private let JuicoyAvatarOrbit: UIImageView = {
        let JuicoyView = UIImageView()
        JuicoyView.contentMode = .scaleAspectFill
        JuicoyView.layer.cornerRadius = 45
        JuicoyView.layer.borderWidth = 3
        JuicoyView.layer.borderColor = UIColor.systemYellow.cgColor
        JuicoyView.backgroundColor = .darkGray
        JuicoyView.clipsToBounds = true
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    private let JuicoyIdentityLabel: UILabel = {
        let JuicoyLab = UILabel()
        
        JuicoyLab.font = .systemFont(ofSize: 22, weight: .bold)
        JuicoyLab.textColor = .white
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private let JuicoyVipBadge: UIImageView = {
        let JuicoyImg = UIImageView(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoyVIP"))
       
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()

    private let JuicoySocialMetricStack: UIStackView = {
        let JuicoyStack = UIStackView()
        JuicoyStack.axis = .horizontal
        JuicoyStack.spacing = 20
        JuicoyStack.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyStack
    }()

    private let JuicoyFollowTrigger: UIButton = {
        let JuicoyBtn = UIButton()
        JuicoyBtn.setImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "BigoYfollo"), for: .normal)
        JuicoyBtn.setImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "BigoBufollo"), for: .selected)
       
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyBtn
    }()

    private let JuicoyInterestGrid: UIView = {
        let JuicoyView = UIView()
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    private let JuicoyActionDock: UIView = {
        let JuicoyView = UIView()
        JuicoyView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        
        return JuicoyView
    }()

    private let JuicoyVideoCallEmit: UIButton = {
        let JuicoyBtn = UIButton(type: .system)
        JuicoyBtn.setBackgroundImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "hunweibacy"), for: .normal)
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        JuicoyBtn.addTarget(self, action: #selector(toJuicoyVideoCallEmit), for: .touchUpInside)
        return JuicoyBtn
    }()

    private lazy var JuicoyMessageEmit: UIButton = {
        let JuicoyBtn = UIButton(type: .system)
        JuicoyBtn.setBackgroundImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "JuicoyMessageEmit"), for: .normal)
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        JuicoyBtn.addTarget(self, action: #selector(toJuicoyMessageEmit), for: .touchUpInside)
        return JuicoyBtn
    }()

    @objc func toJuicoyMessageEmit()  {
        self.navigationController?.pushViewController(JuicoyMeadggFotuseController(juicoyModel: juicoyModel), animated: true)
    }
    
    
    @objc func toJuicoyVideoCallEmit()  {
        self.navigationController?.pushViewController(JuicoyTeleLinkController(juicoyModel: juicoyModel), animated: true)
    }
    
    @objc func observeJuicoyUserBlacklisted() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(observeJuicoyUserBlacklisted), name: NSNotification.Name("JuicoyUserBlacklisted"), object: nil)
        self.JuicoyaddRightBarButton(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "jocoymoieh"),action: #selector(JuicoyInvokeMenuSheet))
        
        
        JuicoyAssembleInterface()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: DispatchWorkItem(block: {
            self.JUICOYDismissLoad()
            self.JuicoyProfileHeader.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: self.juicoyModel.JuicoyAvatarKey)
            self.JuicoyAvatarOrbit.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: self.juicoyModel.JuicoyAvatarKey)
            self.JuicoyIdentityLabel.text = self.juicoyModel.JuicoyHandle
            self.JuicoyVipBadge.isHidden = !(self.juicoyModel.JuicoyPremiumStatus == "1")
        }))
        
       
    }

    private func JuicoyAssembleInterface() {
        view.addSubview(JuicoyPrimaryScroller)
        view.addSubview(JuicoyActionDock)
        JuicoyFollowTrigger.isSelected = (self.juicoyModel.JuicoyFollowStatus == "1")
        let JuicoyContentHolder = UIView()
        JuicoyContentHolder.translatesAutoresizingMaskIntoConstraints = false
        JuicoyPrimaryScroller.addSubview(JuicoyContentHolder)
        
        JuicoyContentHolder.addSubview(JuicoyProfileHeader)
        JuicoyContentHolder.addSubview(JuicoyAvatarOrbit)
        JuicoyContentHolder.addSubview(JuicoyIdentityLabel)
        JuicoyContentHolder.addSubview(JuicoyVipBadge)
        JuicoyContentHolder.addSubview(JuicoyFollowTrigger)
        JuicoyContentHolder.addSubview(JuicoySocialMetricStack)
        
        JuicoyActionDock.addSubview(JuicoyVideoCallEmit)
        JuicoyActionDock.addSubview(JuicoyMessageEmit)

        NSLayoutConstraint.activate([
            JuicoyPrimaryScroller.topAnchor.constraint(equalTo: view.topAnchor),
            JuicoyPrimaryScroller.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyPrimaryScroller.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyPrimaryScroller.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            JuicoyContentHolder.topAnchor.constraint(equalTo: JuicoyPrimaryScroller.topAnchor),
            JuicoyContentHolder.leadingAnchor.constraint(equalTo: JuicoyPrimaryScroller.leadingAnchor),
            JuicoyContentHolder.trailingAnchor.constraint(equalTo: JuicoyPrimaryScroller.trailingAnchor),
            JuicoyContentHolder.bottomAnchor.constraint(equalTo: JuicoyPrimaryScroller.bottomAnchor),
            JuicoyContentHolder.widthAnchor.constraint(equalTo: JuicoyPrimaryScroller.widthAnchor),

            JuicoyProfileHeader.topAnchor.constraint(equalTo: JuicoyContentHolder.topAnchor),
            JuicoyProfileHeader.leadingAnchor.constraint(equalTo: JuicoyContentHolder.leadingAnchor),
            JuicoyProfileHeader.trailingAnchor.constraint(equalTo: JuicoyContentHolder.trailingAnchor),
            JuicoyProfileHeader.heightAnchor.constraint(equalToConstant: 400),

            JuicoyAvatarOrbit.leadingAnchor.constraint(equalTo: JuicoyContentHolder.leadingAnchor, constant: 20),
            JuicoyAvatarOrbit.centerYAnchor.constraint(equalTo: JuicoyProfileHeader.bottomAnchor, constant: -20),
            JuicoyAvatarOrbit.widthAnchor.constraint(equalToConstant: 90),
            JuicoyAvatarOrbit.heightAnchor.constraint(equalToConstant: 90),

            JuicoyFollowTrigger.trailingAnchor.constraint(equalTo: JuicoyContentHolder.trailingAnchor, constant: -20),
            JuicoyFollowTrigger.centerYAnchor.constraint(equalTo: JuicoyProfileHeader.bottomAnchor, constant: 10),
            JuicoyFollowTrigger.widthAnchor.constraint(equalToConstant: 100),
            JuicoyFollowTrigger.heightAnchor.constraint(equalToConstant: 30),

            JuicoyIdentityLabel.topAnchor.constraint(equalTo: JuicoyAvatarOrbit.bottomAnchor, constant: 15),
            JuicoyIdentityLabel.leadingAnchor.constraint(equalTo: JuicoyContentHolder.leadingAnchor, constant: 20),

            JuicoyVipBadge.centerYAnchor.constraint(equalTo: JuicoyIdentityLabel.centerYAnchor),
            JuicoyVipBadge.leadingAnchor.constraint(equalTo: JuicoyIdentityLabel.trailingAnchor, constant: 8),
            JuicoyVipBadge.widthAnchor.constraint(equalToConstant: 35),
            JuicoyVipBadge.heightAnchor.constraint(equalToConstant: 18),

            JuicoyActionDock.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyActionDock.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyActionDock.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            JuicoyActionDock.heightAnchor.constraint(equalToConstant: 100),

            JuicoyVideoCallEmit.leadingAnchor.constraint(equalTo: JuicoyActionDock.leadingAnchor, constant: 20),
            JuicoyVideoCallEmit.topAnchor.constraint(equalTo: JuicoyActionDock.topAnchor, constant: 10),
            JuicoyVideoCallEmit.heightAnchor.constraint(equalToConstant: 50),
            JuicoyVideoCallEmit.trailingAnchor.constraint(equalTo: JuicoyActionDock.centerXAnchor, constant: -10),

            JuicoyMessageEmit.trailingAnchor.constraint(equalTo: JuicoyActionDock.trailingAnchor, constant: -20),
            JuicoyMessageEmit.topAnchor.constraint(equalTo: JuicoyActionDock.topAnchor, constant: 10),
            JuicoyMessageEmit.heightAnchor.constraint(equalToConstant: 50),
            JuicoyMessageEmit.leadingAnchor.constraint(equalTo: JuicoyActionDock.centerXAnchor, constant: 10)
        ])
        
        JuicoyIntegrateComponentFlow(JuicoyContainer: JuicoyContentHolder)

        JuicoyFollowTrigger.addTarget(self, action: #selector(JuicoyToggleFollow), for: .touchUpInside)
        JuicoyVideoCallEmit.addTarget(self, action: #selector(JuicoyInitiateTransmission), for: .touchUpInside)
        
        JUICOYaddLoadingViewONSurface()
        self.JUICOYbeginLoad()
    }

    @objc private func JuicoyToggleFollow() {
      let stataus =  JuicoyDataFactory.JuicoySharedInstance.JuicoyToggleFollowStatus(for: self.juicoyModel.JuicoyIdentifier)
        
        self.juicoyModel.JuicoyFollowStatus = stataus
        JuicoyFollowTrigger.isSelected = (stataus == "1")
     //更新上一页面的数据
        if delegate != nil {
            self.delegate?.JuicoyupdateJuicoyStorageModel(model: self.juicoyModel)
        }
        
    }

    @objc private func JuicoyInitiateTransmission() {
        let JuicoyFlash = UIView(frame: view.bounds)
        JuicoyFlash.backgroundColor = .black
        JuicoyFlash.alpha = 0
        view.addSubview(JuicoyFlash)
        
        UIView.animate(withDuration: 0.3, animations: {
            JuicoyFlash.alpha = 0.8
        }) { _ in
           
            JuicoyFlash.removeFromSuperview()
        }
    }
    
    
    
    @objc private func JuicoyInvokeMenuSheet() {
        let JuicoyActionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // 举报动作
        let JuicoyReportAction = UIAlertAction(title: "Rnegpkocrttu iCwownctseznlt".JoicoydeMercrypt(), style: .default) { _ in
            self.navigationController?.pushViewController(JuicoyAlertReportController(), animated: true)
        }
        
        // 拉黑动作
        let JuicoyBlockAction = UIAlertAction(title: "Bmluoqctku vUmsvesr".JoicoydeMercrypt(), style: .destructive) { _ in
            
            let bloack = JuicoyBlockServiceController(juicoyModel: self.juicoyModel)
            bloack.modalPresentationStyle = .overCurrentContext
            self.present(bloack, animated: true)
        }
        
        // 取消动作
        let JuicoyCancelAction = UIAlertAction(title: "Ctaenqcfekl".JoicoydeMercrypt(), style: .cancel, handler: nil)
        
        JuicoyActionSheet.addAction(JuicoyReportAction)
        JuicoyActionSheet.addAction(JuicoyBlockAction)
        JuicoyActionSheet.addAction(JuicoyCancelAction)
        
     
        
        self.present(JuicoyActionSheet, animated: true, completion: nil)
    }
}



// MARK: - Extension for Interest & Friend Modules
extension JuicoyExternalNexusController {
    
    // MARK: - Signature & Social Metrics
    private func JuicoyBuildBiographySection() -> UIView {
        let JuicoyBioContainer = UIView()
        
        let JuicoySignature = UILabel()
        JuicoySignature.text = juicoyModel.JuicoyMotto
        JuicoySignature.font = .systemFont(ofSize: 14)
        JuicoySignature.textColor = .lightGray
        JuicoySignature.translatesAutoresizingMaskIntoConstraints = false
        
        let JuicoyMetricsStack = UIStackView()
        JuicoyMetricsStack.axis = .horizontal
        JuicoyMetricsStack.spacing = 25
        JuicoyMetricsStack.translatesAutoresizingMaskIntoConstraints = false
        
        let JuicoyFollowData = JuicoyCreateMetricUnit(JuicoyVal: juicoyModel.JuicoyConnectionInCount, JuicoyKey: "Frohlmltotwtimnpg".JoicoydeMercrypt())
        let JuicoyFansData = JuicoyCreateMetricUnit(JuicoyVal: juicoyModel.JuicoyConnectionOutCount, JuicoyKey: "Fforlulkokwneurgs".JoicoydeMercrypt())
        
        JuicoyMetricsStack.addArrangedSubview(JuicoyFollowData)
        JuicoyMetricsStack.addArrangedSubview(JuicoyFansData)
        
        JuicoyBioContainer.addSubview(JuicoySignature)
        JuicoyBioContainer.addSubview(JuicoyMetricsStack)
        
        NSLayoutConstraint.activate([
            JuicoySignature.topAnchor.constraint(equalTo: JuicoyBioContainer.topAnchor),
            JuicoySignature.leadingAnchor.constraint(equalTo: JuicoyBioContainer.leadingAnchor),
            
            JuicoyMetricsStack.topAnchor.constraint(equalTo: JuicoySignature.bottomAnchor, constant: 15),
            JuicoyMetricsStack.leadingAnchor.constraint(equalTo: JuicoyBioContainer.leadingAnchor),
            JuicoyMetricsStack.bottomAnchor.constraint(equalTo: JuicoyBioContainer.bottomAnchor)
        ])
        
        return JuicoyBioContainer
    }
    
    private func JuicoyCreateMetricUnit(JuicoyVal: String, JuicoyKey: String) -> UIView {
        let JuicoyWrapper = UIView()
        let JuicoyValLab = UILabel()
        JuicoyValLab.text = JuicoyVal
        JuicoyValLab.font = .systemFont(ofSize: 18, weight: .bold)
        JuicoyValLab.textColor = .white
        JuicoyValLab.translatesAutoresizingMaskIntoConstraints = false
        
        let JuicoyKeyLab = UILabel()
        JuicoyKeyLab.text = JuicoyKey
        JuicoyKeyLab.font = .systemFont(ofSize: 14)
        JuicoyKeyLab.textColor = .gray
        JuicoyKeyLab.translatesAutoresizingMaskIntoConstraints = false
        
        JuicoyWrapper.addSubview(JuicoyValLab)
        JuicoyWrapper.addSubview(JuicoyKeyLab)
        
        NSLayoutConstraint.activate([
            JuicoyValLab.leadingAnchor.constraint(equalTo: JuicoyWrapper.leadingAnchor),
            JuicoyValLab.centerYAnchor.constraint(equalTo: JuicoyWrapper.centerYAnchor),
            JuicoyKeyLab.leadingAnchor.constraint(equalTo: JuicoyValLab.trailingAnchor, constant: 8),
            JuicoyKeyLab.centerYAnchor.constraint(equalTo: JuicoyValLab.centerYAnchor),
            JuicoyWrapper.trailingAnchor.constraint(equalTo: JuicoyKeyLab.trailingAnchor)
        ])
        
        return JuicoyWrapper
    }

    // MARK: - Friends Horizontal Scroll
    private func JuicoyBuildCompanionScroller() -> UIView {
        let JuicoySectionBase = UIView()
        
        let JuicoyTitle = UILabel()
        JuicoyTitle.text = "Firhioegnwdhs".JoicoydeMercrypt()
        JuicoyTitle.textColor = .white
        JuicoyTitle.font = .systemFont(ofSize: 16, weight: .bold)
        JuicoyTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let JuicoyHScroll = UIScrollView()
        JuicoyHScroll.showsHorizontalScrollIndicator = false
        JuicoyHScroll.translatesAutoresizingMaskIntoConstraints = false
        
        let JuicoyAvatarStack = UIStackView()
        JuicoyAvatarStack.axis = .horizontal
        JuicoyAvatarStack.spacing = 12
        JuicoyAvatarStack.translatesAutoresizingMaskIntoConstraints = false
        
        for i in 0...(self.juicoyModel.JuicoyPeerAvatars.count - 1) {
            let JuicoyCircle = UIImageView()
            JuicoyCircle.contentMode = .scaleAspectFill
            JuicoyCircle.backgroundColor = .systemGray
            JuicoyCircle.layer.cornerRadius = 30
            JuicoyCircle.clipsToBounds = true
            JuicoyCircle.translatesAutoresizingMaskIntoConstraints = false
            JuicoyCircle.widthAnchor.constraint(equalToConstant: 60).isActive = true
            JuicoyCircle.heightAnchor.constraint(equalToConstant: 60).isActive = true
            JuicoyCircle.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: juicoyModel.JuicoyPeerAvatars[i])
            JuicoyAvatarStack.addArrangedSubview(JuicoyCircle)
        }
        
        JuicoySectionBase.addSubview(JuicoyTitle)
        JuicoySectionBase.addSubview(JuicoyHScroll)
        JuicoyHScroll.addSubview(JuicoyAvatarStack)
        
        NSLayoutConstraint.activate([
            JuicoyTitle.topAnchor.constraint(equalTo: JuicoySectionBase.topAnchor),
            JuicoyTitle.leadingAnchor.constraint(equalTo: JuicoySectionBase.leadingAnchor),
            
            JuicoyHScroll.topAnchor.constraint(equalTo: JuicoyTitle.bottomAnchor, constant: 12),
            JuicoyHScroll.leadingAnchor.constraint(equalTo: JuicoySectionBase.leadingAnchor),
            JuicoyHScroll.trailingAnchor.constraint(equalTo: JuicoySectionBase.trailingAnchor),
            JuicoyHScroll.heightAnchor.constraint(equalToConstant: 60),
            JuicoyHScroll.bottomAnchor.constraint(equalTo: JuicoySectionBase.bottomAnchor),
            
            JuicoyAvatarStack.topAnchor.constraint(equalTo: JuicoyHScroll.topAnchor),
            JuicoyAvatarStack.leadingAnchor.constraint(equalTo: JuicoyHScroll.leadingAnchor),
            JuicoyAvatarStack.trailingAnchor.constraint(equalTo: JuicoyHScroll.trailingAnchor),
            JuicoyAvatarStack.bottomAnchor.constraint(equalTo: JuicoyHScroll.bottomAnchor)
        ])
        
        return JuicoySectionBase
    }

    // MARK: - Interest Tags (Flex Layout)
    private func JuicoyBuildHobbyCollection() -> UIView {
        let JuicoyHobbyBase = UIView()
        
        let JuicoyTitle = UILabel()
        JuicoyTitle.text = "Ionmtfemrbepsntsicnyg".JoicoydeMercrypt()
        JuicoyTitle.textColor = .white
        JuicoyTitle.font = .systemFont(ofSize: 16, weight: .bold)
        JuicoyTitle.translatesAutoresizingMaskIntoConstraints = false
        
        // Using a CollectionView is the most robust way to prevent overlap
        let JuicoyTagFlow = UICollectionViewFlowLayout()
        JuicoyTagFlow.scrollDirection = .vertical
        JuicoyTagFlow.minimumInteritemSpacing = 10
        JuicoyTagFlow.minimumLineSpacing = 10
        JuicoyTagFlow.estimatedItemSize = CGSize(width: 80, height: 30) // Automatic width based on text
        
        let JuicoyTagCanvas = UICollectionView(frame: .zero, collectionViewLayout: JuicoyTagFlow)
        JuicoyTagCanvas.backgroundColor = .clear
        JuicoyTagCanvas.isScrollEnabled = false
        JuicoyTagCanvas.translatesAutoresizingMaskIntoConstraints = false
        JuicoyTagCanvas.register(JuicoyHobbyTagCell.self, forCellWithReuseIdentifier: "JuicoyHobbyTag")
        JuicoyTagCanvas.dataSource = self
        JuicoyTagCanvas.delegate = self

        JuicoyHobbyBase.addSubview(JuicoyTitle)
        JuicoyHobbyBase.addSubview(JuicoyTagCanvas)
        
        NSLayoutConstraint.activate([
            JuicoyTitle.topAnchor.constraint(equalTo: JuicoyHobbyBase.topAnchor),
            JuicoyTitle.leadingAnchor.constraint(equalTo: JuicoyHobbyBase.leadingAnchor),
            
            JuicoyTagCanvas.topAnchor.constraint(equalTo: JuicoyTitle.bottomAnchor, constant: 12),
            JuicoyTagCanvas.leadingAnchor.constraint(equalTo: JuicoyHobbyBase.leadingAnchor),
            JuicoyTagCanvas.trailingAnchor.constraint(equalTo: JuicoyHobbyBase.trailingAnchor),
            JuicoyTagCanvas.heightAnchor.constraint(equalToConstant: 100), // Height for 2-3 rows
            JuicoyTagCanvas.bottomAnchor.constraint(equalTo: JuicoyHobbyBase.bottomAnchor)
        ])
        
        return JuicoyHobbyBase
    }

    // MARK: - Juicoy Hobby Cell Definition
    class JuicoyHobbyTagCell: UICollectionViewCell {
        private let JuicoyTagLabel: UILabel = {
            let JuicoyLab = UILabel()
            JuicoyLab.textColor = .white
            JuicoyLab.font = .systemFont(ofSize: 13)
            JuicoyLab.textAlignment = .center
            JuicoyLab.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
            JuicoyLab.layer.cornerRadius = 15
            JuicoyLab.clipsToBounds = true
            JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
            return JuicoyLab
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(JuicoyTagLabel)
            NSLayoutConstraint.activate([
                JuicoyTagLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
                JuicoyTagLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                JuicoyTagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                JuicoyTagLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                JuicoyTagLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
        
        required init?(coder: NSCoder) { fatalError() }
        
        func JuicoyPopulate(JuicoyText: String) {
            JuicoyTagLabel.text = "  \(JuicoyText)  " // Spacing for padding
        }
    }
}

extension JuicoyExternalNexusController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return juicoyModel.JuicoyPassionTags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let JuicoyHobbies = juicoyModel.JuicoyPassionTags
        let JuicoyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JuicoyHobbyTag", for: indexPath) as! JuicoyHobbyTagCell
        JuicoyCell.JuicoyPopulate(JuicoyText: JuicoyHobbies[indexPath.row])
        return JuicoyCell
    }
}

extension JuicoyExternalNexusController {

    // MARK: - Vital Statistics (Table-style)
    private func JuicoyBuildVitalManifest() -> UIView {
        let JuicoyManifestBase = UIView()
        JuicoyManifestBase.backgroundColor = UIColor(white: 1.0, alpha: 0.05)
        JuicoyManifestBase.layer.cornerRadius = 16
        JuicoyManifestBase.translatesAutoresizingMaskIntoConstraints = false
        
        let JuicoyVerticalStack = UIStackView()
        JuicoyVerticalStack.axis = .vertical
        JuicoyVerticalStack.spacing = 0
        JuicoyVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        let JuicoyDataPoints = [
                ("Bwixrstjhodvamy".JoicoydeMercrypt(), juicoyModel.JuicoyBirthEpoch),
                ("Hvecihgohbt".JoicoydeMercrypt(), juicoyModel.JuicoyVerticalStature),
                ("Wsehivgmhot".JoicoydeMercrypt(), juicoyModel.JuicoyBodyMass)
            ]
        
        for (index, point) in JuicoyDataPoints.enumerated() {
            let JuicoyRow = JuicoyAssembleVitalRow(JuicoyLabel: point.0, JuicoyValue: point.1, JuicoyShowDivider: index != JuicoyDataPoints.count - 1)
            JuicoyVerticalStack.addArrangedSubview(JuicoyRow)
        }
        
        JuicoyManifestBase.addSubview(JuicoyVerticalStack)
        
        NSLayoutConstraint.activate([
            JuicoyVerticalStack.topAnchor.constraint(equalTo: JuicoyManifestBase.topAnchor, constant: 10),
            JuicoyVerticalStack.leadingAnchor.constraint(equalTo: JuicoyManifestBase.leadingAnchor, constant: 15),
            JuicoyVerticalStack.trailingAnchor.constraint(equalTo: JuicoyManifestBase.trailingAnchor, constant: -15),
            JuicoyVerticalStack.bottomAnchor.constraint(equalTo: JuicoyManifestBase.bottomAnchor, constant: -10)
        ])
        
        return JuicoyManifestBase
    }
    
    private func JuicoyAssembleVitalRow(JuicoyLabel: String, JuicoyValue: String, JuicoyShowDivider: Bool) -> UIView {
        let JuicoyRowContainer = UIView()
        JuicoyRowContainer.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        let JuicoyTitle = UILabel()
        JuicoyTitle.text = JuicoyLabel
        JuicoyTitle.textColor = .gray
        JuicoyTitle.font = .systemFont(ofSize: 15)
        JuicoyTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let JuicoyDetail = UILabel()
        JuicoyDetail.text = JuicoyValue
        JuicoyDetail.textColor = .white
        JuicoyDetail.font = .systemFont(ofSize: 15, weight: .medium)
        JuicoyDetail.translatesAutoresizingMaskIntoConstraints = false
        
        JuicoyRowContainer.addSubview(JuicoyTitle)
        JuicoyRowContainer.addSubview(JuicoyDetail)
        
        NSLayoutConstraint.activate([
            JuicoyTitle.leadingAnchor.constraint(equalTo: JuicoyRowContainer.leadingAnchor),
            JuicoyTitle.centerYAnchor.constraint(equalTo: JuicoyRowContainer.centerYAnchor),
            JuicoyDetail.trailingAnchor.constraint(equalTo: JuicoyRowContainer.trailingAnchor),
            JuicoyDetail.centerYAnchor.constraint(equalTo: JuicoyRowContainer.centerYAnchor)
        ])
        
        if JuicoyShowDivider {
            let JuicoyLine = UIView()
            JuicoyLine.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
            JuicoyLine.translatesAutoresizingMaskIntoConstraints = false
            JuicoyRowContainer.addSubview(JuicoyLine)
            NSLayoutConstraint.activate([
                JuicoyLine.leadingAnchor.constraint(equalTo: JuicoyRowContainer.leadingAnchor),
                JuicoyLine.trailingAnchor.constraint(equalTo: JuicoyRowContainer.trailingAnchor),
                JuicoyLine.bottomAnchor.constraint(equalTo: JuicoyRowContainer.bottomAnchor),
                JuicoyLine.heightAnchor.constraint(equalToConstant: 0.5)
            ])
        }
        
        return JuicoyRowContainer
    }
    
    // Inside JuicoyExternalNexusController -> JuicoyAssembleInterface()
    private func JuicoyIntegrateComponentFlow(JuicoyContainer: UIView) {
        let JuicoyMasterStack = UIStackView()
        JuicoyMasterStack.axis = .vertical
        JuicoyMasterStack.spacing = 30
        JuicoyMasterStack.translatesAutoresizingMaskIntoConstraints = false
        JuicoyContainer.addSubview(JuicoyMasterStack)
        
        // Adding the previously implemented modules
        JuicoyMasterStack.addArrangedSubview(JuicoyBuildBiographySection())
        JuicoyMasterStack.addArrangedSubview(JuicoyBuildVitalManifest())
        JuicoyMasterStack.addArrangedSubview(JuicoyBuildCompanionScroller())
        JuicoyMasterStack.addArrangedSubview(JuicoyBuildHobbyCollection())
        
        NSLayoutConstraint.activate([
            JuicoyMasterStack.topAnchor.constraint(equalTo: JuicoyAvatarOrbit.bottomAnchor, constant: 40),
            JuicoyMasterStack.leadingAnchor.constraint(equalTo: JuicoyContainer.leadingAnchor, constant: 20),
            JuicoyMasterStack.trailingAnchor.constraint(equalTo: JuicoyContainer.trailingAnchor, constant: -20),
            JuicoyMasterStack.bottomAnchor.constraint(equalTo: JuicoyContainer.bottomAnchor, constant: -120) // Space for bottom dock
        ])
    }
}


