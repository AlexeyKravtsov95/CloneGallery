//
//  ViewController.swift
//  CloneGallery
//
//  Created by a.kravcov on 04.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var collectionView = GalleryCollectionView()
    
    private lazy var myAlbumLabel: UILabel = {
        let label = UILabel()

        label.text = "Мои альбомы"
        label.font = .boldSystemFont(ofSize: 23)
        return label
    }()
    
    private lazy var showAllLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.text = "См. все"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Альбомы"
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }
    
    func setupLayout() {
        myAlbumLabel.translatesAutoresizingMaskIntoConstraints = false
        myAlbumLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        myAlbumLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true

        showAllLabel.translatesAutoresizingMaskIntoConstraints = false
        showAllLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 155).isActive = true
        showAllLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: myAlbumLabel.topAnchor, constant: 30).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupHierarchy() {
        view.addSubview(myAlbumLabel)
        view.addSubview(showAllLabel)
        view.addSubview(collectionView)
    }
}
