//
//  ViewController.swift
//  movie_displayer
//
//  Created by andres murguido on 11/10/18.
//  Copyright © 2018 andres murguido. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
//    var gb: GradientView?
    
    let movies = [
        Movie(name: "The Grinch", released: "12-1-2018", duration: "1.5hrs", image: "Grinch"),
        Movie(name: "Future", released: "11-2-17", duration: "1hr", image: "future"),
        Movie(name: "Overlord", released: "10-25-18", duration: "1.25hrs", image: "overlord"),
        Movie(name: "The Nutcracker", released: "12-25-18", duration: "2hrs", image: "nutcracker"),
        Movie(name: "Bohemiem Rapshody", released: "11-20-18", duration: "2hrs", image: "Queen")
                  ]
    
    let gb: GradientView = {
       let g = GradientView()
        return g
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init() {
        super.init(collectionViewLayout: MovieCollectionLayout())
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.id)
        collectionView.register(MovieCollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MovieCollectionHeader.id)
        collectionView.register(MovieFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MovieFooter.id)
        collectionView.backgroundColor = .clear
        gb.layer.frame = collectionView.layer.bounds
        print(gb.layer.frame)
        collectionView.addSubview(gb)
        collectionView.sendSubviewToBack(gb)
        collectionView.backgroundView = gb
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        gb.frame = collectionView.layer.bounds
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MovieCollectionHeader.id, for: indexPath) as! MovieCollectionHeader
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MovieFooter.id, for: indexPath) as! MovieFooter
            return footer
        default:
            assert(false, "Unexpected element kind")
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.id, for: indexPath) as? MovieCell else { return UICollectionViewCell() }
        cell.movie = movies[indexPath.row]
        return cell
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        guard let flowLayout = collectionView.collectionViewLayout as? MovieCollectionLayout else {
            return
        }
        
        flowLayout.invalidateLayout()
    }

}

extension ViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as? MovieCollectionLayout
        let space: CGFloat = (layout?.minimumInteritemSpacing ?? 0.0) + (layout?.sectionInset.left ?? 0.0) + (layout?.sectionInset.right ?? 0.0)
        let size:CGFloat = ((collectionView.frame.size.width - space) / 2.0) - 10
        
        if (UIDevice.current.orientation.isLandscape) {
           let newSize = ((collectionView.frame.size.width - space)/3.0) - 10
            return CGSize(width: newSize, height: newSize)
        }
        
        return CGSize(width: size, height: size)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 75)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 75)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    
}

