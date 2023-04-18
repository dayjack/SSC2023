//
//  File.swift
//  
//
//  Created by ChoiYujin on 2023/04/15.
//

import Foundation

// MARK: - extenstion
extension ContentView {
    func timeString(date: Date) -> String {
        let time = timeFormat.string(from: date)
        return time
    }
    
    func earthInfo() -> String {
        var info = ""
        
        let timeStamp0000 = Calendar.current.date(bySettingHour: 0, minute: 00, second: 00, of: date)!
        let timeStamp0430 = Calendar.current.date(bySettingHour: 4, minute: 30, second: 00, of: date)!
        let timeStamp0530 = Calendar.current.date(bySettingHour: 5, minute: 30, second: 00, of: date)!
        let timeStamp0800 = Calendar.current.date(bySettingHour: 8, minute: 00, second: 00, of: date)!
        let timeStamp1100 = Calendar.current.date(bySettingHour: 11, minute: 00, second: 00, of: date)!
        let timeStamp1135 = Calendar.current.date(bySettingHour: 11, minute: 35, second: 00, of: date)!
        let timeStamp1200 = Calendar.current.date(bySettingHour: 12, minute: 00, second: 00, of: date)!
        let timeStamp1300 = Calendar.current.date(bySettingHour: 13, minute: 00, second: 00, of: date)!
        let timeStamp1500 = Calendar.current.date(bySettingHour: 15, minute: 00, second: 00, of: date)!
        let timeStamp1945 = Calendar.current.date(bySettingHour: 19, minute: 45, second: 00, of: date)!
        let timeStamp1955 = Calendar.current.date(bySettingHour: 19, minute: 55, second: 00, of: date)!
        let timeStamp2000 = Calendar.current.date(bySettingHour: 20, minute: 00, second: 00, of: date)!
        let timeStamp2030 = Calendar.current.date(bySettingHour: 20, minute: 30, second: 00, of: date)!
        let timeStamp2045 = Calendar.current.date(bySettingHour: 20, minute: 45, second: 00, of: date)!
        let timeStamp2110 = Calendar.current.date(bySettingHour: 21, minute: 10, second: 00, of: date)!
        let timeStamp2141 = Calendar.current.date(bySettingHour: 21, minute: 41, second: 00, of: date)!
        let timeStamp2210 = Calendar.current.date(bySettingHour: 22, minute: 10, second: 00, of: date)!
        let timeStamp2212 = Calendar.current.date(bySettingHour: 22, minute: 12, second: 00, of: date)!
        let timeStamp2225 = Calendar.current.date(bySettingHour: 22, minute: 25, second: 00, of: date)!
        let timeStamp2230 = Calendar.current.date(bySettingHour: 22, minute: 30, second: 00, of: date)!
        let timeStamp2234 = Calendar.current.date(bySettingHour: 22, minute: 34, second: 00, of: date)!
        let timeStamp2245 = Calendar.current.date(bySettingHour: 22, minute: 45, second: 00, of: date)!
        let timeStamp2300 = Calendar.current.date(bySettingHour: 23, minute: 00, second: 00, of: date)!
        let timeStamp2317 = Calendar.current.date(bySettingHour: 23, minute: 17, second: 00, of: date)!
        let timeStamp2326 = Calendar.current.date(bySettingHour: 23, minute: 26, second: 00, of: date)!
        let timeStamp2358 = Calendar.current.date(bySettingHour: 23, minute: 58, second: 00, of: date)!
        let timeStamp235923 = Calendar.current.date(bySettingHour: 23, minute: 59, second: 23, of: date)!
        let timeStamp235957 = Calendar.current.date(bySettingHour: 23, minute: 59, second: 57, of: date)!
        let timeStamp235959 = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: date)!
        
