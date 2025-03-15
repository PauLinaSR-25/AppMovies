//
//  BannerAlertView.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//

import UIKit

enum BannerAlertLength: TimeInterval {
    case short = 1.0
    case long = 5.0
}

final class BannerAlert: UIView {
    
    var length: BannerAlertLength = .short
    
    init(frame: CGRect, length: BannerAlertLength = .short) {
        super.init(frame: frame)
        self.length = length
        self.alpha = 0.0
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func show() {
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 1.0
        }) { finished in
            self.perform(#selector(self.hide), with: nil, afterDelay: self.length.rawValue)
        }
    }
    
    @objc func hide() {
        UIView.animate(withDuration: 0.8, animations: {
            self.alpha = 0.0
        }) { finished in
            self.removeFromSuperview()
        }
    }
    
    static func create(_ showSavedSuccessfully: Bool, _ keyWindow: UIWindow,_ message: String) -> BannerAlert {
        let screenSize = UIScreen.main.bounds.size
        
        let backgroundColor = showSavedSuccessfully ? UIColor.appAlertSuccessBackground : UIColor.appAlertErrorBackground
        let textColor = UIColor.darkGray
        
        let BannerAlert = BannerAlert(frame: .zero)
        BannerAlert.backgroundColor = backgroundColor
        BannerAlert.translatesAutoresizingMaskIntoConstraints = false
        
        BannerAlert.heightAnchor.constraint(equalToConstant: screenSize.height * 0.06).isActive = true
        
        let textLabel = UILabel()
        textLabel.backgroundColor = .clear
        textLabel.textAlignment = .center
        textLabel.font = UIFont(name: "Avenir-Black", size: 16) ??  UIFont.systemFont(ofSize: 16, weight: .black)
        textLabel.textColor = textColor
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //FIXME: message custom
        textLabel.text = message
        
        BannerAlert.addSubview(textLabel)
        
        textLabel.centerXAnchor.constraint(equalTo: BannerAlert.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: BannerAlert.centerYAnchor).isActive = true
        textLabel.widthAnchor.constraint(equalTo: BannerAlert.widthAnchor, multiplier: 0.80).isActive = true
        
        return BannerAlert
    }
    
    static func show(showSavedSuccessfully success: Bool, length: BannerAlertLength = .short, message: String) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return
        }
        
        let BannerAlert = BannerAlert.create(success, keyWindow, message)
        BannerAlert.length = length
        
        keyWindow.addSubview(BannerAlert)
        BannerAlert.leadingAnchor.constraint(equalTo: keyWindow.leadingAnchor).isActive = true
        BannerAlert.trailingAnchor.constraint(equalTo: keyWindow.trailingAnchor).isActive = true
        BannerAlert.topAnchor.constraint(equalTo: keyWindow.safeAreaLayoutGuide.topAnchor, constant: keyWindow.frame.size.height/16).isActive = true
        
        BannerAlert.show()
    }
}
