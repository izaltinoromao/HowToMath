//
//  CarouselTabView.swift
//  HowToMath
//
//  Created by user269369 on 11/18/24.
//

import SwiftUI

struct CarouselTabView: View {
    let bannerList: [ServiceType] = [
        ServiceType(id: 1, nome:"", imagem:"kid1"),
        ServiceType(id: 2, nome:"", imagem:"kid2")
    ]
    var body: some View {
        TabView{
            ForEach(bannerList){banner in
                CarouselItemView(banner: banner)}
        }.frame(width: 300).tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    CarouselTabView()
}
