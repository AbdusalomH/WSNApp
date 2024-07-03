//
//  WSNLabel.swift
//  Sport News
//
//  Created by Abdusalom on 03/07/2024.
//

import UIKit

class WSNLabel: UILabel {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(titleText: String, labelTextColor: UIColor, fontSize: CGFloat,  numberOfLines: Int) {
        super.init(frame: .zero)
        configure()
        self.textColor = labelTextColor
        self.font = .systemFont(ofSize: fontSize, weight: .bold)
        self.text = titleText
        self.textAlignment = .center
        self.numberOfLines = numberOfLines
    }
    
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        minimumScaleFactor = 0.5
    }
}
