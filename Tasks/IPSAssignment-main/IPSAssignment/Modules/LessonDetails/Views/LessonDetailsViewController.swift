//
//  LessonDetailsViewController.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 22/03/2023.
//

import UIKit
import Kingfisher
import AVFoundation
import AVKit
import Combine

class LessonDetailsViewController: UIViewController {
    
    // MARK: UI Elements
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var videoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.kf.setImage(with: URL(string: "https://ipsmedia.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fb9fd02c6-f567-4e17-8bb0-27e1b07f33a6%2FiOS-design.png?id=5743fac0-7002-409a-8364-eede144c4a9a&table=block&spaceId=18c2b86f-5f00-4ff1-baf7-6be563e77c7d&width=2000&userId=&cache=v2")!)
        return imageView
    }()
    
    private lazy var videoPlayButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .white.withAlphaComponent(0.8)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 48), forImageIn: .normal)
        button.addTarget(self, action: #selector(openVideoPlayerView), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next lesson", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Next lesson"
        configuration.image = UIImage(systemName: "chevron.right")
        configuration.imagePadding = 4
        configuration.imagePlacement = .trailing
        button.configuration = configuration
        button.addTarget(self, action: #selector(nextLessonButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var downloadVideoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.tintColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        var configuration = UIButton.Configuration.plain()
        configuration.imagePadding = 6
        button.configuration = configuration
        button.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text =  ""
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var nextButtonContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = .vertical
        stackView.distribution  = .fill
        stackView.alignment = .fill
        stackView.spacing   = 16.0
        return stackView
    }()
    
    // MARK: Properties
    
    private let viewModel: LessonDetailsViewModelType
    private var subscriptions = Set<AnyCancellable>()
    private var currentVideoURL: URL?
    private var progressSubject = PassthroughSubject<Float, Never>()
    // MARK: Init
    
    init(viewModel: LessonDetailsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: .main)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsConstraints()
        setupViewModelInputs()
        setupViewModelOutputs()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        downloadVideoButton.removeFromSuperview()
    }
    
    deinit {
        debugPrint("Deinit: LessonDetailsViewController")
    }
}

// MARK: - Actions

private extension LessonDetailsViewController {
    
    @objc private func openVideoPlayerView() {
        viewModel.openVideoPlayer()
    }
    
    @objc private func nextLessonButtonTapped() {
        viewModel.nextButtonDidTapped()
    }
    
    @objc private func downloadButtonTapped() {
        viewModel.downloadButtonDidTapped()
    }
}


// MARK: - Configurations

private extension LessonDetailsViewController {
    
    private func setupViewsConstraints() {
        addSubviews()
        setupScrollViewConstraint()
        setupContainerViewConstraint()
        setupMainStackViewConstraint()
        setupMainVideoImageViewConstraint()
        setupNextButtonConstraint()
        setupPlayVideoButtonConstraint()
        setupDownloadVideoButtonConstraint()
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubviews(videoImageView, videoPlayButton, stackView)
        nextButtonContainerView.addSubview(nextButton)
    }
    
    private func setupScrollViewConstraint() {
        scrollView.pinToTheEdges(of: view)
    }
    
