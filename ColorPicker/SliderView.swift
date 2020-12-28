//
//  SliderView.swift
//  ColorPicker
//
//  Created by RUPAM LAHA on 28/12/20.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var value: Double
    
    var color: Color
    var sliderName: String
    
    var body: some View {
        
        VStack{
            
            Text(sliderName)
                .padding(.bottom, 0)
                .padding(.top, 10)
                .padding(.leading, 25)
                .padding(.trailing, 10)
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                .foregroundColor(color)
            
            Slider(value: $value, in: 0...255, step: 1.0, minimumValueLabel: Text("0"), maximumValueLabel: Text("255")) {
                Text("Red")
            }
            .padding(.top, 0)
            .padding(.bottom, 10)
            .padding(.leading, 15)
            .padding(.trailing, 15)
            .foregroundColor(color)
            Text(String(format: "%.f", value))
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: Binding.constant(20.0), color: .red, sliderName: "Red")
    }
}
