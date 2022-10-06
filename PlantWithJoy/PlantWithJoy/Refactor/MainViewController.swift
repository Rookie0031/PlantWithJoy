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

    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        return button
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
        view.backgroundColor = .white
        return view
    }()

    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = layout
        return collectionView
    }()

    lazy var numberOfItems: Int = Myplant.sampleData.count {
        willSet {
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(MyPlantCell.self, forCellWithReuseIdentifier: MyPlantCell.identifier)

        addsubView()
        configureUI()
        setDelegateAndDataSource()
        addTargetOfFunction()
        navigationItem.titleView = gardenTitleLabel

        NotificationCenter.default.addObserver(self, selector: #selector(reloadMyPlantCollectionView(_:)), name: NSNotification.Name(rawValue: "ReloadMyPlant"), object: nil)
    }

    @objc func reloadMyPlantCollectionView(_ notification: NSNotification) {
        collectionView.reloadData()
    }

    private func addsubView() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContentView)
        scrollViewContentView.addSubview(collectionView)

        scrollView.addSubview(collectionViewTitleLabel)
        scrollView.addSubview(collectionViewSubTitleLabel)

        view.addSubview(addButton)
    }

    private func setDelegateAndDataSource() {
        scrollView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
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

        addButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(15)
            $0.top.equalTo(collectionViewSubTitleLabel)
        }
    }

    private func addTargetOfFunction() {
        addButton.addTarget(self, action: #selector(didPressAddButton(_:)), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.snp.makeConstraints { make in
            make.leading.equalTo(scrollViewContentView.snp.leading)
            make.trailing.equalTo(scrollViewContentView.snp.trailing)
            make.top.equalTo(collectionViewTitleLabel).inset(50)
            make.height.equalTo(250)
        }
    }

    @objc func didPressAddButton(_ sender: UIButton) {
        present(AddPlantViewController(), animated: true)
    }

}


import SwiftUI
struct MainVCPreView:PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainViewController().toPreview()
        }
    }
}
