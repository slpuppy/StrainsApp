//
//  AddStrain.swift
//  StrainsApp
//
//  Created by Gabriel Puppi on 28/05/21.
//

import SwiftUI


struct Types: Identifiable, Equatable {
    
    let id = UUID()
    let types: String
    
}



struct AddStrainView: View {
    
    @State var strainName = ""
    @State var strainType = ""
    @State private var typeSelected: Types?
    @State private var strainDetails = ""
    @State var isFavourite = false
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }

    
    let types = [Types(types: "Sativa"),
                 Types(types: "Indica"),
                 Types(types: "Hybrid")]
    
    
    
    var body: some View {
        
        
        
        VStack {
            HStack {
                
                AddImageView()
                TextField("Strain name", text: $strainName)
                    .padding(10)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                    .padding(15)
                    }.padding()
            HStack{
                ForEach(types, id: \.id){ type in
                    ZStack{
                    Circle()
                            .foregroundColor(type == typeSelected ? .orange : Color("mainGreen"))
                            .animation(.easeIn(duration: 0.2))
                            Text(type.types)
                            .foregroundColor(.white)
                            .font(.headline)
                            
                    }.padding(10)
                    .frame(maxHeight:120)
                    .onTapGesture {
                        if type == typeSelected {
                            typeSelected = nil
                            } else {
                            typeSelected = type
                                
                            }
                     }
                }
            }
            ZStack(alignment: .topLeading) {
                   TextEditor( text: $strainDetails)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(15)
                        .foregroundColor(Color(.systemGray))
                        .padding(5)
                        .padding(15)
                    
                        
                    
                    if strainDetails.isEmpty {
                        
                        Text("Strain details")
                            .padding(.top, 45)
                            .padding(.leading, 40)
                            .foregroundColor(Color(.systemGray2))
                        }
                }
            
            HStack{
                
                Text("Favourite Strain:").font(.headline).padding(.leading, 10)
                Spacer()
                
                ZStack {
                    Image(systemName: "heart.fill").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.trailing, 20).foregroundColor(Color("mainGreen")).opacity(isFavourite ? 1 : 0)
                        .animation(.linear)
                    Image(systemName: "heart").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.trailing, 20).foregroundColor(Color("mainGreen"))
                }.onTapGesture {
                    
                    self.isFavourite.toggle()
                }
            }.padding(15)
            
            NavigationLink(destination: MyStrainsView()) {
                
                ZStack{
                    Rectangle()
                        .cornerRadius(15)
                        .foregroundColor(Color("mainGreen"))
                        .padding(10)
                        
                    Text("Add Strain")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                }.frame(maxHeight:80)
           }
        }.navigationTitle("Add new strain")
        .navigationBarHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
       
      }
    }




struct AddStrainView_Previews: PreviewProvider {
    static var previews: some View {
        AddStrainView()
    }
}
