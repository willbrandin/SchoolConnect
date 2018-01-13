//
//  HomeFeature.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 10/9/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

enum FeatureType: String {
    case bullyReporting = "bullyReporting"
    case teacherContact = "contactTeacher"
}

struct HomeFeature {
    
    //MARK: Properties
    var title: String
    var featureType: FeatureType
    var description: String
    var isSelected: Bool
    
    //MARK: Methods
    static func downloadFeaturesData(completion: @escaping ([HomeFeature]) -> Void){
        var features = [HomeFeature]()
        
        let ref = Database.database().reference()
        let featureRef = ref.child(GlobalVariables.SCHOOL_NAME).child(GlobalVariables.FEATURES)
        featureRef.observe(.childAdded) { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject] {
                guard let title = dictionary["title"] as? String else { return }
                guard let type = dictionary["type"] as? String else { return }
                guard let description = dictionary["description"] as? String else { return }
                guard let isSelected = dictionary["isSelected"] as? Bool else { return }
                guard let featureType = FeatureType(rawValue: type) else { return }
                let newFeature = HomeFeature(title: title, featureType: featureType, description: description, isChosen: isSelected)
                features.append(newFeature)
                completion(removeNonSelectedFeatures(from: features))
            }
        }
    }
    
    
    static func removeNonSelectedFeatures(from features: [HomeFeature]) -> [HomeFeature] {
        let trueValues = features.filter({$0.isSelected == true})
        return trueValues
    }
    
    //MARK: Inits
    init(title: String, featureType: FeatureType, description: String, isChosen: Bool) {
        self.title = title
        self.featureType = featureType
        self.description = description
        self.isSelected = isChosen
    }
}


