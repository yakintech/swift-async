//
//  GCDSample.swift
//  SwiftAsyncSample
//
//  Created by Çağatay Yıldız on 2.10.2024.
//


//Grand Central Dispatch

import SwiftUI

struct GCDSample: View {
    
    @State private var image : UIImage? = nil
    
    var body: some View {
        VStack{
            if let image = image {
                
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
            }
            else{
                Text("Resim indiriliyor...")
            }
        }
        .onAppear(){
            downloadImage()
        }
    }
    
    func downloadImage(){
        guard let url = URL(string: "https://bilimgenc.tubitak.gov.tr/sites/default/files/inline-images/koala%20ve%20yavrusu.jpg") else {return}
        
        print("1")
        DispatchQueue.global().async{
            print("2")
            if let data = try? Data(contentsOf: url),
                  let downloadedImage = UIImage(data: data) {
                   DispatchQueue.main.async {
                       self.image = downloadedImage
                   }
               }
        }
        print("3")
    }
}





#Preview {
    GCDSample()
}
