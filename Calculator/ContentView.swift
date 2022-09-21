//
//  ContentView.swift
//  Calculator
//
//  Created by Thomas Korsnes on 09/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    let symbols = ["C", "+/-", "%", "/", "7", "8", "9", "x", "4", "5", "6", "-", "1", "2", "3", "+", "0", ",", "="]
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("0,135")
                    .font(.system(size: 60))
                    .foregroundColor(.white)
            }
            
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()]) {
                ForEach(symbols[0..<symbols.count], id: \.self ) { symbol in
                    if symbol == "C" || symbol == "+/-" || symbol == "%" {
                        ButtonView(symbol: symbol, symbolColor: Color.black, circleColor: Color.gray)
                    } else if symbol == "/" || symbol == "x" || symbol == "-" || symbol == "+" || symbol == "=" {
                        ButtonView(symbol: symbol, symbolColor: Color.white, circleColor: Color.orange)
                    } else {
                        ButtonView(symbol: symbol, symbolColor: Color.white, circleColor: Color(UIColor.darkGray))
                    }
                }
            }
        }
        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonView: View {
    let symbol: String
    let symbolColor: Color
    let circleColor: Color
    
    var body: some View {
        ZStack {
            if symbol == "0" {
                Capsule()
                    .frame(width: 140, height: 70)
                    .foregroundColor(circleColor)
            } else {
                Circle()
                    .frame(width: 70.0, height: 70.0, alignment: .center)
                    .foregroundColor(circleColor)
            }
            Text(symbol)
                .foregroundColor(symbolColor)
                .font(.title)
                .bold()
            
        }
    }
}

