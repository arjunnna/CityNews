//
//  DateUtilities.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import Foundation

/// This Class is used for the Date Utilities
class DateUtilities {

    /// This Method is used to Format the Article Published Date
    static func formatDate(_ dateString: String) -> String {
        var resultString = ""
        let dateFormatter = DateFormatter()
          dateFormatter.locale = Locale(identifier: "en_US_POSIX")
          dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from:dateString) {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            resultString = dateFormatter.string(from: date)
        }
        return resultString
    }

    /// This Method is to fetch the Articles from Date
    static func getDateToFetchRecords(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let fromDate = Calendar.current.date(byAdding: .day, value: -15, to: date) {
            return dateFormatter.string(from: fromDate)
        } else {
            return ""
        }
    }
}
