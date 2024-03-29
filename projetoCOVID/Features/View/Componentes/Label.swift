//
//  Label.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 13/01/23.
//

import SwiftUI

struct OKTitleLabel: View 
{
    var title: String
    var fontSize: CGFloat
    var fontWeight: Font.Weight
    
    var body: some View 
    {
        Text(title)
            .font(.system(size: fontSize, weight: fontWeight, design: .serif))
            .shadow(color: .secondary, radius: 0.5, x: 0.3, y: 0.3)
    }
}
