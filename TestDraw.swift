//
//  TestDraw.swift
//  Landmarks
//
//  Created by Vlad Lotysh on 06.12.2021.
//

import SwiftUI

struct TestDraw: View {
    var body: some View {Path { path in
        path.move(to: CGPoint(x: 20, y: 0))
        path.addLine(to: CGPoint(x: 20, y: 200))
        path.addLine(to: CGPoint(x: 220, y: 200))
        path.addLine(to: CGPoint(x: 220, y: 0))
     }
     .fill(
        .linearGradient(
            Gradient(colors: [.green, .blue]),
            startPoint: .init(x: 0.5, y: 0),
            endPoint: .init(x: 0.5, y: 0.5)
        )
     )
    }
}

struct TestDraw_Previews: PreviewProvider {
    static var previews: some View {
        TestDraw()
    }
}
