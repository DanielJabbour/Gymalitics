//
//  LineChartFormatter.swift
//  GymApp
//
//  Created by Daniel Jabbour on 2018-08-30.
//  Copyright © 2018 Daniel Jabbour. All rights reserved.
//

import Foundation
import Charts

extension LineChartView {
    
    private class LineChartFormatter: NSObject, IAxisValueFormatter {
        
        var labels: [String] = []
        
        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            return labels[Int(value)]
        }
        
        init(labels: [String]) {
            super.init()
            self.labels = labels
        }
    
    }
    
    func setLineChartData(xValues: [String], yValues: [Double], label: String) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<yValues.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: yValues[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = LineChartDataSet(values: dataEntries, label: label)
        let chartData = LineChartData(dataSet: chartDataSet)
        
        let chartFormatter = LineChartFormatter(labels: xValues)
        let xAxis = XAxis()
        
        xAxis.valueFormatter = chartFormatter
        self.xAxis.valueFormatter = xAxis.valueFormatter
        
        self.data = chartData
    }
    
}
