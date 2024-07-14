//
//  caruselContentView.swift
//  WGAME
//
//  Created by Maged on 13/07/2024.
//

import SwiftUI

struct caruselContentView: View {

    @State var location : Int = 0
    var products:[ProductElement]

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var Counter = 0

    var body: some View {
        ZStack {
            VStack {
                VStack{
                    CarouselView(carouselLocation: self.$location, itemHeight: 400,  products: products).onReceive(timer) { _ in
                        if self.Counter > 0 {
                            self.Counter -= 1
                            //missing some code to move index of carousel to i+1
                        }
                        self.Counter = 10
                       
                    }
                    .onAppear{
                        Timer.scheduledTimer(withTimeInterval: 3.5, repeats: true) { (timer) in
                            self.location += 1

                        }
                    }
                }

              
            }
        }
    }

}


struct caruselContentView_Previews: PreviewProvider {
    static var previews: some View {
        caruselContentView( products: [])
    }
}
