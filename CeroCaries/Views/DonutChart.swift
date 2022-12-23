//
//  DonutChart.swift
//  CeroCaries
//
//  Created by Alex Barreto on 20/12/22.
//  Copyright © 2022 Grupo Carso. All rights reserved.
//

import SwiftUI

//MARK:- Donut Graph
struct DonutChart : View {
    @State var indexOfTappedSlice = 0
    
    let chartData: [ChartData]
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.5), lineWidth: 10)
            
            VStack {
                ZStack {
                    ForEach(0..<chartData.count) { index in
                        Circle()
                            .trim(from: index == 0 ? 0.0 : chartData[index-1].value/100,
                                  to: chartData[index].value/100)
                            .stroke(chartData[index].color,lineWidth: 50)
//                            .onTapGesture {
//                                indexOfTappedSlice = indexOfTappedSlice == index ? -1 : index
//                            }
//                            .scaleEffect(index == indexOfTappedSlice ? 1.1 : 1.0)
                            .rotationEffect(.degrees(-90))
                            .animation(.spring())
                    }
//                    if indexOfTappedSlice != -1 {
                        Text("\(chartData[indexOfTappedSlice].total)%")
                            .font(Font(AppFonts.percentText))
//                    }
                }
                .frame(width: widthScreen * 0.3, height: widthScreen * 0.3)
                .padding()
            }
            
            Circle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: widthScreen * 0.18, height: widthScreen * 0.18)
        }
        .frame(width: widthScreen * 0.5, height: widthScreen * 0.5)
    }
}

struct DonutChart_Previews: PreviewProvider {
    static var previews: some View {
        DonutChart(chartData: [ChartData(color: Color("ChartGreenColor"), percent: 33, value: 33, total: 33)])
    }
}
