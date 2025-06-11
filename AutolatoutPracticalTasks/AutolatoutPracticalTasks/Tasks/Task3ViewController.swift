//
//  Task3ViewController.swift
//  AutolatoutPracticalTasks
//
//  Created by Kakhaberi Kiknadze on 20.03.25.
//

import UIKit
import Combine

// Lay out login screen as in the attached screen recording.
// 1. Content should respect safe area guides
// 2. Content should be visible on all screen sizes
// 3. Content should be spaced on bottom as in the recording
// 4. When keyboard appears, content should move up
// 5. When you tap the screen and keyboard gets dismissed, content should move down
// 6. You can use container views/layout guides or any option you find useful
// 7. Content should have horizontal spacing of 16
// 8. Title and description labels should have a vertical spacing of 12 from each other
// 9. Textfields should have a spacing of 40 from top labels
// 10. Login button should have 16 spacing from textfields

final class Task3ViewController: UIViewController {
    private let titleLabel = UILabel()
    private let bodyLabel = UILabel()
    private let usernameField = UITextField()
    private let passwordField = UITextField()
    private let logInButton = UIButton()

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let stackView = UIStackView()
    private var contentHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupKeyboardObservers()
        setupGestures()
    }

    private func setupView() {
        view.backgroundColor = .systemBackground

        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.keyboardDismissMode = .interactive
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false

        // ScrollView layout
        contentHeightConstraint = contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.frameLayoutGuide.heightAnchor)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentHeightConstraint
        ])

        // Stack View
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])

        // Spacer to push content to bottom
        let topSpacer = UIView()
        topSpacer.setContentHuggingPriority(.init(1), for: .vertical)
        topSpacer.setContentCompressionResistancePriority(.init(1), for: .vertical)
        stackView.addArrangedSubview(topSpacer)

        // Labels, fields, and button
        setupLabels()
        setupTextFields()
        setupButton()

        let formStack = UIStackView(arrangedSubviews: [titleLabel, bodyLabel, usernameField, passwordField, logInButton])
        formStack.axis = .vertical
        formStack.spacing = 16
        formStack.translatesAutoresizingMaskIntoConstraints = false

        formStack.setCustomSpacing(12, after: titleLabel)
        formStack.setCustomSpacing(40, after: bodyLabel)
        formStack.setCustomSpacing(16, after: passwordField)

        // Set higher priority for form content
        formStack.setContentHuggingPriority(.init(999), for: .vertical)
        formStack.setContentCompressionResistancePriority(.init(999), for: .vertical)

        stackView.addArrangedSubview(formStack)
    }

    private func setupLabels() {
        titleLabel.text = "Sign In"
        titleLabel.font = .boldSystemFont(ofSize: 32)
        
        bodyLabel.text = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit,
        sed do eiusmod tempor incididunt ut labore
        """
        bodyLabel.numberOfLines = 3
    }

    private func setupTextFields() {
        usernameField.placeholder = "Enter username"
        passwordField.placeholder = "Enter password"
        usernameField.borderStyle = .roundedRect
        passwordField.borderStyle = .roundedRect
    }

    private func setupButton() {
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.tintColor, for: .normal)
        logInButton.contentHorizontalAlignment = .center
    }

    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil,
                                               queue: .main) { [weak self] notification in
            guard let self = self,
                  let userInfo = notification.userInfo,
                  let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
                  let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
                  let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return }

            let bottomInset = keyboardFrame.height
            
            UIView.animate(withDuration: duration,
                          delay: 0,
                          options: UIView.AnimationOptions(rawValue: curve << 16),
                          animations: {
                // Temporarily deactivate the height constraint to allow content to adjust
                self.contentHeightConstraint.isActive = false
                self.view.layoutIfNeeded()
                
                self.scrollView.contentInset.bottom = bottomInset
                self.scrollView.verticalScrollIndicatorInsets.bottom = bottomInset
            }, completion: { _ in
                if let activeField = self.view.firstResponder as? UIView {
                    let convertedFrame = activeField.convert(activeField.bounds, to: self.scrollView)
                    self.scrollView.scrollRectToVisible(convertedFrame, animated: true)
                }
            })
        }

        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil,
                                               queue: .main) { [weak self] notification in
            guard let self = self,
                  let userInfo = notification.userInfo,
                  let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
                  let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return }
            
            UIView.animate(withDuration: duration,
                          delay: 0,
                          options: UIView.AnimationOptions(rawValue: curve << 16),
                          animations: {
                // Reactivate the height constraint to push content to bottom
                self.contentHeightConstraint.isActive = true
                self.view.layoutIfNeeded()
                
                self.scrollView.contentInset.bottom = 0
                self.scrollView.verticalScrollIndicatorInsets.bottom = 0
            })
        }
    }

    private func setupGestures() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

// Helper to find current first responder
private extension UIView {
    var firstResponder: UIResponder? {
        if isFirstResponder { return self }
        for subview in subviews {
            if let responder = subview.firstResponder {
                return responder
            }
        }
        return nil
    }
}

#Preview {
    Task3ViewController()
}
