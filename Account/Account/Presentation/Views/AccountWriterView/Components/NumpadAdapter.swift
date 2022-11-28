//
//  NumpadAdapter.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/11/28.
//

import Foundation
import UIKit

protocol NumpadDataSource: AnyObject {
    func numberOfNumpadKeys() -> Int
    func loadNumpadKey(at index: Int) -> String
}

protocol NumpadDelegate: AnyObject {
    func selectKey(at indexPath: IndexPath)
}

class NumpadAdapter: NSObject {
    
    weak var numpadDataSource: NumpadDataSource?
    weak var numpadDelegate: NumpadDelegate?
    
    init(collectionView: UICollectionView, numpadDataSource: NumpadDataSource, numpadDelegate: NumpadDelegate) {
        let layout = UICollectionViewFlowLayout()
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(UINib(nibName: "NumpadKeyCell", bundle: .main), forCellWithReuseIdentifier: "NumpadKeyCellID")
        
        self.numpadDataSource = numpadDataSource
        self.numpadDelegate = numpadDelegate
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

extension NumpadAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numpadDataSource?.numberOfNumpadKeys() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NumpadKeyCellID", for: indexPath) as? NumpadKeyCell else { return .init() }
        
        guard let numpadKeyString = numpadDataSource?.loadNumpadKey(at: indexPath.row) else { return .init() }
        
        cell.configure(with: numpadKeyString)
        
        return cell
    }
}

extension NumpadAdapter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        numpadDelegate?.selectKey(at: indexPath)
    }
}

extension NumpadAdapter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let superviewWidth = collectionView.superview?.frame.width else { return CGSize(width: 0, height: 0) }
        
        let sidePadding = superviewWidth * 0.15
        let interspacing = superviewWidth * 0.1
        
        let cellWidth = (superviewWidth - 2 * sidePadding - 2 * interspacing) / 3
        
        return .init(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        guard let superviewWidth = collectionView.superview?.frame.width else { return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) }
        
        let sidePadding = superviewWidth * 0.15
        return .init(top: 16, left: sidePadding, bottom: 16, right: sidePadding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