    private func setupContainerViewConstraint() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.pinToTheEdges(of: scrollView)
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    private func setupMainStackViewConstraint() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(nextButtonContainerView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: videoImageView.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
        ])
    }
    
    private func setupMainVideoImageViewConstraint() {
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            videoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            videoImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            videoImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            videoImageView.heightAnchor.constraint(equalToConstant: 230.0)
        ])
    }
    
    private func setupNextButtonConstraint() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButtonContainerView.translatesAutoresizingMaskIntoConstraints = false
        nextButtonContainerView.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: nextButtonContainerView.trailingAnchor, constant: 0).isActive = true
    }
    
    private func setupPlayVideoButtonConstraint() {
        videoPlayButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            videoPlayButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            videoPlayButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            videoPlayButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            videoPlayButton.heightAnchor.constraint(equalToConstant: 230.0)
        ])
    }
    
    private func setupDownloadVideoButtonConstraint() {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        guard let rootView = windowScene?.windows.first?.rootViewController?.view else { return }
        
        downloadVideoButton.translatesAutoresizingMaskIntoConstraints = false
        rootView.addSubview(downloadVideoButton)
        NSLayoutConstraint.activate([
            downloadVideoButton.topAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.topAnchor, constant: 0),
            downloadVideoButton.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: 16),
            downloadVideoButton.heightAnchor.constraint(equalToConstant: 40),
            downloadVideoButton.widthAnchor.constraint(equalToConstant: 160)
        ])
    }
}

// MARK: - Private Handlers

private extension LessonDetailsViewController {
    
    func setupViewModelInputs() {
        viewModel.viewDidLoad()
    }
    
    func setupViewModelOutputs() {
        viewModel
            .currentLessonPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: configureUI)
            .store(in: &subscriptions)
        
        viewModel
            .nextButtonIsHiddenPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] isHidden in self?.nextButton.isHidden = isHidden } )
            .store(in: &subscriptions)
        
        viewModel
            .progressPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self]  in self?.progressSubject.send($0) })
            .store(in: &subscriptions)
        
        viewModel
            .showDownloadingAlertPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: showDownloadingProgressAlert)
            .store(in: &subscriptions)
        
        viewModel
            .downloadButtonStylePublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: stylingDownloadButton)
            .store(in: &subscriptions)
        
        viewModel
            .videoURLPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: playVideo)
            .store(in: &subscriptions)
        
        viewModel
            .showErrorPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: showAlert)
            .store(in: &subscriptions)
    }
    
    func playVideo(_ url: URL?) {
        guard let url else {
            showAlert(with: "No video found please connect to the internet")
            return
        }
        presentVideoPlayer(with: url)
    }
    
    func stylingDownloadButton(with style: DownloadButtonStyle) {
        downloadVideoButton.tintColor = style.tintColor
        downloadVideoButton.setTitle(style.title, for: .normal)
        downloadVideoButton.setImage(style.image, for: .normal)
        downloadVideoButton.isUserInteractionEnabled =  style == .offline ? false : true
    }
    
    func configureUI(with lesson: Lesson?) {
        guard let lesson else { return }
        videoImageView
            .kf.setImage(with: lesson.thumbnailURL)
        titleLabel.text = lesson.title
        descriptionLabel.text = lesson.description
        currentVideoURL = lesson.videoURL
    }
    
    func showDownloadingProgressAlert() {
        let alertController = UIAlertController(title: "Downloading...🚀", message: nil, preferredStyle: .alert)
        let progressBar : UIProgressView = UIProgressView(progressViewStyle: .default)
        progressBar.setProgress(0, animated: true)
        progressBar.frame = CGRect(x: 0, y: 58, width: 270, height: 0)
        alertController.view.addSubview(progressBar)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {[weak self] _ in
            guard let self else { return }
            self.viewModel.cancelDownloadingVideo()
        }
        alertController.addAction(cancelAction)
        present(alertController, animated: true) { [weak self] in
            guard let self else { return }
            self.progressSubject
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: {
                    progressBar.setProgress($0, animated: true)
                    if $0 == 1 {
                        alertController.dismiss(animated: true, completion: nil)
                        
                    }
                })
                .store(in: &self.subscriptions)
        }
    }
    
    func presentVideoPlayer(with url: URL) {
        let player = AVPlayer(url: url)
        let avPlayerViewController = AVPlayerViewController()
        avPlayerViewController.player = player
        avPlayerViewController.player?.play()
        self.present(avPlayerViewController, animated: true) { [weak self] in
            self?.setupDownloadVideoButtonConstraint()
        }
    }
    
    func showAlert(with message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
