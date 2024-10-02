//
//  APIAsyncSample.swift
//  SwiftAsyncSample
//
//  Created by Çağatay Yıldız on 2.10.2024.
//

import SwiftUI
import Alamofire

struct APIAsyncSample: View {
    
    @State var categories : [CategoryModel] = []
    
    var body: some View {
        VStack{
            
            ForEach(categories, id:\.id){item in
                Text(item.name)
                    .padding()
            }
            
        }
        .onAppear(){
           // getAllCategories(completionHandler: getData)
           // getAllCategories(){response in
             //   categories = response
            //}
            
            Task{
                categories = try await getAllCategories2()
            }
        }
        
       
    }
    
    func getData(data:[CategoryModel]){
        categories = data
    }
  
}

#Preview {
    APIAsyncSample()
}





struct CategoryModel : Codable{
    var id : Int = 0
    var name : String = ""
    var description : String = ""
}
