//
//  MainViewController.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/01.
//
import UIKit
import SnapKit
import Then
import Foundation

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


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

    private let tableView: UITableView = UITableView().then {
        $0.layer.cornerRadius = 10
        $0.register(ReminderCell.self, forCellReuseIdentifier: ReminderCell.identifier)
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
        // scroll
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContentView)

        // collection
        scrollViewContentView.addSubview(collectionView)
        scrollViewContentView.addSubview(collectionViewTitleLabel)
        scrollViewContentView.addSubview(collectionViewSubTitleLabel)
        scrollViewContentView.addSubview(addButton)

        // table
        scrollViewContentView.addSubview(tableViewTitleLabel)
        scrollViewContentView.addSubview(tableViewSubTitleLabel)

        scrollViewContentView.addSubview(tableView)
    }

    private func setDelegateAndDataSource() {
        scrollView.delegate = self
        collectionView.delegate = self
        tableView.delegate = self

        collectionView.dataSource = self
        tableView.dataSource = self
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

        tableViewTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(collectionViewTitleLabel.snp.leading)
            $0.top.equalTo(collectionView.snp.bottom).offset(20)
        }

        tableViewSubTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(collectionViewTitleLabel.snp.leading)
            $0.top.equalTo(tableViewTitleLabel.snp.bottom).offset(5)
        }

        tableView.snp.makeConstraints {
            $0.leading.equalTo(collectionView.snp.leading).inset(10)
            $0.trailing.equalTo(collectionView.snp.trailing).inset(10)
            $0.top.equalTo(tableViewSubTitleLabel.snp.bottom).offset(10)
            $0.height.equalTo(200)
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

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReminderCell.identifier, for: indexPath) as! ReminderCell

        let calendar = Calendar(identifier: .gregorian)
        let weekDayofToday = calendar.component(.weekday, from: Date())

        if Myplant.sampleData[indexPath.row].wateringDay.contains(weekDayofToday) {
            cell.setupCellData(Myplant.sampleData[indexPath.row])
        }
//        if Myplant.sampleData[indexPath.row].wateringDay
        return cell

        // 만약 sampleData indexpath.row의 date가 item의 day 안의 element로 있다면 함수를 수행할 것 .
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Myplant.sampleData.count
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
