//
//  ViewController.swift
//  Calculator
//
//  Created by nguyen gia huy on 05/10/2020.
//  Copyright © 2020 nguyengiahuy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var collectionView: UICollectionView!
    var arrayFunction = [String]()
     let cellIdentifier = "Cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayFunction = ["C","+/-","%","/","7","8","9","X","4","5","6","-","1","2","3","+","0","",".","="]
       self.collectionView.register(UINib(nibName:"ButtonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)//here your custom value for spacing
        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                let lay = collectionViewLayout as! UICollectionViewFlowLayout
                let widthPerItem = collectionView.frame.width / 4 - lay.minimumInteritemSpacing

    return CGSize(width:widthPerItem, height:100)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayFunction.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ButtonCollectionViewCell
        cell.noButton.setTitle("\(arrayFunction[indexPath.row])", for: .normal)
       // cell.noButton.layer.cornerRadius = 50 / 2
        cell.noButton.tag = indexPath.row
        cell.noButton.addTarget(self, action: #selector(self.buttonFunction(_:)), for: .touchUpInside)
        switch indexPath.row {
        case 0,1,2:
            cell.noButton.backgroundColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1)
            cell.noButton.tintColor = .black
    
        case 4,5,6,8,9,10,12,13,14,16,17,18:
            cell.noButton.backgroundColor = UIColor(red: 54/255, green: 54/255, blue: 54/255, alpha: 1)
            cell.noButton.tintColor = .white

        case 3,7,11,15,19:
            cell.noButton.backgroundColor = UIColor(red: 230/255, green: 157/255, blue: 39/255, alpha: 1)
            cell.noButton.tintColor = .white

       
        default:
            print("")
        }
        return cell
    }
    @objc func buttonFunction(_ sender: UIButton!)
    {
        
       // sender.setTitleColor(UIColor.white, for: .normal)
        sender.backgroundColor = UIColor.lightText
        //sender.tintColor = UIColor.darkGray
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            switch sender.tag {
                case 0,1,2:
                    sender.backgroundColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1)
            
                case 4,5,6,8,9,10,12,13,14,16,17,18:
                    sender.backgroundColor = UIColor(red: 54/255, green: 54/255, blue: 54/255, alpha: 1)


                case 3,7,11,15,19:
                    sender.backgroundColor = UIColor(red: 230/255, green: 157/255, blue: 39/255, alpha: 1)

               
                default:
                    print("")
                }
        }
        print("Tap",sender.tag)
    }
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(tabBar.selectedItem!.tag == 0)
        {
            print(1)
        }
    }

}

