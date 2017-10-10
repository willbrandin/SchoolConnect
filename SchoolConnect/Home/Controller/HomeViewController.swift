//
//  HomeViewController.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 10/4/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let featureCellIdentifier = "home-feature-cell"
    let linkCellIdentifier = "home-link-cell"
    
    var featureArray = [HomeFeature]()
    var linksArray = [HomeLink]()
    @IBOutlet weak var featureCollectionView: UICollectionView!
    @IBOutlet weak var linksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        featureCollectionView.delegate = self
        featureCollectionView.dataSource = self
        linksTableView.delegate = self
        linksTableView.dataSource = self
        
        
        downloadFeatureData()
        downloadLinksData()
    }
    
    func downloadFeatureData() {
        
    }
    
    func downloadLinksData() {
        let link1 = HomeLink(title: "Link1", linkURL: "Link")
        let link2 = HomeLink(title: "Link2", linkURL: "Link")
        let link3 = HomeLink(title: "Link3", linkURL: "Link")
        
        linksArray.append(link1)
        linksArray.append(link2)
        linksArray.append(link3)
    }
    
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featureArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: featureCellIdentifier, for: indexPath) as? FeatureHomeCollectionViewCell {
            cell.configureCell(feature: featureArray[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return linksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: linkCellIdentifier) as? LinkHomeTableViewCell {
            cell.configureCell(link: linksArray[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
}