        if ((date >= timeStamp0000) && (timeStamp0430 >= date)) {
            info = "Nothing particularly noteworthy is happening. The Earth and its atmosphere are still in the process of being formed."
        } else if ((date > timeStamp0430) && (timeStamp0530 > date)) {
            info = "There's nothing special happening right now, but who knows what might happen at 5:30."
        } else if ((date >= timeStamp0530) && (timeStamp0800 > date)) {
            info = "The first unicellular organisms are evolving in the ocean."
        } else if ((date >= timeStamp0800) && (timeStamp1100 > date)) {
            info = "The first virus has appeared on Earth for the first time!!"
        } else if ((date >= timeStamp1100) && (timeStamp1135 > date)) {
            info = "The photosynthetic bacteria are absorbing solar energy!\nAnd they are filling the atmosphere with oxygen!"
        } else if ((date >= timeStamp1135) && (timeStamp1200 > date)) {
            info = "At 11:35, a snowstorm started. Don't worry, it will soon get warmer!"
        } else if ((date >= timeStamp1200) && (timeStamp1300 > date)) {
            info = "I am waiting for something special to happen!! What will happen at 1 PM??"
        } else if ((date >= timeStamp1300) && (timeStamp1500 > date)) {
            info = "Special cells with internal organs have started to be born!"
        } else if ((date >= timeStamp1500) && (timeStamp1945 > date)) {
            info = "The cells are dividing into three groups!\nThey will become spores, plants, and animals!"
        } else if ((date >= timeStamp1945) && (timeStamp1955 > date)) {
            info = "An organism called Placozoa, which is very small, was born!\nThis friend is the common ancestor of all animals!"
        } else if ((date >= timeStamp1955) && (timeStamp2000 > date)) {
            info = "The Earth has experienced another period of freezing."
        } else if ((date >= timeStamp2000) && (timeStamp2030 > date)) {
            info = "The first jellyfish appeared! It's the earliest known animal on Earth."
        } else if ((date >= timeStamp2030) && (timeStamp2045 > date)) {
            info = "The ozone layer has appeared!!"
        } else if ((date >= timeStamp2045) && (timeStamp2110 > date)) {
            info = "The number of marine organisms has increased!"
        } else if ((date >= timeStamp2110) && (timeStamp2141 > date)) {
            info = "The sea creatures have started to come out of the water, as if they were getting tired of being confined in the ocean."
        } else if ((date >= timeStamp2141) && (timeStamp2210 > date)) {
            info = "There are more and more insects appearing!"
        } else if ((date >= timeStamp2210) && (timeStamp2212 > date)) {
            info = "Tetrapods have divided into Sauropsids and Synapsids!"
        } else if ((date >= timeStamp2212) && (timeStamp2225 > date)) {
            info = "A giant sail-backed creature called Dimetrodon has appeared!"
        } else if ((date >= timeStamp2225) && (timeStamp2230 > date)) {
            info = "Sail-backed creatures are disappearing and Therapsid are emerging."
        } else if ((date >= timeStamp2230) && (timeStamp2234 > date)) {
            info = "All life disappeared and it was difficult to see any animals. Only 5% of species survived in the mass extinction!"
        }  else if ((date >= timeStamp2234) && (timeStamp2245 > date)) {
            info = "Finally, the dinosaurs have appeared!"
        } else if ((date >= timeStamp2245) && (timeStamp2300 > date)) {
            info = "Another mass extinction occurred, but the dinosaurs survived!"
        } else if ((date >= timeStamp2300) && (timeStamp2317 > date)) {
            info = "The first bird has appeared!"
        } else if ((date >= timeStamp2317) && (timeStamp2326 > date)) {
            info = "This is the time when dinosaurs appear at their largest size!"
        } else if ((date >= timeStamp2326) && (timeStamp2358 > date)) {
            info = "The dinosaurs disappeared due to the impact of a meteorite collision!"
        } else if ((date >= timeStamp2358) && (timeStamp235923 > date)) {
            info = "Chimpanzees and monkeys have appeared!"
        } else if ((date >= timeStamp235923) && (timeStamp235957 > date)) {
            info = "Anatomically modern humans appeared, but they didn't have language and couldn't make tools yet."
        }  else if ((date >= timeStamp235957) && (timeStamp235959 > date)) {
            info = "It's a time when people with language and tool-making abilities appeared!"
        }
        return info
    }
}
