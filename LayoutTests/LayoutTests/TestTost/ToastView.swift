//
//  ToastView.swift
//  LayoutTests
//
//  Created by Ahmed Naguib on 25/12/2023.
//

import UIKit

public final class ToastView: UIView {
    
     // MARK: - Properties
    private let iconImageView = UIImageView()
    private let messageLabel = UILabel()
    private let stackView = UIStackView()
    private let toastModel: ToastModel
    
    // MARK: - Init
   public init(toastModel: ToastModel) {
        self.toastModel = toastModel
        super.init(frame: CGRect.zero)
        configureView()
        configureIconImageView()
        configureMessageLabel()
        setupView()
       addTapGesture()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func configureView() {
        backgroundColor = toastModel.backgroundColor
        layer.cornerRadius = 10
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureIconImageView() {
        let isHidden = toastModel.imageIcon == nil
        iconImageView.isHidden = isHidden
        
        iconImageView.image = toastModel.imageIcon
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func configureMessageLabel() {
        messageLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        if let attributedString = toastModel.attributedString {
            messageLabel.attributedText = attributedString
        } else {
            messageLabel.text = toastModel.title
//            messageLabel.text = toastModel.titleStyle
        }
       
        messageLabel.textColor = toastModel.titileColor
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelAction))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func labelAction() {
    
        toastModel.viewDidTapped?()
    }

    private func setupView() {
        // Configure the stack view
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 2

        // Add arranged subviews to the stack view
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(messageLabel)

        // Add the stack view to the ToastView
        addSubview(stackView)

        // Set constraints for the stack view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}


public class ToastModel {
    
    public init() {}
    public var title: String?
    public var imageIcon: UIImage?
    public var backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.7)
    public var titileColor: UIColor = .white
    public var titleStyle: UIFont.TextStyle = .body
    public var attributedString: NSMutableAttributedString? = nil
    public var viewDidTapped: (() -> Void)? = nil
}


public protocol Toastable {
   @discardableResult func showToast(model: ToastModel, atPosition position: ToastPosition) -> ToastView
}

public extension Toastable where Self: UIViewController {
    @discardableResult
    func showToast(model: ToastModel, atPosition position: ToastPosition = .bottom) -> ToastView {
        let toastView = ToastView(toastModel: model)
        view.addSubview(toastView)

        let isTop = position == .top
        let verticalConstraint = isTop ? toastView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0)
            : toastView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20.0)
            

        NSLayoutConstraint.activate([
            toastView.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center the view horizontally
            toastView.heightAnchor.constraint(equalToConstant: 50),
            toastView.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, constant: -120), // Adjust the maximum width if needed
            verticalConstraint
        ])
        
//        let tapGesture = UITapGestureRecognizer(target: toastView, action: #selector(toastView.labelAction))
//        toastView.addGestureRecognizer(tapGesture)

//        UIView.animate(withDuration: 0.3, delay: 10.0, options: .curveEaseOut, animations: {
//            toastView.alpha = 0
//        }) { _ in
//            toastView.removeFromSuperview()
//        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            toastView.removeFromSuperview()
        }

        return toastView
    }
}


public enum ToastPosition {
    case top
    case bottom
}
