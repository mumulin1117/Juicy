//
//  JuicoyAlertReportController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/29.
//

import UIKit
import PhotosUI

class JuicoyAlertReportController: JuicoySeconedYEUIController {

    private let JuicoyReportReasons = [
        "Inappropriate content", "Hate speech",
        "Impersonation", "Spam or scam",
        "Nudity", "Illegal activity",
        "Harassment", "Violence", "Abusive"
    ]
    
    
    private let JuicoyModuleSubject: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.numberOfLines = 0
        JuicoyLab.font = .systemFont(ofSize: 13, weight: .semibold)
        JuicoyLab.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        JuicoyLab.text = "Please select the reason for reporting this user"
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    lazy var repotclolor: UIImageView = {
      let sinseion =  UIImageView.init(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "repotclolor"))
        sinseion.translatesAutoresizingMaskIntoConstraints = false
       
        return sinseion
    }()
    
    private let JuicoyOnrereasonSubject: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.numberOfLines = 0
        JuicoyLab.font = .systemFont(ofSize: 14, weight: .semibold)
        JuicoyLab.textColor = UIColor.black
        JuicoyLab.text = "Other reasons"
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    
    private var JuicoySelectedSignal: String?
    private var JuicoyEvidenceAsset: UIImage?

    private let JuicoyScrollWrapper: UIScrollView = {
        let JuicoyScroll = UIScrollView()
        JuicoyScroll.backgroundColor = .clear
        JuicoyScroll.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyScroll
    }()

    private let JuicoyTagCanvas: UICollectionView = {
        let JuicoyFlow = UICollectionViewFlowLayout()
        JuicoyFlow.minimumInteritemSpacing = 10
        JuicoyFlow.minimumLineSpacing = 12
        JuicoyFlow.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let JuicoyColl = UICollectionView(frame: .zero, collectionViewLayout: JuicoyFlow)
        JuicoyColl.backgroundColor = .clear
        JuicoyColl.isScrollEnabled = false
        JuicoyColl.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyColl
    }()

    private let JuicoyInputVault: UITextView = {
        let JuicoyTv = UITextView()
        JuicoyTv.text = "This user used abusive language toward me"
        JuicoyTv.font = .systemFont(ofSize: 15)
        JuicoyTv.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        JuicoyTv.layer.cornerRadius = 12
        JuicoyTv.textContainerInset = UIEdgeInsets(top: 15, left: 12, bottom: 15, right: 12)
        JuicoyTv.translatesAutoresizingMaskIntoConstraints = false
        JuicoyTv.contentInset = UIEdgeInsets.init(top: 45, left: 20, bottom: 8, right: 20)
        return JuicoyTv
    }()

    private let JuicoyMediaTrigger: UIButton = {
        let JuicoyBtn = UIButton()
        JuicoyBtn.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        JuicoyBtn.layer.cornerRadius = 15
        JuicoyBtn.setImage(UIImage(systemName: "photo.on.rectangle.angled"), for: .normal)
        JuicoyBtn.tintColor = .lightGray
        JuicoyBtn.imageView?.contentMode = .scaleAspectFill
        JuicoyBtn.clipsToBounds = true
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyBtn
    }()

    private let JuicoyFinalizeAction: UIButton = {
        let JuicoyBtn = UIButton(type: .system)
        JuicoyBtn.setTitle("Confirm", for: .normal)
        JuicoyBtn.setTitleColor(.white, for: .normal)
        JuicoyBtn.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        JuicoyBtn.backgroundColor = .black
        JuicoyBtn.layer.cornerRadius = 25
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        JuicoyConstructHierarchy()
    }

    private func JuicoyConstructHierarchy() {
        view.backgroundColor = .white
        title = "Report"
        
        view.addSubview(JuicoyScrollWrapper)
        let JuicoyContent = UIView()
        JuicoyContent.translatesAutoresizingMaskIntoConstraints = false
        JuicoyScrollWrapper.addSubview(JuicoyContent)
        JuicoyContent.addSubview(JuicoyModuleSubject)
        JuicoyContent.addSubview(repotclolor)
        
        JuicoyContent.addSubview(JuicoyTagCanvas)
        JuicoyContent.addSubview(JuicoyMediaTrigger)
        
        
        JuicoyContent.addSubview(JuicoyInputVault)
        JuicoyInputVault.addSubview(JuicoyOnrereasonSubject)
        
        view.addSubview(JuicoyFinalizeAction)
        
        JuicoyTagCanvas.delegate = self
        JuicoyTagCanvas.dataSource = self
        JuicoyTagCanvas.register(JuicoyReportReasonCell.self, forCellWithReuseIdentifier: "JuicoyReason")
        
        JuicoyMediaTrigger.addTarget(self, action: #selector(JuicoyInvokeGallery), for: .touchUpInside)
        JuicoyFinalizeAction.addTarget(self, action: #selector(JuicoyExecuteSubmission), for: .touchUpInside)

        NSLayoutConstraint.activate([
            
           
            
            
            JuicoyScrollWrapper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            JuicoyScrollWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyScrollWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyScrollWrapper.bottomAnchor.constraint(equalTo: JuicoyFinalizeAction.topAnchor, constant: -20),
            
            JuicoyContent.topAnchor.constraint(equalTo: JuicoyScrollWrapper.topAnchor),
            JuicoyContent.leadingAnchor.constraint(equalTo: JuicoyScrollWrapper.leadingAnchor),
            JuicoyContent.trailingAnchor.constraint(equalTo: JuicoyScrollWrapper.trailingAnchor),
            JuicoyContent.bottomAnchor.constraint(equalTo: JuicoyScrollWrapper.bottomAnchor),
            JuicoyContent.widthAnchor.constraint(equalTo: JuicoyScrollWrapper.widthAnchor),
            
            
            JuicoyModuleSubject.topAnchor.constraint(equalTo: JuicoyContent.topAnchor,constant: 20),
            JuicoyModuleSubject.leadingAnchor.constraint(equalTo: JuicoyContent.leadingAnchor,constant: 20),
            repotclolor.leadingAnchor.constraint(equalTo: JuicoyContent.leadingAnchor,constant: 20),
            repotclolor.widthAnchor.constraint(equalToConstant: 191),
            repotclolor.heightAnchor.constraint(equalToConstant: 39),
            repotclolor.topAnchor.constraint(equalTo: JuicoyModuleSubject.bottomAnchor,constant: 20),
            
            JuicoyTagCanvas.topAnchor.constraint(equalTo: repotclolor.bottomAnchor, constant: 40),
            JuicoyTagCanvas.leadingAnchor.constraint(equalTo: JuicoyContent.leadingAnchor, constant: 20),
            JuicoyTagCanvas.trailingAnchor.constraint(equalTo: JuicoyContent.trailingAnchor, constant: -20),
            JuicoyTagCanvas.heightAnchor.constraint(equalToConstant: 220),
            
            JuicoyMediaTrigger.topAnchor.constraint(equalTo: JuicoyTagCanvas.bottomAnchor, constant: 20),
            JuicoyMediaTrigger.leadingAnchor.constraint(equalTo: JuicoyContent.leadingAnchor, constant: 20),
            JuicoyMediaTrigger.widthAnchor.constraint(equalToConstant: 100),
            JuicoyMediaTrigger.heightAnchor.constraint(equalToConstant: 100),
            
             
            JuicoyInputVault.topAnchor.constraint(equalTo: JuicoyMediaTrigger.bottomAnchor, constant: 30),
            JuicoyInputVault.leadingAnchor.constraint(equalTo: JuicoyContent.leadingAnchor, constant: 20),
            JuicoyInputVault.trailingAnchor.constraint(equalTo: JuicoyContent.trailingAnchor, constant: -20),
            JuicoyInputVault.heightAnchor.constraint(equalToConstant: 120),
            JuicoyInputVault.bottomAnchor.constraint(equalTo: JuicoyContent.bottomAnchor, constant: -20),
            
            JuicoyOnrereasonSubject.topAnchor.constraint(equalTo: JuicoyInputVault.topAnchor, constant:-20),
            JuicoyOnrereasonSubject.leadingAnchor.constraint(equalTo: JuicoyInputVault.leadingAnchor, constant: 15),
          
            
            JuicoyFinalizeAction.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            JuicoyFinalizeAction.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            JuicoyFinalizeAction.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            JuicoyFinalizeAction.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func JuicoyInvokeGallery() {
        var JuicoyConfig = PHPickerConfiguration()
        JuicoyConfig.filter = .images
        let JuicoyPicker = PHPickerViewController(configuration: JuicoyConfig)
        JuicoyPicker.delegate = self
        present(JuicoyPicker, animated: true)
    }

    @objc private func JuicoyExecuteSubmission() {
        guard JuicoySelectedSignal != nil else { return }
        
        let JuicoyIndicator = UIActivityIndicatorView(style: .medium)
        JuicoyFinalizeAction.addSubview(JuicoyIndicator)
        JuicoyIndicator.center = CGPoint(x: 30, y: 25)
        JuicoyIndicator.startAnimating()
        JuicoyFinalizeAction.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            JuicoyIndicator.stopAnimating()
            let JuicoyToast = UIAlertController(title: "Submission Successful", message: "We will review your report within 24 hours.", preferredStyle: .alert)
            JuicoyToast.addAction(UIAlertAction(title: "OK", style: .default) { _ in
                self.navigationController?.popViewController(animated: true)
            })
            self.present(JuicoyToast, animated: true)
        }
    }
}

extension JuicoyAlertReportController: UICollectionViewDelegate, UICollectionViewDataSource, PHPickerViewControllerDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return JuicoyReportReasons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let JuicoyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JuicoyReason", for: indexPath) as! JuicoyReportReasonCell
        let JuicoyText = JuicoyReportReasons[indexPath.item]
        JuicoyCell.JuicoyConfigure(JuicoyTitle: JuicoyText, JuicoyIsActive: JuicoySelectedSignal == JuicoyText)
        return JuicoyCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        JuicoySelectedSignal = JuicoyReportReasons[indexPath.item]
        collectionView.reloadData()
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        results.first?.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] JuicoyObj, _ in
            if let JuicoyImg = JuicoyObj as? UIImage {
                DispatchQueue.main.async {
                    self?.JuicoyEvidenceAsset = JuicoyImg
                    self?.JuicoyMediaTrigger.setImage(JuicoyImg, for: .normal)
                }
            }
        }
    }
}

class JuicoyReportReasonCell: UICollectionViewCell {
    private let JuicoyCoreLabel: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.font = .systemFont(ofSize: 14)
        JuicoyLab.textAlignment = .center
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(JuicoyCoreLabel)
        contentView.layer.cornerRadius = 8
        NSLayoutConstraint.activate([
            JuicoyCoreLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            JuicoyCoreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            JuicoyCoreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            JuicoyCoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func JuicoyConfigure(JuicoyTitle: String, JuicoyIsActive: Bool) {
        JuicoyCoreLabel.text = JuicoyTitle
        contentView.backgroundColor = JuicoyIsActive ? .black : UIColor(white: 0.96, alpha: 1.0)
        JuicoyCoreLabel.textColor = JuicoyIsActive ? .white : .black
    }
}
