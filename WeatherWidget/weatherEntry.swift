//
//  weatherEntry.swift
//  WeatherWidgetExtension
//
//  Created by Utku Tarhan on 11/27/20.
//  Copyright © 2020 Utku Tarhan. All rights reserved.
//

import Foundation
import WidgetKit

struct WeatherEntry: TimelineEntry {
    public let date: Date
    public let weatherInfo: [Weather]
     
    var relevance: TimelineEntryRelevance? {
        return TimelineEntryRelevance(score: 50)
    }
}
