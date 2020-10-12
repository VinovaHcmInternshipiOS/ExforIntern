//
//  CustomTableViewCell.swift
//  Collection&Table
//
//  Created by nguyen gia huy on 09/10/2020.
//  Copyright © 2020 nguyengiahuy. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var dataCollection = DataMovie.share
    var index = 0
    var scrollCell: (()->Void)? = nil
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
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .left, animated: false)
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
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("End Dragging")
        for cell in collectionView.visibleCells {
          if let indexPath = collectionView.indexPath(for: cell) {
            index = indexPath.row
            scrollCell?()
          }
        }
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in collectionView.visibleCells {
          if let indexPath = collectionView.indexPath(for: cell) {
            index = indexPath.row
            scrollCell?()
          }
        }
      }
    func setData(_ flag: Int){
        index = flag
        collectionView.reloadData()
    }
    
}
