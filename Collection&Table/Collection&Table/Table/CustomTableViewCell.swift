//
//  CustomTableViewCell.swift
//  Collection&Table
//
//  Created by nguyen gia huy on 09/10/2020.
//  Copyright © 2020 nguyengiahuy. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    var isLoading: Bool = false
    var dataCollection = DataMovie.share
    var index = 0
    var scrollCell: (()->Void)? = nil
    var lastContentOffset = 0
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
    }
    
    func updatePosition(){
        let positionCGPoint = CGPoint(x: index, y: 0)
        //collectionView.scrollRectToVisible(destinationRect, animated: false)
        collectionView.setContentOffset(positionCGPoint, animated: false)
       // collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .left, animated: false)
    }
    
}
extension CustomTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCollection.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.imageView.image = UIImage(named: "\(dataCollection.data[indexPath.row].imageView)")
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffX = scrollView.contentOffset.x
        for cell in collectionView.visibleCells {
            if collectionView.indexPath(for: cell) != nil {
                index = Int(contentOffX)
                scrollCell?()
              }
            }
    }
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        self.lastContentOffset = Int(scrollView.contentOffset.x)
//    }
//    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        if (self.lastContentOffset < Int(scrollView.contentOffset.x)) {
//            collectionView.scrollToNextItem()
//        } else if (self.lastContentOffset > Int(scrollView.contentOffset.x)) {
//            // moved left
//            collectionView.scrollToPreviousItem()
//        } else {
//            // didn't move
//        }
//    }
    
    func setData(_ flag: Int){
        index = flag
        collectionView.reloadData()
    }
    
}
extension UICollectionView {
    func scrollToNextItem() {
        let contentOffset = CGFloat(floor(self.contentOffset.x + self.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }

    func scrollToPreviousItem() {
        let contentOffset = CGFloat(floor(self.contentOffset.x - self.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }

    func moveToFrame(contentOffset : CGFloat) {
        self.setContentOffset(CGPoint(x: contentOffset, y: self.contentOffset.y), animated: true)
    }
}
