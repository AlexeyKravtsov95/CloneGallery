//
//  GalleryCollectionViewController.swift
//  CloneGallery
//
//  Created by a.kravcov on 05.08.2021.
//

import UIKit

class GalleryCollectionViewController:
    UIViewController, UICollectionViewDelegateFlowLayout {

    public var modelData = Data().data
    
    @objc func leftButtonItem(param: UIBarButtonItem) {
        
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.reloadData()
        collectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.identification)
        collectionView.register(TableCollectionViewCell.self, forCellWithReuseIdentifier: TableCollectionViewCell.identification)
        collectionView.register(SectionHeader.self,
                                        forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                        withReuseIdentifier: SectionHeader.indentifier)
        collectionView.frame = view.bounds
        
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(leftButtonItem(param:)))
        
        title = "Альбомы"
        view.backgroundColor = .white
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in

            switch sectionNumber {

            case 0: return self.myAlbumsSection()
            case 1: return self.generalAlbumSection()
            default: return self.otherCategoriesAlbumSection()
            }
        }
    }

    func myAlbumsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(190),
            heightDimension: .absolute(550))

        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                     subitem: item,
                                                     count:2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                      leading: 5,
                                                      bottom: 5,
                                                      trailing: 5)
        let layoutSection = NSCollectionLayoutSection(group: group)
        layoutSection.orthogonalScrollingBehavior = .continuous
        layoutSection.contentInsets = NSDirectionalEdgeInsets.init(top: 28, leading: 0, bottom: 0, trailing: 12)

        let header = createHeader()
        layoutSection.boundarySupplementaryItems = [header]


        return layoutSection
    }

    func generalAlbumSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(190),
            heightDimension: .absolute(270))

        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                     subitem: item,
                                                     count:1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                      leading: 5,
                                                      bottom: 5,
                                                      trailing: 5)
        let layoutSection = NSCollectionLayoutSection(group: group)
        layoutSection.orthogonalScrollingBehavior = .groupPaging
        layoutSection.contentInsets = NSDirectionalEdgeInsets.init(top: 28, leading: 0, bottom: 0, trailing: 12)

        let header = createHeader()
        layoutSection.boundarySupplementaryItems = [header]


        return layoutSection
    }

    func otherCategoriesAlbumSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 8, bottom: 0, trailing: 8)
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [layoutItem])
        let section = NSCollectionLayoutSection(group: layoutGroup)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 30, leading: 0, bottom: 0, trailing: 12)
        let header = createHeader()
        section.boundarySupplementaryItems = [header]
        
        return section
    }

    func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        return layoutSectionHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.indentifier, for: indexPath) as! SectionHeader
        let number = indexPath.section
            switch (number) {
            case 0:
                header.configureBothHeaders(leftheader: "Мои альбомы", rightHeader: "См. все")
                return header

            case 1:
                header.configureBothHeaders(leftheader: "Общие альбомы", rightHeader: "См. все")
                return header

            case 2:
                header.configureLeftHeader("Типы медиафайлов")
                return header

            case 3:
                header.configureLeftHeader("Другое")
                return header

            default:
                break
            }
        return UICollectionReusableView()
    }


    func setupLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    func setupHierarchy() {
        view.addSubview(collectionView)
    }
}

extension GalleryCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate
{
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
        
        switch data.type{
        case .myAlbum:
            return albumSectionCell(for: indexPath, with: data)
        case .otherAlbum:
            return tableSectionCell(for: indexPath, with: data)
        }
    }
    
    private func albumSectionCell(for indexPath: IndexPath, with data: Model) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identification, for: indexPath) as? GalleryCollectionViewCell else { return UICollectionViewCell() }
        
        cell.imageCell.image = data.image
        cell.title.text = data.title
        cell.countLabel.text = data.count
        
        return cell
    }
    
    private func tableSectionCell(for indexPath: IndexPath, with data: Model) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCollectionViewCell.identification, for: indexPath) as? TableCollectionViewCell else { return UICollectionViewCell() }
        
        cell.icon.image = data.image
        cell.titleLabel.text = data.title
        cell.descriptionLabel.text = data.count
        
        return cell
    }
}


