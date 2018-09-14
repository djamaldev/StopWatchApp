//
//  BackroundVC.swift
//  StopWatchApp
//
//  Created by mr Yacine on 12/09/2018.
//  Copyright © 2018 mr Yacine. All rights reserved.
//

import UIKit

class BackroundVC : XViewController {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.register(UINib(nibName: "BackroundCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        CollectionView.delegate = self
        CollectionView.dataSource = self
    }
    
}

extension BackroundVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ArrayColor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cel = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BackroundCollectionViewCell
        cel.update(Colors: ArrayColor[indexPath.row])
        return cel
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.width / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        BackroundColorManager.ChangeTo(ArrayColor[indexPath.row])
    }
    
}
