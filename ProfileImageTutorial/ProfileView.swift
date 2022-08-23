//
//  ContentView.swift
//  ProfileImageTutorial
//
//  Created by KEVIN EVANS on 8/21/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Button(action: {
                print("button clicked")
                changeProfileImage = true
                openCameraRoll = true
            }, label: {
                if changeProfileImage {
                    Image(uiImage: imageSelected)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                } else {
                Image("ProfileIcon")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())}
        })
            Image(systemName: "plus")
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .background(Color.gray)
                .clipShape(Circle())
        }
        .sheet(isPresented: $openCameraRoll) {
            ImagePicker(selectedImage: $imageSelected,sourceType: .photoLibrary)
        }
            
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
