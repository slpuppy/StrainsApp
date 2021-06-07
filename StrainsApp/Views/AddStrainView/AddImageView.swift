//
//  AddImageView.swift
//  StrainsApp
//
//  Created by Gabriel Puppi on 06/06/21.
//

import SwiftUI



import SwiftUI

struct AddImageView: View {
    
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    var body: some View {
       
        
           
        VStack {
                
                ZStack{
                if selectedImage != nil {
                    Button(action: {
                        self.sourceType = .camera
                        self.isImagePickerDisplay.toggle()
                    }, label: {
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 120, height: 120)
                            .font(.system(size: 80))
                    })
                } else {
                    Button(action: {
                        self.sourceType = .camera
                        
                        self.isImagePickerDisplay.toggle()
                    }, label: {
                        Image(systemName: "camera.circle.fill").font(.system(size: 80)).foregroundColor(Color("mainGreen"))
                    })
                }
             }
           }
            .sheet(isPresented: self.$isImagePickerDisplay) {
                ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                    
            }
            
        }
    
}
struct AddImageView_Previews: PreviewProvider {
    static var previews: some View {
        AddImageView()
    }
}
