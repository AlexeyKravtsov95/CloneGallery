//
//  ViewController.swift
//  CloneGallery
//
//  Created by a.kravcov on 04.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var cell = Data().data
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        return layout
    }()
    
    private lazy var imageCell: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
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
        setupLayout()
        setupHierarchy()
    }
    
    func setupHierarchy() {
        myAlbumLabel.translatesAutoresizingMaskIntoConstraints = false
        myAlbumLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        myAlbumLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true

        showAllLabel.translatesAutoresizingMaskIntoConstraints = false
        showAllLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 155).isActive = true
        showAllLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: myAlbumLabel.topAnchor, constant: 50).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupLayout() {
        view.addSubview(myAlbumLabel)
        view.addSubview(showAllLabel)
        view.addSubview(collectionView)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = .green

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}

