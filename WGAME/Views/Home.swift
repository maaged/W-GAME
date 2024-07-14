//
//  Home.swift
//  WGAME
//
//  Created by Maged on 13/07/2024.
//

import SwiftUI
import Moya
struct Home: View {
    
    public let homeServices = MoyaProvider<Services>()

    @State var currentSlider: Int = 0
    @State var cats =  [String]()
    @State private var favorites = Favorites()
    @State var loading = false
    @State var isRefreshing:Bool = false
    @EnvironmentObject var myFavorites: Favorites
    @StateObject var baseData = BaseViewModel()
    //FOR HERO EFFECT
    @Namespace var animation: Namespace.ID
    
    @State var products =  [ProductElement]()
    @State var SliderProducts =  [ProductElement]()

    @State var timeRemaining = 2.0 // Use Double
    @State var timer: Timer.TimerPublisher = Timer.publish (every: 0.005, on: .main, in: .common)
    @State var location : Int = 0
    @State var cat : String = "all"
    
    var body: some View {
        if loading {
            HStack(spacing: 15) {
                ProgressView() .tint(.red)
                                       Text("Loading…")
                                   }
        }else{
            ScrollView(.vertical, showsIndicators: false) {
                PullToRefresh(isRefreshing: $isRefreshing, coordinateSpaceName: "pullToRefresh") {
                    if self.cat == "all" {
                        getAllProduct()
                    }else{
                        getByPlatform(cat:cat)
                    }
                                }
                LazyVStack {
                VStack(spacing: 8) {
                    //MARK - APP BAR
                    //MARK - APP BAR
                    HStack {
                        //MARK: DRAWER Wave
                        Button {
                            
                        } label: {
                            Image("wave")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                        } // END DRAWER Wave
                        
                        Spacer()
                        
                        
                    }
                    .foregroundColor(.black)
                    HStack {
                        //MARK: DRAWER Hello
                        Button {
                            
                        } label: {
                            Text("Hello, Mohamed")
                        } // END DRAWER Hello
                        
                        Spacer()
                        
                        //MARK: AVatar ICON
                        Button {
                            
                        } label: {
                            Image("gamer")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                        } // END AVATAR ICON
                        
                        
                    }
                    .foregroundColor(.black)
                    
                    // END APP BAR
                    HStack {
                        Text("Explore \nGames Giveaways")
                            .font(.title.bold())
                        
                        Spacer()
                        
                    } // END BODY TOP
                    
                    //MARK: SLIDER
                   
                    caruselContentView(products: SliderProducts)

       
                    //MARK: - CATEGORY LIST SLIDER
                    ScrollView(.horizontal, showsIndicators: false) {
                        //MARK: - CATEGORY LIST
                        HStack(spacing: 18) {
                            CategoryItem(image: "", title: "all")
                            CategoryItem(image: "", title: "pc")
                            CategoryItem(image: "", title: "ios")
                            CategoryItem(image: "", title: "android")

                       } // END CATEGORY LIST
                        .padding(.vertical)
                        
                    }
                    .padding(.top, 0)
                    //MARK: - PRODUCT LIST
                    let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 1)
                    
                    // MARK: - GRID VIEW
                    LazyVGrid(columns: columns, spacing:  18) {
                        ForEach(products){product in
                            if favorites.contains(product){
                                CardView(product: product,isFav: true)
                                    .onTapGesture {
                                        withAnimation{
                                            baseData.currentProduct = product
                                            baseData.showDetail = true
                                        }
                                    }

                            }else{
                                CardView(product: product, isFav: false)
                                    .onTapGesture {
                                        withAnimation{
                                            baseData.currentProduct = product
                                            baseData.showDetail = true
                                        }
                                    }

                            }

                            
                        }
                    }
                }
                .padding()
                }
            }.refreshable {}
            .onAppear{
                if self.products.count == 0 {
                    self.getAllProduct()
                }else{
                    
                }
                
            }
         
            .coordinateSpace(name: "pullToRefresh")
            .overlay(
                DetailView(animation: _animation)
                    .environmentObject(baseData)
            )
         
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
