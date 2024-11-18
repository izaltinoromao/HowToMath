//
//  FeatureType.swift
//  HowToMath
//
//  Created by user269369 on 11/18/24.
//

import SwiftUI

struct FeatureType: View {
    let service : ServiceType
    var body: some View {
        VStack{
            Image(service.imagem).resizable().scaledToFit().cornerRadius(20).fixedSize(horizontal: false, vertical: true)
            Text(service.nome)
        }.frame(width: 80, height: 80)
    }
}

#Preview {
    FeatureType(service: ServiceType(id: 1, nome: "Adicao", imagem: "adicao"))
}
