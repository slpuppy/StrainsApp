//
//  Strain.swift
//  StrainsApp
//
//  Created by Gabriel Puppi on 28/05/21.
//

import Foundation



struct Strains: Identifiable {
    
    
    init(name: String, strainDetails: String, strainImage: String, strainType: String, isPopular: Bool) {
        self.name = name
       
        self.strainTags = strainDetails
        self.strainImage = strainImage
        self.strainType = strainType
        self.isPopular = isPopular
    }
    
    
     
    
    
    
   let name: String
 
   let strainTags: String
   let strainImage: String
   var strainType: String
   let isPopular: Bool
   let id = UUID()
  

}






