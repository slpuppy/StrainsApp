//
//  ContentView.swift
//  StrainsApp
//
//  Created by Gabriel Puppi on 28/05/21.
//

import SwiftUI

struct MyStrainsView: View {
    
    @State private var strainSearch = ""
    
    
    let strainList = [Strains(name: "OG Kush", strainDetails: "This legendary strain boasts a complex aroma with notes of fuel, skunk, and spice.", strainImage: "OG", strainType: "Sativa", isPopular: false),
                      
        Strains(name: "Pineaple Express", strainDetails: "Pineapple Express is a hybrid cannabis strain that combines the potent and flavorful forces of Trainwreck and Hawaiian.", strainImage: "OG", strainType: "Hybrid", isPopular: true),
                      
        Strains(name: "Bubba Kush", strainDetails: "Bubba Kush is a sweet, earthy indica strain with genetics that trace back to the Hindu Kush landrace strains.", strainImage: "OG", strainType: "Indica", isPopular: false),]
    
   
    var allStrains: [Strains] {
        strainList.sorted {$0.name < $1.name }.filter { strainSearch.isEmpty ?
            true : ($0.name + $0.strainType).lowercased().contains(strainSearch.lowercased()) }
    
    }
    
    
    
    var popularStrains: [Strains] {
    
        allStrains.filter { $0.isPopular == true}
    }
    
    var body: some View {
        
      
        
    
        
            
            VStack {
                VStack {
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(.systemGray3))
                        TextField("Search Strain", text: $strainSearch )
                    }.padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(15)
                    
                    
                    List{
                       ListSectionView(strains: popularStrains, title: "Favourite Strains", systemImage: "heart.fill")
                        ListSectionView(strains: allStrains, title: "All Strains", systemImage: nil)
                     
                    }.listStyle(InsetGroupedListStyle())
                    .navigationTitle("Strainbook")
                    .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
                    .navigationBarHidden(false)
                    
                }
            }.background(Color(.systemGray6).ignoresSafeArea())
            
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       MyStrainsView()
    }
}


