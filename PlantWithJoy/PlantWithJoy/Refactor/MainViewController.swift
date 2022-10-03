//
//  MainViewController.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/01.
//
import UIKit
import SnapKit
import Foundation

class MainViewController: UIViewController {

    private let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didPressAddButton(_:)))

    private let collectionViewTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "The Growing Plants"
        label.font.withSize(20)
        return label
    }()

    private let collectionViewSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Manage your garden"
        label.textColor = .systemGray3
        label.font.withSize(14)
        return label
    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    private let scrollViewContentView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        return view
    }()

    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(TestingCell.self, forCellWithReuseIdentifier: TestingCell.identifier)

        addsubView()
        configureUI()

        scrollView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationItem.titleView = gardenTitleLabel
    }

    private func addsubView() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContentView)
        scrollViewContentView.addSubview(collectionView)

        scrollView.addSubview(collectionViewTitleLabel)
        scrollView.addSubview(collectionViewSubTitleLabel)
    }

    private func configureUI() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        scrollViewContentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.safeAreaLayoutGuide)
        }
        collectionViewTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.top.equalToSuperview().inset(20)
        }
        collectionViewSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(collectionViewTitleLabel.snp.bottom).inset(-5)
            $0.leading.equalToSuperview().inset(10)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.snp.makeConstraints { make in
            make.leading.equalTo(scrollViewContentView.snp.leading)
            make.trailing.equalTo(scrollViewContentView.snp.trailing)
            make.top.equalTo(collectionViewTitleLabel).inset(50)
            make.height.equalTo(200)
        }
    }

    @objc func didPressAddButton(_ sender: UIButton) {
        
    }
}
