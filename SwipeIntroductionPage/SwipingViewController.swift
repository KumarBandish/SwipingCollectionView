//
//  SwipingViewController.swift
//  SwipeIntroductionPage
//
//  Created by Bandish on 22/05/19.
//  Copyright © 2019 Bandish. All rights reserved.
//

import UIKit

class SwipingViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var swipingCollectionView: UICollectionView!
    @IBOutlet weak var swipingPageControl: UIPageControl!
    //MARK: Property
    let swipingDataSource = ["a", "b", "c"]
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
//MARK: UICollectionViewDataSource
extension SwipingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return swipingDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SwipingCollectionViewCell", for: indexPath) as! SwipingCollectionViewCell
        cell.swipingImageView.backgroundColor = (indexPath.row % 2 == 0 ? .red : .green)
        return cell
    }
}
//MARK: UICollectionViewDelegate
extension SwipingViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        swipingPageControl.currentPage = indexPath.row
    }
}
//MARK: UICollectionViewDelegateFlowLayout
extension SwipingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
