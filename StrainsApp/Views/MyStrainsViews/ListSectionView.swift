//
//  ListSectionVew.swift
//  StrainsApp
//
//  Created by Gabriel Puppi on 28/05/21.
//

import SwiftUI

struct ListSectionView: View {
    
    let strains: [Strains]
    
    let title: String
    let systemImage: String?
    
    var body: some View {
        
        if !strains.isEmpty {
        Section(header: header){
            ForEach(strains){strain in
                NavigationLink(destination: StrainDetail()){
                    HStack(spacing:20){
                        Image("OG")
                        VStack(alignment: .leading){
                            Text(strain.name)
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold, design: .default))
                            Text(strain.strainTags)
                                .foregroundColor(Color(.systemGray2))
                                .font(.system(size: 12, weight: .medium, design: .default))
                        }
                    }.padding(10)
                }
            }
        }
    }
    }
    
    private var header: some View {
        
        HStack{
            if let systemImage = systemImage {
                Image(systemName: systemImage)
                }
            Text(title)
            Spacer()
            
        }.font(.headline)
        .foregroundColor(Color.black)
        .textCase(.none)
        
        
        
    }
}

//struct ListSectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListSectionView(strains: "", title: "", systemImage: "")
//    }
//}
