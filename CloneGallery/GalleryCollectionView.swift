//
//  GalleryCollectionView.swift
//  CloneGallery
//
//  Created by a.kravcov on 05.08.2021.
//

import UIKit

class GalleryCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var modelData = Data().data
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .null, collectionViewLayout: layout)
        
        backgroundColor = .white
        delegate = self
        dataSource = self
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.identification)
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 110, right: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelData["Section\(section)"]?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        modelData.keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = modelData["Section\(indexPath.section)"]?[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        return setupData(for: indexPath, with: data)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: frame.height * 0.4)
    }
    
    private func setupData(for indexPath: IndexPath, with data: Model) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identification, for: indexPath) as? GalleryCollectionViewCell else { return UICollectionViewCell() }
        
        cell.imageCell.image = data.image
        cell.title.text = data.title
        cell.countLabel.text = data.count
        
        return cell
    }
}


