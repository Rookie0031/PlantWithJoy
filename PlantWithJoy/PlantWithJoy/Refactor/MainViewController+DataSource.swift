//
//  MainViewController+DataSource.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/01.
//
import UIKit
import Foundation

extension MainViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
}
