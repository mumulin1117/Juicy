//
//  JuicoyAcademyVaultController.swift
//  JuicoyZer
//
//  Created by mumu on 2025/12/26.
//
import UIKit

class JuicoyAcademyVaultController: JuicoySeconedViewController {

    private var JuicoyKnowledgeCursor: Int = 0
    
    private let JuicoyAtmosphericStage: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.contentMode = .scaleAspectFill
        JuicoyImg.clipsToBounds = true
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()
    

    private let JuicoyInfoAuraCard: UIView = {
        let JuicoyView = UIView()
        JuicoyView.backgroundColor = UIColor.white.withAlphaComponent(0.85)
        JuicoyView.layer.cornerRadius = 24
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()
    
    private let JuicoyModuleSubject: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.numberOfLines = 0
        JuicoyLab.font = .systemFont(ofSize: 15, weight: .semibold)
        JuicoyLab.textColor = .black
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyTrendBadge: UIImageView = {
        let JuicoyView = UIImageView.init(image: UIImage.init(named: "JuicoyTrendBadge"))
      
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()
    
  
    
    private let JuicoyNarrativeScroll: UIScrollView = {
        let JuicoyScroll = UIScrollView()
        JuicoyScroll.showsVerticalScrollIndicator = false
        JuicoyScroll.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyScroll
    }()
    
    private let JuicoyDetailedScript: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.numberOfLines = 0
        JuicoyLab.textColor = UIColor.white.withAlphaComponent(0.9)
        JuicoyLab.font = .systemFont(ofSize: 16, weight: .semibold)
        let JuicoyStyle = NSMutableParagraphStyle()
        JuicoyStyle.lineSpacing = 6
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyActionOrbit: UIStackView = {
        let JuicoyStack = UIStackView()
        JuicoyStack.axis = .horizontal
        JuicoyStack.distribution = .fillEqually
        JuicoyStack.spacing = 20
        JuicoyStack.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyStack
    }()
    
    private let JuicoyPreviousStep: UIButton = {
        let JuicoyBtn = UIButton(type: .custom)
        JuicoyBtn.setBackgroundImage(UIImage.init(named: "JuicoyPreviousStep"), for: .normal)
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyBtn
    }()
    
    private let JuicoyNextStep: UIButton = {
        let JuicoyBtn = UIButton(type: .custom)
        JuicoyBtn.setBackgroundImage(UIImage.init(named: "JuicoyNextStep"), for: .normal)
        return JuicoyBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        JuicoyConstructArchitecture()
        JuicoySynchronizeData()
    }
    
    private func JuicoyConstructArchitecture() {
        view.backgroundColor = .black
        self.title =  "Pole Dance Academy"
        view.addSubview(JuicoyAtmosphericStage)
      
        view.addSubview(JuicoyInfoAuraCard)
        JuicoyInfoAuraCard.addSubview(JuicoyModuleSubject)
        JuicoyInfoAuraCard.addSubview(JuicoyTrendBadge)
       
        view.addSubview(JuicoyNarrativeScroll)
        JuicoyNarrativeScroll.addSubview(JuicoyDetailedScript)
        
        view.addSubview(JuicoyActionOrbit)
        JuicoyActionOrbit.addArrangedSubview(JuicoyPreviousStep)
        JuicoyActionOrbit.addArrangedSubview(JuicoyNextStep)
        
        NSLayoutConstraint.activate([
            JuicoyAtmosphericStage.topAnchor.constraint(equalTo: view.topAnchor),
            JuicoyAtmosphericStage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyAtmosphericStage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyAtmosphericStage.heightAnchor.constraint(equalToConstant: 373),
        
           
            JuicoyInfoAuraCard.topAnchor.constraint(equalTo: JuicoyAtmosphericStage.bottomAnchor, constant: -57),
            JuicoyInfoAuraCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            JuicoyInfoAuraCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            JuicoyInfoAuraCard.heightAnchor.constraint(equalToConstant: 95),
            
            JuicoyModuleSubject.topAnchor.constraint(equalTo: JuicoyInfoAuraCard.topAnchor, constant: 16),
            JuicoyModuleSubject.leadingAnchor.constraint(equalTo: JuicoyInfoAuraCard.leadingAnchor, constant: 16),
            JuicoyModuleSubject.trailingAnchor.constraint(equalTo: JuicoyInfoAuraCard.trailingAnchor, constant: -16),
            
            JuicoyTrendBadge.topAnchor.constraint(equalTo: JuicoyModuleSubject.bottomAnchor, constant: 10),
            JuicoyTrendBadge.leadingAnchor.constraint(equalTo: JuicoyModuleSubject.leadingAnchor),
            JuicoyTrendBadge.widthAnchor.constraint(equalToConstant: 49),
            JuicoyTrendBadge.heightAnchor.constraint(equalToConstant: 20),
               
            JuicoyNarrativeScroll.topAnchor.constraint(equalTo: JuicoyInfoAuraCard.bottomAnchor, constant: 17),
            JuicoyNarrativeScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            JuicoyNarrativeScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            JuicoyNarrativeScroll.bottomAnchor.constraint(equalTo: JuicoyActionOrbit.topAnchor, constant: -20),
            
            JuicoyDetailedScript.topAnchor.constraint(equalTo: JuicoyNarrativeScroll.topAnchor),
            JuicoyDetailedScript.leadingAnchor.constraint(equalTo: JuicoyNarrativeScroll.leadingAnchor),
            JuicoyDetailedScript.trailingAnchor.constraint(equalTo: JuicoyNarrativeScroll.trailingAnchor),
            JuicoyDetailedScript.bottomAnchor.constraint(equalTo: JuicoyNarrativeScroll.bottomAnchor),
            JuicoyDetailedScript.widthAnchor.constraint(equalTo: JuicoyNarrativeScroll.widthAnchor),
            
            JuicoyActionOrbit.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            JuicoyActionOrbit.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            JuicoyActionOrbit.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            JuicoyActionOrbit.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        JuicoyNextStep.addTarget(self, action: #selector(JuicoyTriggerAdvancement), for: .touchUpInside)
        JuicoyPreviousStep.addTarget(self, action: #selector(JuicoyTriggerRegression), for: .touchUpInside)
       
    }
    
    private func JuicoySynchronizeData() {
        if JuicoyKnowledgeCursor == 0 {
            JuicoyAtmosphericStage.image = UIImage(named: "JuicoyAtmosphericStage1")
            JuicoyModuleSubject.text = "Pole Dance Basics — Foundation Training"
            JuicoyDetailedScript.text = "This lesson introduces the essential fundamentals of pole dancing, including basic grips, body alignment, and safe movement practices. You will learn how to correctly hold the pole, engage your core, and perform simple steps and transitions. This foundation helps you build strength and confidence before moving to more advanced techniques. Suitable for complete beginners who want to start safely and effectively."
            JuicoyPreviousStep.alpha = 0.5
            JuicoyPreviousStep.isEnabled = false
            JuicoyNextStep.alpha = 1.0
            JuicoyNextStep.isEnabled = true
        } else {
            JuicoyAtmosphericStage.image = UIImage(named: "JuicoyAtmosphericStage2")
            JuicoyModuleSubject.text = "Spin Techniques — Learn to Move with Flow"
            JuicoyDetailedScript.text = "This session focuses on essential beginner spins such as the Fireman Spin, Chair Spin, and Back Hook Spin. You will practice hand placement, momentum control, and posture to achieve smooth, graceful rotations. The course also teaches how to combine spins into simple sequences, helping you develop flow, rhythm, and body control while minimizing strain."
            JuicoyPreviousStep.alpha = 1.0
            JuicoyPreviousStep.isEnabled = true
            JuicoyNextStep.alpha = 0.5
            JuicoyNextStep.isEnabled = false
        }
    }
    
    @objc private func JuicoyTriggerAdvancement() {
        let JuicoyImpact = UIImpactFeedbackGenerator(style: .medium)
        JuicoyImpact.impactOccurred()
        JuicoyKnowledgeCursor = 1
        UIView.transition(with: view, duration: 0.4, options: .transitionCrossDissolve) {
            self.JuicoySynchronizeData()
        }
    }
    
    @objc private func JuicoyTriggerRegression() {
        let JuicoyImpact = UIImpactFeedbackGenerator(style: .light)
        JuicoyImpact.impactOccurred()
        JuicoyKnowledgeCursor = 0
        UIView.transition(with: view, duration: 0.4, options: .transitionCrossDissolve) {
            self.JuicoySynchronizeData()
        }
    }
    
    @objc private func JuicoyDismissPortal() {
        self.dismiss(animated: true)
    }
}
