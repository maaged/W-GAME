//
//  DetailView.swift
//  AsycIMG
//
//  Created by Maged on 13/07/2024.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var baseData: BaseViewModel
    //FOR HERO EFFECT
    @Namespace var animation: Namespace.ID
    @State private var favorites = Favorites()
    @State private var isFavorited = false
    var body: some View {
        
        //MARK: SAFE CHECK
        if let product = baseData.currentProduct, baseData.showDetail {
            ZStack{
                HStack {
                    //MARK: DRAWER MENU
                    Button {
                        withAnimation{
                            baseData.showDetail = false
                        }
                    } label: {
                        Image(systemName: "arrow.left.circle.fill")
                            .font(.title2)
                            .tint(.white)
                            .foregroundColor(.white)
                            .foregroundColor(.black)
                    } // END DRAWER MENU
                    
                    Spacer()
                    
                    //MARK: Fav ICON
                    favoriteButton(product: product).onAppear {
                        self.isFavorited = self.favorites.contains(product)    // << here !!
                        } // END Fav ICON
                }
                .foregroundColor(.black)
                .padding(.top,70)
                .padding(50)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
                .zIndex(1)
                .edgesIgnoringSafeArea(.top)
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 0) {
                        //MARK: - APP BAR
                        
                        // END APP BAR
                        
                        //MARK: - PRODUCT IMAGE WITH PRODUCT DETAILS
                        
                        
                        VStack(alignment: .center, spacing: 0) {
                            
                            HStack {
                                Text(product.title)
                                    .foregroundColor(.white)
                                    .font(.system(size: 20.5))
                                    .fontWeight(.bold)
                                    .lineLimit(3)
                                    .padding(15)
                                    .padding(.top,130)
                                
                                HStack {
                                    Image("correct")
                                        .resizable()
                                        .aspectRatio(1, contentMode: .fit)
                                        .padding(.top,190)
                                    
                                }.padding(.bottom)
                                    .frame(width: 25, height: 225)
                                
                                
                                HStack(spacing: 8) {
                                    Text("GET")
                                        .font(.system(size: 12.5))
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: 60, maxHeight: 35, alignment: .center)
                                    
                                    
                                }
                                .padding(.top,100)
                                .background(
                                    
                                    ZStack {
                                        //MARK: - TRANSITION SLIDER
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.white)
                                            .matchedGeometryEffect(id: "TAB", in: animation)
                                            .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
                                            .foregroundColor(.red)
                                            .padding(.top,100)
                                    }
                                    
                                    
                                )
                                .padding(.vertical, 8)
                                .padding(.horizontal, 12)
                                
                            }
                            .padding(.bottom,-100)
                            
                            
                            
                            
                            
                            
                            
                        }
                        .frame(width: getScreenBound().width, height: 360, alignment: .center)
                        
                        .background(Color.black)
                        .opacity(0.8)
                        .fullBackground(imageName: product.image)
                        
                        
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        
                        
                        
                    }
                    .padding(.top)
                    
                    .background(Color.white)
                    .transition(.opacity)
                    
                    HStack{
                        VStack{
                            HStack{
                                VStack{
                                    
                                    HStack {
                                        Image("coin")
                                            .resizable()
                                            .aspectRatio(1, contentMode: .fit)
                                            .padding(.bottom,-25)
                                            .padding(.top,10)
                                        
                                    }.padding(.bottom)
                                        .frame(width: 25, height: 25)
                                    Text(product.worth)
                                        .font(.system(size: 12.5))
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: 60, maxHeight: 35, alignment: .center)
                                }
                                .frame(maxWidth: getScreenBound().width / 3, maxHeight: 70, alignment: .center)
                                Button {
                                    
                                } label: {
                                }
                                .frame(maxWidth: 2, maxHeight: 70, alignment: .bottom)
                                .background(.black)
                                .padding(.top,15)
                                VStack{
                                    HStack {
                                        Image("people")
                                            .resizable()
                                            .aspectRatio(1, contentMode: .fit)
                                            .padding(.bottom,-25)
                                            .padding(.top,10)
                                        
                                    }.padding(.bottom)
                                        .frame(width: 25, height: 25)
                                    Text("\(product.users)")
                                        .font(.system(size: 12.5))
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: 60, maxHeight: 35, alignment: .center)
                                }.frame(maxWidth: getScreenBound().width / 3, maxHeight: 70, alignment: .center)
                                Button {
                                    
                                } label: {
                                }
                                .frame(maxWidth: 2, maxHeight: 70, alignment: .bottom)
                                .background(.black)
                                .padding(.top,15)
                                VStack{
                                    HStack {
                                        Image("game-controller")
                                            .resizable()
                                            .aspectRatio(1, contentMode: .fit)
                                            .padding(.bottom,-25)
                                            .padding(.top,10)
                                        
                                    }.padding(.bottom)
                                        .frame(width: 25, height: 25)
                                    Text(product.type)
                                        .font(.system(size: 12.5))
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: 60, maxHeight: 35, alignment: .center)
                                }.frame(maxWidth: getScreenBound().width / 3, maxHeight: 70, alignment: .center)
                                
                                
                            }
                            .padding(.bottom,10)
                            
                            VStack(alignment: .leading){
                                Text("Platforms")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                
                                Text(product.platforms)
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                            }
                            .frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)
                            .padding()
                            
                            VStack(alignment: .leading){
                                Text("Giveaway End Date")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                
                                Text(product.endDate)
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                            }
                            .frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)
                            .padding()
                            
                            VStack(alignment: .leading){
                                Text("Description")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                
                                Text(product.description)
                                    .foregroundColor(.black)
                                    .background(.white)
                                
                                
                            }
                            .frame(maxWidth: .infinity, minHeight:80, alignment: .leading)
                            .padding()
                            
                            
                        }
                        
                        .padding()
                        //                        .padding(.top,30)
                        
                    }
                    
                    .padding(.top,380)
                    
                    
                }
                
                
                
            }
            .background(.white)
            
            .padding(.top,-33)
            
            
            .ignoresSafeArea()
            
        }
        
        
    }
}



//MARK: - VIEW EXTENSION

extension View {
    func getScreenBound()-> CGRect {
        return UIScreen.main.bounds
    }
}
