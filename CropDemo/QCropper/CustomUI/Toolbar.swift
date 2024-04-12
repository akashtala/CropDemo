//
//  Toolbar.swift
//
//  Created by Chen Qizhi on 2019/10/15.
//

import UIKit

class Toolbar: UIView {
    lazy var cancelButton: UIButton = {
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .regular)
        let button = self.titleButton("Cancel", image: UIImage(systemName: "xmark.circle", withConfiguration: config))
        button.left = 0
        button.autoresizingMask = [.flexibleBottomMargin, .flexibleRightMargin]
        return button
    }()

    lazy var resetButton: UIButton = {
        let button = self.titleButton("RESET", highlight: true)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.isHidden = true
        button.centerX = self.width / 2
        button.autoresizingMask = [.flexibleBottomMargin, .flexibleRightMargin]
        return button
    }()

    lazy var doneButton: UIButton = {
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .regular)
        let button = self.titleButton("Done", image: UIImage(systemName: "checkmark.circle", withConfiguration: config), highlight: true)
        button.right = self.width
        button.setTitleColor(UIColor(white: 0.4, alpha: 1), for: .disabled)
        button.autoresizingMask = [.flexibleBottomMargin, .flexibleLeftMargin]
        return button
    }()

    lazy var blurBackgroundView: UIVisualEffectView = {
        let vev = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        vev.alpha = 0.3
        vev.backgroundColor = .clear
        vev.frame = self.bounds
        vev.isUserInteractionEnabled = false
        vev.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin, .flexibleHeight, .flexibleWidth]
        return vev
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(blurBackgroundView)
        addSubview(cancelButton)
        addSubview(resetButton)
        addSubview(doneButton)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func titleButton(_ title: String, image: UIImage? = nil, highlight: Bool = false) -> UIButton {
        let font = UIFont.systemFont(ofSize: 17)
        let button = UIButton(
            frame: CGRect(
                center: .zero,
                size: CGSize(
                    width: title.width(withFont: font) + 20,
                    height: 44)))
        if highlight {
            button.setTitleColor(QCropper.Config.highlightColor, for: .normal)
            button.setTitleColor(QCropper.Config.highlightColor.withAlphaComponent(0.7), for: .highlighted)
        } else {
            button.setTitleColor(UIColor(white: 1, alpha: 1.0), for: .normal)
            button.setTitleColor(UIColor(white: 1, alpha: 0.7), for: .highlighted)
        }
        button.titleLabel?.font = font
        if let image {
            let normalImage = image.withTintColor(UIColor(white: 1, alpha: 1.0), renderingMode: .alwaysTemplate)
            button.setImage(normalImage, for: .normal)
        } else {
            button.setTitle(title, for: .normal)
        }
        button.top = 0

        button.autoresizingMask = [.flexibleRightMargin, .flexibleWidth]
        button.tintColor = QCropper.Config.tintColor
        return button
    }
}
