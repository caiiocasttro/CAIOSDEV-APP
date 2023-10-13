//
//  ContactsSheetViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 09.10.2023.
//

import UIKit

protocol contactSheetProtocol {
    }

class ContactsSheetViewController: UIViewController {
    
    //MARK: Objects
    @objc lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Xmark20px")?.withTintColor(UIColor(named: "BlackLabels") ?? UIColor.gray), for: .normal)
        return button
    }()
    
    var delegate: contactSheetProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "WhiteBackground")
        configureLayout()
    }
    
    
    
    //MARK: Configuring Layout
    private func configureLayout() {
        
        let width = UIScreen.main.bounds.width - 20
        let height = UIScreen.main.bounds.height - 10
        
        view.frame.size = .init(width: width, height: height)
        
        view.addSubview(dismissButton)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        
        
        ])
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        panGesture.view?.layer.cornerRadius = 15
                view.addGestureRecognizer(panGesture)
        
        dismissButton.addTarget(self, action: #selector(dismissButtonDidTapped), for: .touchUpInside)
    }
    
    //DismissButto
    @objc func dismissButtonDidTapped() {
        dismiss(animated: true)
    }
    
    @objc private func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
            let translation = recognizer.translation(in: view)

            switch recognizer.state {
            case .changed:
                if translation.y > 0 {
                    view.transform = CGAffineTransform(translationX: 0, y: translation.y)
                }
            case .ended:
                let velocity = recognizer.velocity(in: view)
                if velocity.y > 100 {
                    dismiss(animated: true, completion: nil)
                } else {
                    UIView.animate(withDuration: 0.3) {
                        self.view.transform = .identity
                    }
                }
            default:
                break
            }
        }
}
