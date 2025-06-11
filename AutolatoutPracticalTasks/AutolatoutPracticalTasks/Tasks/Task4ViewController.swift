//
//  Task4ViewController.swift
//  AutolatoutPracticalTasks
//
//  Created by Kakhaberi Kiknadze on 20.03.25.
//

import UIKit

// Create a view with two subviews aligned vertically when in Compact width, Regular height mode.
// If the orientation changes to Compact-Compact, same 2 subviews should be aligned horizontally.
// Hou can use iPhone 16 simulator for testing.
final class Task4ViewController: UIViewController {
    
    private let containerStackView = UIStackView()
    private let firstSubview = UIView()
    private let secondSubview = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerForTraitChanges()
        updateLayoutForCurrentTraits()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        firstSubview.backgroundColor = .systemBlue
        firstSubview.layer.cornerRadius = 12
        
        secondSubview.backgroundColor = .systemGreen
        secondSubview.layer.cornerRadius = 12
        
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.distribution = .fillEqually
        containerStackView.spacing = 16
        
        containerStackView.addArrangedSubview(firstSubview)
        containerStackView.addArrangedSubview(secondSubview)
        
        view.addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            containerStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            containerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            containerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
    ])
        addLabelsToSubviews()
    }
    
    private func addLabelsToSubviews() {
        let firstLabel = UILabel()
                firstLabel.text = "First View"
                firstLabel.textAlignment = .center
                firstLabel.textColor = .white
                firstLabel.font = .systemFont(ofSize: 18, weight: .medium)
                firstLabel.translatesAutoresizingMaskIntoConstraints = false
                firstSubview.addSubview(firstLabel)
                
                let secondLabel = UILabel()
                secondLabel.text = "Second View"
                secondLabel.textAlignment = .center
                secondLabel.textColor = .white
                secondLabel.font = .systemFont(ofSize: 18, weight: .medium)
                secondLabel.translatesAutoresizingMaskIntoConstraints = false
                secondSubview.addSubview(secondLabel)
                
                NSLayoutConstraint.activate([
                    firstLabel.centerXAnchor.constraint(equalTo: firstSubview.centerXAnchor),
                    firstLabel.centerYAnchor.constraint(equalTo: firstSubview.centerYAnchor),
                    
                    secondLabel.centerXAnchor.constraint(equalTo: secondSubview.centerXAnchor),
                    secondLabel.centerYAnchor.constraint(equalTo: secondSubview.centerYAnchor)
                ])
    }
    
    private func registerForTraitChanges() {
        let sizeTraits: [UITrait] = [UITraitVerticalSizeClass.self, UITraitHorizontalSizeClass.self]
        registerForTraitChanges(sizeTraits) { (self: Self, previousTraitCollection: UITraitCollection) in
            // TODO: -  Handle the trait change.
            print("Trait colaludlection changed:", self.traitCollection)
            print(" Horizontal: \(self.traitCollection.horizontalSizeClass.rawValue)")
            print(" Vertical: \(self.traitCollection.verticalSizeClass.rawValue)")
        }
    }
    
    private func updateLayoutForCurrentTraits() {
            let horizontal = traitCollection.horizontalSizeClass
            let vertical = traitCollection.verticalSizeClass
            
            if horizontal == .compact && vertical == .regular {
                containerStackView.axis = .vertical
                print("Layout: Vertical (Portrait)")
            } else if horizontal == .compact && vertical == .compact {
                containerStackView.axis = .horizontal
                print("Layout: Horizontal (Landscape)")
            } else {
                containerStackView.axis = .vertical
                print("Layout: Vertical (Default)")
            }
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }

#Preview {
    Task4ViewController()
}
