//
//  CategoryService.swift
//  SwiftAsyncSample
//
//  Created by Çağatay Yıldız on 2.10.2024.
//

import Foundation
import Alamofire


func getAllCategories(completionHandler: @escaping(([CategoryModel]) -> ())) -> Void{
    
    var categoryList : [CategoryModel] = []
    
    var data = AF.request("https://northwind.vercel.app/api/categories").responseDecodable(of: [CategoryModel].self) { response in
        
        categoryList = response.value ?? []
        completionHandler(categoryList)
    }
}



func getAllCategories2() async throws -> [CategoryModel] {
    var categoryList: [CategoryModel] = []
    
    let data = try await AF.request("https://northwind.vercel.app/api/categories")
        .serializingDecodable([CategoryModel].self).value
    
    categoryList = data
    return categoryList
}










