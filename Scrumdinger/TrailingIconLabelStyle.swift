//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Elena Vasilenko on 29/05/2024.
//

import Foundation
import SwiftUI

struct TrailingIconLabelStyle: LabelStyle{
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.title
            configuration.icon
        }
    }
    
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self{Self()}
}
