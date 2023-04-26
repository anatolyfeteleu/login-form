//
//  TestView.swift
//  FormValidation
//
//  Created by Анатолий Фетелеу on 24.04.2023.
//

import UIKit

class TestView: UIView {

    let vertStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 35
        return view
    }()
    
    let loginInput = InputView(
        placeholderText: NSLocalizedString("loginInputPlaceholder", comment: "login input placeholder"),
        labelText: NSLocalizedString("loginInputLabelText", comment: "login label text"),
        hintLabelText: "",
        textFieldContextType: .username
    )
    
    let emailInput = InputView(
        placeholderText: NSLocalizedString("emailInputPlaceholder", comment: "email input placeholder"),
        labelText: NSLocalizedString("emailInputLabelText", comment: "email label text"),
        hintLabelText: "",
        textFieldContextType: .emailAddress
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setupViews()
        setViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .white
    }
    
    private func setupViews() {
        addSubview(vertStackView)
        vertStackView.addArrangedSubview(loginInput)
        vertStackView.addArrangedSubview(emailInput)
    }
    
    private func setViewConstraints() {
        setLoginConstraints()
        setEmailConstraints()
        setVstackConstraints()
    }
    
    private func setLoginConstraints() {
        
    }

    private func setEmailConstraints() {
        
    }

    private func setVstackConstraints() {
        vertStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
    }

}
