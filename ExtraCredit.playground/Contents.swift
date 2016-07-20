import UIKit

func isLeap(year: Int) -> Bool{
  return year % 4 == 0 && year % 100 != 0 || year % 400 == 0
}

let normalYear = [(31, 1), (28, 2), (31, 3), (30, 4), (31, 5), (30, 6), (31, 7), (31, 8), (30, 9), (31, 10), (30, 11), (31, 12)]
let leapYear = [(31, 1), (29, 2), (31, 3), (30, 4), (31, 5), (30, 6), (31, 7), (31, 8), (30, 9), (31, 10), (30, 11), (31, 12)]

func julianDate(year: Int, month: Int, day: Int) -> Int{
    let daysCurrentYear = isLeap(year) ? leapYear.filter{$0.1 < month}.reduce(0) {$0 + $1.0} : normalYear.filter{$0.1 < month}.reduce(0) {$0 + $1.0}
    let leapYearDays = year != 1900 ? [Int](1900...year - 1).filter{isLeap($0)}.count : [Int](1900...year).filter{isLeap($0)}.count
    return (year - 1900) * 365 + daysCurrentYear + leapYearDays + day
}

julianDate(1960, month:  9, day: 28)
julianDate(1900, month:  1, day: 1)
julianDate(1900, month: 12, day: 31)
julianDate(1901, month: 1, day: 1)
julianDate(1901, month: 1, day: 1) - julianDate(1900, month: 1, day: 1)
julianDate(2001, month: 1, day: 1) - julianDate(2000, month: 1, day: 1)

isLeap(1960)
isLeap(1900)
isLeap(2000)
