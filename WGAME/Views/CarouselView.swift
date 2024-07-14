//
//  CarouselView.swift
//  WGAME
//
//  Created by Maged on 13/07/2024.
//

import SwiftUI

struct CarouselView: View {

    @GestureState private var dragState = DragState.inactive
    @Binding var carouselLocation : Int

    var itemHeight:CGFloat
//    var views:[AnyView]
    var products:[ProductElement]

    private func onDragEnded(drag: DragGesture.Value) {
        let dragThreshold:CGFloat = 200
        if drag.predictedEndTranslation.width > dragThreshold || drag.translation.width > dragThreshold{
            carouselLocation =  carouselLocation - 1
        } else if (drag.predictedEndTranslation.width) < (-1 * dragThreshold) || (drag.translation.width) < (-1 * dragThreshold)
        {
            carouselLocation =  carouselLocation + 1
        }
    }



    var body: some View {
        ZStack{
            VStack{

                ZStack{
                    ForEach(0..<products.count){i in
                        VStack{
                            Spacer()
                            slideView(product: products[i])

                                .frame(width:300, height: 200)
                                .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                                .background(Color.white)
                                .cornerRadius(10)
//                                .shadow(radius: 3)


                                .opacity(self.getOpacity(i))
                                .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                                .offset(x: self.getOffset(i))
                                .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                            Spacer()
                        }
                    }

                }.gesture(

                    DragGesture()
                        .updating($dragState) { drag, state, transaction in
                            state = .dragging(translation: drag.translation)
                    }
                    .onEnded(onDragEnded)

                )

                Spacer()
            }
           
        }
    }

    func relativeLoc() -> Int{
        return ((products.count * 10000) + carouselLocation) % products.count
    }

    func getHeight(_ i:Int) -> CGFloat{
        if i == relativeLoc(){
            return itemHeight
        } else {
            return itemHeight - 100
        }
    }


    func getOpacity(_ i:Int) -> Double{

        if i == relativeLoc()
            || i + 1 == relativeLoc()
            || i - 1 == relativeLoc()
            || i + 2 == relativeLoc()
            || i - 2 == relativeLoc()
            || (i + 1) - products.count == relativeLoc()
            || (i - 1) + products.count == relativeLoc()
            || (i + 2) - products.count == relativeLoc()
            || (i - 2) + products.count == relativeLoc()
        {
            return 1
        } else {
            return 0
        }
    }

    func getOffset(_ i:Int) -> CGFloat{

        //This sets up the central offset
        if (i) == relativeLoc()
        {
            //Set offset of cental
            return self.dragState.translation.width
        }
            //These set up the offset +/- 1
        else if
            (i) == relativeLoc() + 1
                ||
                (relativeLoc() == products.count - 1 && i == 0)
        {
            //Set offset +1
            return self.dragState.translation.width + (300 + 20)
        }
        else if
            (i) == relativeLoc() - 1
                ||
                (relativeLoc() == 0 && (i) == products.count - 1)
        {
            //Set offset -1
            return self.dragState.translation.width - (300 + 20)
        }
            //These set up the offset +/- 2
        else if
            (i) == relativeLoc() + 2
                ||
                (relativeLoc() == products.count-1 && i == 1)
                ||
                (relativeLoc() == products.count-2 && i == 0)
        {
            return self.dragState.translation.width + (2*(300 + 20))
        }
        else if
            (i) == relativeLoc() - 2
                ||
                (relativeLoc() == 1 && i == products.count-1)
                ||
                (relativeLoc() == 0 && i == products.count-2)
        {
            //Set offset -2
            return self.dragState.translation.width - (2*(300 + 20))
        }
            //These set up the offset +/- 3
        else if
            (i) == relativeLoc() + 3
                ||
                (relativeLoc() == products.count-1 && i == 2)
                ||
                (relativeLoc() == products.count-2 && i == 1)
                ||
                (relativeLoc() == products.count-3 && i == 0)
        {
            return self.dragState.translation.width + (3*(300 + 20))
        }
        else if
            (i) == relativeLoc() - 3
                ||
                (relativeLoc() == 2 && i == products.count-1)
                ||
                (relativeLoc() == 1 && i == products.count-2)
                ||
                (relativeLoc() == 0 && i == products.count-3)
        {
            //Set offset -2
            return self.dragState.translation.width - (3*(300 + 20))
        }
            //This is the remainder
        else {
            return 10000
        }
    }


}


struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
