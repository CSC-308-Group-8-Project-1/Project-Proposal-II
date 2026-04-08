//
//  GameViewController.swift
//  Project-Proposal-II
//
//  Created by Krouse, William E. on 4/7/26.
//

import UIKit

class GameViewController: ViewController
{

}

class GradientView: UIView
{
    private let gradientLayer = CAGradientLayer()

    override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    }

    required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
    }

    private func setup() {
    gradientLayer.colors = [
    UIColor.systemPink.cgColor,
    UIColor.systemGreen.cgColor
    ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)

    layer.insertSublayer(gradientLayer, at: 0)
    }

    override func layoutSubviews() {
    super.layoutSubviews()
    gradientLayer.frame = bounds
    }

}

class FlippedLabel: UILabel
{
    @IBInspectable var rotationAngle: CGFloat = 0 {
        didSet {
            transform = CGAffineTransform(rotationAngle: rotationAngle)
        }
        
    }
}
