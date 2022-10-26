//
//  MainViewController+Extension.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/03.
//
import UIKit
import Foundation

extension MainViewController: UICollectionViewDelegate, UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Myplant.sampleData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPlantCell.identifier, for: indexPath) as! MyPlantCell
        cell.setupCellData(Myplant.sampleData[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPlantCell.identifier, for: indexPath) as! MyPlantCell
        cell.setupCellData(Myplant.sampleData[indexPath.row])

        let nameLabelSize = cell.nameLabel.intrinsicContentSize.width
        let plantSpeciesSize = cell.speciesLabel.intrinsicContentSize.width
        let additionalWidthSize = max(nameLabelSize, plantSpeciesSize)
        print("인트린직 사이즈")
        print(additionalWidthSize)
        print("인트린직 사이즈")

        if cell.nameLabel.text?.count ?? 0 < 8 {
            return CGSize(
                width: view.frame.width / 2.2 + 10,
                height: view.frame.height/8
            )
        } else {
            return CGSize(
                width: view.frame.width / 2.2 + additionalWidthSize - 40,
                height: view.frame.height/8
            )
        }
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 15
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 100
//    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("selected at \(indexPath.section) and row \(indexPath.row)")
    }
}


class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) ->  [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)?.map { $0.copy() as! UICollectionViewLayoutAttributes }
        var leftMargin: CGFloat = 15.0
        var maxY: CGFloat = -1.0

        attributes?.forEach { layoutAttribute in
            guard layoutAttribute.representedElementCategory == .cell else {
                return
            }

            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = 15.0
            }
            layoutAttribute.frame.origin.x = leftMargin
            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY , maxY)
        }

        return attributes
    }
}
