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
        $0.tableFooterView = UIView(frame: .zero)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(MyPlantCell.self, forCellWithReuseIdentifier: MyPlantCell.identifier)

        addsubView()
        configureUI()
        setDelegateAndDataSource()
        addTargetOfFunction()
        navigationItem.titleView = gardenTitleLabel

        NotificationCenter.default.addObserver(self, selector: #selector(reloadMainViewData(_:)), name: NSNotification.Name(rawValue: "ReloadMyPlant"), object: nil)
        tableView.separatorColor = .clear
    }

    @objc func reloadMainViewData(_ notification: NSNotification) {
        collectionView.reloadData()
        tableView.reloadData()
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

        // discovery
        scrollViewContentView.addSubview(discoveryTitleLabel)
        scrollViewContentView.addSubview(discoverySubTitleLabel)
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

        discoveryTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(collectionViewTitleLabel.snp.leading)
            $0.top.equalTo(tableView.snp.bottom).offset(20)
        }

        discoverySubTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(collectionViewTitleLabel.snp.leading)
            $0.top.equalTo(discoveryTitleLabel.snp.bottom).offset(5)
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
        let filteredList = Myplant.sampleData.filter({$0.wateringDay.contains(weekDayOfToday)})
        cell.setupCellData(filteredList[indexPath.row])
        cell.selectedBackgroundView = UIView(frame: .zero)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Myplant.sampleData.filter({$0.wateringDay.contains(weekDayOfToday)}).count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
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
