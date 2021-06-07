//
//  MainView.swift
//  StrainsApp
//
//  Created by Gabriel Puppi on 30/05/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        
        
        NavigationView{
        
        VStack {
            Spacer()
            NavigationLink(destination: MyStrainsView()){
               ZStack{
                RoundedRectangle(cornerRadius: 15.0)
                            .stroke(Color("mainGreen"), lineWidth: 2.0)
                            .padding(10)
                Text("MyStrains")
                    .foregroundColor(Color("mainGreen"))
                    .font(.headline)
                    }.frame(maxHeight:80)
            }
            
            NavigationLink(destination: AddStrainView()){
               ZStack{
                RoundedRectangle(cornerRadius: 15.0)
                    .foregroundColor(Color("mainGreen"))
                            .padding(10)
                Text("Add new strain")
                    .foregroundColor(.white)
                    .font(.headline)
                    }.frame(maxHeight:80)
            }
        }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
