//
//  HomeViewModel.swift
//  WGAME
//
//  Created by Maged on 13/07/2024.
//

import Foundation
import Moya
import PromiseKit
import SwiftUI
extension Home {

     func getAllProduct(){
        self.loading = true

        let params : [String : Any] =
        [:]
        firstly { () -> Promise<Any> in
            return BGServicesManager.CallApi(self.homeServices,Services.Home)
        }.done({ [self] response in
            let result = response as! Response
            let data : [ProductElement] = try BGDecoder.decode(data: result.data)
            self.products = data
            self.loading = false
            for slide in products.reversed()  {
                if SliderProducts.count == 0 || SliderProducts.count < 10 {
                    self.SliderProducts.append(slide)
                }
            }
        }).ensure {
        }.catch { (error) in
        }
    }
     func getByPlatform(cat:String){
        if cat == "all" {
            getAllProduct()
        }else{
            self.loading = true

        let params : [String : Any] =
        [
            "platform" : cat
        ]
        firstly { () -> Promise<Any> in
            return BGServicesManager.CallApi(self.homeServices,Services.Platform(parameters:params ))
        }.done({ [self] response in
            self.products.removeAll()
            let result = response as! Response
            let data : [ProductElement] = try BGDecoder.decode(data: result.data)
            self.products = data
            self.loading = false

        }).ensure {
        }.catch { (error) in
        }
        }
    }
    
    
    @ViewBuilder
    func CategoryItem(image: String,  title: String)-> some View {
        
        Button {
            withAnimation{
                self.cat = title
                getByPlatform(cat: title.lowercased())
            }
        } label: {
            HStack(spacing: 8) {
                Text(title)
                    .font(.system(size: 12.5))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(
                
                ZStack {
                    if cat == title {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                            .foregroundColor(.red)
                    }
                }
            
            )
        }
    }
    
}
