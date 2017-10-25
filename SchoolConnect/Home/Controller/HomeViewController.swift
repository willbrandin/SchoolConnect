//
//  HomeViewController.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 10/4/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

/*
- Home View Controller
 Home Screen of the application
 Contains a "Hero-Image" and Label
 Below, a collection view, contains the features such as bully reporting, etc.
 Last, a table view, with Links to the school's website
 */


import UIKit

class HomeViewController: UIViewController {
    
    //Cell identifiers from Storyboards
    let featureCellIdentifier = "home-feature-cell"
    let linkCellIdentifier = "home-link-cell"
    //Array to store the Home Features and the Links to the Internet
    //DataSource for Collection and TableView
    var featureArray = [HomeFeature]()
    var linksArray = [HomeLink]()
    
    @IBOutlet weak var featureCollectionView: UICollectionView!
    @IBOutlet weak var linksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featureCollectionView.delegate = self
        featureCollectionView.dataSource = self
        linksTableView.delegate = self
        linksTableView.dataSource = self
        
        getData()
    }
    
    /// Assingns Data to the Arrays used for Collection and TableView DataSource's.
    func getData() {
        featureArray = HomeFeature.downloadFeaturesData()
        linksArray = HomeLink.downloadLinksData()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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