//
//  JuicoyTabarcontroller.swift
//  JuicoyZer
//
//  Created by  on 2025/12/24.
//

import UIKit

class JuicoyTabarcontroller: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let Juicoyrance = UITabBarAppearance()
        Juicoyrance.configureWithOpaqueBackground()
        Juicoyrance.backgroundColor =  .black
        let JuicoyItemAppearance = UITabBarItemAppearance()

        JuicoyItemAppearance.normal.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.87, green: 0.87, blue: 0.9, alpha: 1)
        ]

        JuicoyItemAppearance.selected.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 0.33, alpha: 1)
        ]

        Juicoyrance.stackedLayoutAppearance = JuicoyItemAppearance
        Juicoyrance.inlineLayoutAppearance = JuicoyItemAppearance
        Juicoyrance.compactInlineLayoutAppearance = JuicoyItemAppearance
        self.tabBar.standardAppearance = Juicoyrance
        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = Juicoyrance
        }
        
       
        let Juicoyone =  JuicoyBaseNavigationController.init(rootViewController: JuicoyOneneController())
        Juicoyone.tabBarItem = UITabBarItem(
            title: "Home",
            image:UIImage(named: "juicoyGripTechnique1")?.withRenderingMode(.alwaysOriginal) ,
            selectedImage:UIImage(named: "juicoyGripTechnique1_")?.withRenderingMode(.alwaysOriginal)
        )
        
        let Juicoytwo = JuicoyBaseNavigationController.init(rootViewController:JuicoyExploreOneController())
        Juicoytwo.tabBarItem = UITabBarItem(
            title: "Explore",
            image:UIImage(named: "juicoyGripTechnique2")?.withRenderingMode(.alwaysOriginal) ,
            selectedImage:UIImage(named: "juicoyGripTechnique2_")?.withRenderingMode(.alwaysOriginal)
        )
        
        let Juicoythree = JuicoyBaseNavigationController.init(rootViewController: JuicoyMotionExplocontroller())
        Juicoythree.tabBarItem = UITabBarItem(
            title: "Chat",
            image:UIImage(named: "juicoyGripTechnique3")?.withRenderingMode(.alwaysOriginal) ,
            selectedImage:UIImage(named: "juicoyGripTechnique3_")?.withRenderingMode(.alwaysOriginal)
        )
       
        let Juicoyfour = JuicoyBaseNavigationController.init(rootViewController:  JuicoyMotionArenantroller())
        Juicoyfour.tabBarItem = UITabBarItem(
            title: "Plore",
            image:UIImage(named: "juicoyGripTechnique4")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "juicoyGripTechnique4_")?.withRenderingMode(.alwaysOriginal)
        )
        
        self.viewControllers = [Juicoyone, Juicoytwo, Juicoythree, Juicoyfour]
    }
    

   

}
class JuicoyBaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBarAppearance()
    }

    @objc private func JuicoyhandleBack() {
        popViewController(animated: true)
        
    }
   
    override func popViewController(animated: Bool) -> UIViewController? {
        super.popViewController(animated: animated)
       
        if children.count <= 1  {
            self.tabBarController?.tabBar.isHidden = false
        }
        return nil
    }
    protocol NavigationBackHidden {
        
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if children.count > 0  && !viewController.isMember(of:JuicoyBasicController.self) {
            self.tabBarController?.tabBar.isHidden = true
            if viewController.navigationItem.leftBarButtonItem == nil,
               !(viewController is NavigationBackHidden) {

                viewController.navigationItem.leftBarButtonItem =
                    UIBarButtonItem(
                        image: UIImage(named: "Juicoynav_back"),
                        style: .plain,
                        target: self,
                        action: #selector(JuicoyhandleBack)
                    )
            }
        }
        
        
        
        super.pushViewController(viewController, animated: false)
    }
    
    private func configureNavigationBarAppearance() {

            let Juicoyappearance = UINavigationBarAppearance()
            Juicoyappearance.configureWithOpaqueBackground()
        Juicoyappearance.backgroundColor = .clear

            // 中间标题样式
            Juicoyappearance.titleTextAttributes = [
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 16, weight: .semibold)
            ]

            // 隐藏系统返回文字
            Juicoyappearance.backButtonAppearance.normal.titleTextAttributes = [
                .foregroundColor: UIColor.clear
            ]

            navigationBar.standardAppearance = Juicoyappearance
            navigationBar.scrollEdgeAppearance = Juicoyappearance
            navigationBar.compactAppearance = Juicoyappearance

            navigationBar.tintColor = .black
        }
}

class JuicoyBasicController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let air = UIImageView(image: UIImage.init(named: "UICOYBaoc"))
        air.frame = UIScreen.main.bounds
        air.contentMode = .scaleAspectFill
        self.view.addSubview(air)
    }
   
}
class JuicoySeconedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let JuicoyLayer1 = CAGradientLayer()
        JuicoyLayer1.colors = [UIColor(red: 0.15, green: 0.04, blue: 0.21, alpha: 1).cgColor, UIColor(red: 0.13, green: 0.04, blue: 0.21, alpha: 1).cgColor]
        JuicoyLayer1.locations = [0, 1]
        JuicoyLayer1.frame = self.view.bounds
        JuicoyLayer1.startPoint = CGPoint(x: 0.5, y: 0)
        JuicoyLayer1.endPoint = CGPoint(x: 1, y: 1)
        view.layer.addSublayer(JuicoyLayer1)
        
    }

    func JuicoyaddRightBarButton(
        image: UIImage?,
        action: Selector = #selector(JuicoyonRightBarButtonTapped)
    ) {
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(
                image: image,
                style: .plain,
                target: self,
                action: action
            )
    }

    @objc func JuicoyonRightBarButtonTapped() {
        // 子类 override
    }
}
