//
//  InsideJobView.swift
//  Dework
//
//  Created by Vinicius Mangueira on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import Markdowner

class InsideJobView: UIView, ConfigurableUI {
    var customView: UIView? = nil
    
    var insideJobViewModel: InsideJobViewModel! {
        didSet {
            let markdownView = MarkdownTextView(fontSize: 16)
            markdownView.text = insideJobViewModel.mardownText
            jobTextView.attributedText = markdownView.attributedString()
        }
    }
    
    lazy var jobTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.backgroundColor = .backgroundColor
        textView.layer.cornerRadius = 16
        return textView
    }()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubview(jobTextView)
    }
    
    func setupConstraints() {
        jobTextView.cBuild { (make) in
            make.top.equal(to: topAnchor, offsetBy: 20)
            make.leading.equal(to: leadingAnchor, offsetBy: 10)
            make.trailing.equal(to: trailingAnchor, offsetBy: -10)
            make.bottom.equal(to: bottomAnchor, offsetBy: 20)
        }
    }
    
    
}

extension MarkdownTextView {
    
    convenience init(fontSize size: CGFloat = 12) {
        self.init(frame: .zero)
        // self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.translatesAutoresizingMaskIntoConstraints = false
        self.keyboardDismissMode = .none
        self.backgroundColor = .clear
        self.setStyleConfigurationWith(
            font: UIFont.systemFont(ofSize: size),
            textColor: .foregroundColor,
            symbolsColor: .lightGray)
    }
    
    func setStyleConfigurationWith(font: UIFont, textColor: UIColor, symbolsColor: UIColor) {
        self.stylesConfiguration = StylesConfiguration(
            baseFont: font,
            textColor: textColor,
            symbolsColor: symbolsColor,
            useDynamicType: true)
    }
    
}
