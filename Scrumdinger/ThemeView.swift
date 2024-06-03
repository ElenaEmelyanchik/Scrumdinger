//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Elena Vasilenko on 03/06/2024.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    var body: some View {
        Text(theme.name).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(theme.mainColor).foregroundColor(theme.accentColor).clipShape(RoundedRectangle(cornerRadius: 4.0)).padding(4.0)
    }
}

#Preview {
    ThemeView(theme: .buttercup)
}
