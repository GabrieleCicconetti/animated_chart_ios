//
//  ViewController.swift
//  animated_chart
//
//  Created by Gabriele Cicconetti on 02/09/2019.
//  Copyright © 2019 Gabriele Cicconetti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Animated Chart"
        
        let backgroundView = UIView()
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        backgroundView.backgroundColor = UIColor.white
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.shadowColor = UIColor.gray.cgColor
        backgroundView.layer.shadowOffset = CGSize(width: 5, height: 5)
        backgroundView.layer.shadowRadius = 10.0
        backgroundView.layer.shadowOpacity = 1.0
        
        let mainStack = UIStackView(frame: CGRect.zero)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(mainStack)
        mainStack.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.9).isActive = true
        mainStack.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.8).isActive = true
        mainStack.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: 1).isActive = true
        mainStack.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor, constant: 1).isActive = true
        mainStack.spacing = 20
        mainStack.alignment = .fill
        mainStack.distribution = .fillEqually
        mainStack.axis = .horizontal
        mainStack.addArrangedSubview(getChartRect(color: UIColor.black, height: 200, duration: 1.0, percentage: 70))
        mainStack.addArrangedSubview(getChartRect(color: UIColor.blue, height: 100, duration: 0.5, percentage: 35))
        mainStack.addArrangedSubview(getChartRect(color: UIColor.darkGray, height: 80, duration: 2.0, percentage: 25))
        mainStack.addArrangedSubview(getChartRect(color: UIColor.red, height: 150, duration: 1.4, percentage: 50))
        mainStack.addArrangedSubview(getChartRect(color: UIColor.brown, height: 250, duration: 1.3, percentage: 95))
        mainStack.addArrangedSubview(getChartRect(color: UIColor.cyan, height: 60, duration: 0.4, percentage: 15))
        
    }

    
    func getChartRect(color: UIColor, height: CGFloat, duration: TimeInterval, percentage: Double) -> UIView {
        
        let rect = UIView()
        
        let innerView = UIView()
        rect.addSubview(innerView)
        innerView.translatesAutoresizingMaskIntoConstraints = false
        innerView.widthAnchor.constraint(equalTo: rect.widthAnchor, multiplier: 1).isActive = true
        innerView.bottomAnchor.constraint(equalTo: rect.bottomAnchor, constant: 1).isActive = true
        innerView.backgroundColor = color
        innerView.heightAnchor.constraint(equalToConstant: height).isActive = true
        

        
        UIView.animate(withDuration: duration, animations: {
            rect.layoutIfNeeded()
        })
        
        let value = UILabel()
        value.translatesAutoresizingMaskIntoConstraints = false
        innerView.addSubview(value)
        value.centerXAnchor.constraint(equalTo: innerView.centerXAnchor, constant: 1).isActive = true
        value.topAnchor.constraint(equalTo: innerView.topAnchor, constant: 10).isActive = true
        value.textColor = UIColor.white
        value.font = UIFont.boldSystemFont(ofSize: 13.0)
        value.text = "0"
        var initialValue = 0.0
        Timer.scheduledTimer(withTimeInterval: duration / percentage, repeats: true) { (t) in
            initialValue += 1
            value.text = "\(Int(initialValue))%"
            if initialValue == percentage {
                t.invalidate()
            }
        }.fire()
        
        return rect
        
    }

}

