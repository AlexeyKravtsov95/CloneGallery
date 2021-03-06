//
//  GalleryCollectionViewCell.swift
//  CloneGallery
//
//  Created by a.kravcov on 05.08.2021.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let identification = "cell"
    
    func configure(with model: Model) {
        imageCell.image = model.image
        title.text = model.title
        countLabel.text = model.count
    }
    
    public lazy var imageCell: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        return image
    }()
    
    public lazy var containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.backgroundColor = .clear
        return view
    }()
    
    public lazy var title: UILabel = {
        let label = UILabel()
        label.text = "test"
        return label
    }()
    
    public lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = "244"
        label.textColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        imageCell.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        imageCell.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        imageCell.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        imageCell.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        title.topAnchor.constraint(equalTo: imageCell.bottomAnchor).isActive = true

        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        countLabel.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
    }
    
    func setupHierarchy() {
        addSubview(containerView)

        containerView.addSubview(imageCell)
        containerView.addSubview(title)
        containerView.addSubview(countLabel)
        
    }
}
