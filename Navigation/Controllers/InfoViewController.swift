//
//  ModalViewController.swift
//  Navigation
//
//  Created by Владимир on 06.04.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButton()
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = CustomColor().hexStringToUIColor(hex: "1A5F7A")
        button.layer.cornerRadius = 20
        button.setTitle("Ask question", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func buttonAction() {
        let alert = UIAlertController(title: "Вы точно отредактировали ТЗ к ДЗ?", message: "Это позитивно скажется на эффективности обучения!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
            print("Да, мы уже все попправили!")
        }))
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: { action in print("И так сойдет") }))
        
        self.present(alert, animated: true)
    }
    
    private func setupButton() {
        self.view.addSubview(self.button)
        self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        self.button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -14).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
