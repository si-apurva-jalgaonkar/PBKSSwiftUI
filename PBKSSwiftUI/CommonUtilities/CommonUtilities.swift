//
//  CommonUtilities.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 25/06/24.
//

import Foundation

func formatDateString(_ dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    if let date = dateFormatter.date(from: dateString) {
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: date)
    }
    return dateString
}

func constructImageURL(baseURL: String, imagePath: String, imageName: String) -> String {
    let updatedURL = baseURL.replacingOccurrences(of: "{image_path}", with: imagePath)
        .replacingOccurrences(of: "{image_name}", with: imageName)
    return updatedURL
}

func constructDetailURL(baseDetailURL: String, titleAlias: String) -> String{
    let updatedURL = baseDetailURL.replacingOccurrences(of: "{title_alias}", with: titleAlias)
    return updatedURL
}

//var secondsToHoursMinutesSecondsStr : String {
//    let (hours, minutes, seconds) = secondsToHoursMinutesSeconds(seconds: Int(self) ?? 0);
//    var str = hours > 0 ? "\(getStringFromSeconds(seconds: hours)):" : ""
//    str = minutes > 0 ? str + "\(getStringFromSeconds(seconds: minutes)):" : str
//    str = (str == .blank) ? "0:" : str
//    str = seconds > 0 ? str + "\(getStringFromSeconds(seconds: seconds))" : "\(str)00"
//    return str
//}
//
//fileprivate func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
//    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
//}
//
//fileprivate func getStringFromSeconds(seconds: Int) -> String {
//    return seconds < 10 ? "0\(seconds)" : "\(seconds)"
//}
