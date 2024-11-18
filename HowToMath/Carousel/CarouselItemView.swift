//
//  CarouselItemView.swift
//  HowToMath
//
//  Created by user269369 on 11/18/24.
//

import SwiftUI

struct CarouselItemView: View {
    let banner: ServiceType
    var body: some View {
        Image(banner.imagem).resizable().scaledToFit().cornerRadius(20)
    }
}

#Preview {
    CarouselItemView(banner: ServiceType(id: 1, nome:"", imagem:"kid1"))
}
