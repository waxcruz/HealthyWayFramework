//
//  buildJournal.swift
//  HealthyWayFramework
//
//  Created by Bill Weatherwax on 9/3/18.
//  Copyright © 2018 waxcruz. All rights reserved.
//

import Foundation

func buildJournalHeader(isEmail : Bool) -> String {
    var template = ConstantsHTML.JOURNAL_DAY_HEADER
    var message = ""
    if isEmail {
        message = ConstantsHTML.LANDSCAPE
    }
    template = template.replacingOccurrences(of: "HW_EMAIL_INSTRUCTION", with: message)

    return template
}
func buildJournalDailyTotalsRow(dateOfMealString displaydate : String, settingsNode node : [String : Any?], dailyTotals maxTotals : inout [Double]) -> String {
    var template = ConstantsHTML.JOURNAL_DAILY_TOTALS_ROW
    template = template.replacingOccurrences(of: "HW_RECORDED_DATE", with: displaydate)
    var amount = node["LIMIT_PROTEIN_LOW"] as? Double ?? 0.0
    maxTotals[0] = amount
    template = template.replacingOccurrences(of: "HW_DAILY_TOTAL_PROTEIN_VALUE", with: String(amount))
    amount = node["LIMIT_STARCH"] as? Double ?? 0.0
    maxTotals[1] = amount
    template = template.replacingOccurrences(of: "HW_DAILY_TOTAL_STARCH_VALUE", with: String(amount))
    amount = 3.0
    maxTotals[2] = amount
    template = template.replacingOccurrences(of: "HW_DAILY_TOTAL_VEGGIES_VALUE", with: "3.0")
    amount = node["LIMIT_FRUIT"] as? Double ?? 0.0
    maxTotals[3] = amount
    template = template.replacingOccurrences(of: "HW_DAILY_TOTAL_FRUIT_VALUE", with: String(amount))
    amount = node["LIMIT_FAT"] as? Double ?? 0.0
    maxTotals[4] = amount
    template = template.replacingOccurrences(of: "HW_DAILY_TOTAL_FAT_VALUE", with: String(amount))
    return template
}
func buildJournalMealRow(mealName name : String, mealDictionary meal : [String : Any?], actualTotals totals : inout [Double]) -> String {
    var template = ConstantsHTML.JOURNAL_MEAL_ROW
    var amount = 0.0
    template = template.replacingOccurrences(of: "HW_MEAL_NAME", with: name)
    template = template.replacingOccurrences(of: "HW_MEAL_CONTENTS_DESCRIPTION", with: meal[KeysForFirebase.MEAL_DESCRIPTION] as? String ?? "")
    amount = meal[KeysForFirebase.MEAL_PROTEIN_QUANTITY] as? Double ?? 0.0
    totals[0] += amount
    template = template.replacingOccurrences(of: "HW_MEAL_PROTEIN_COUNT", with: String(amount))
    amount = meal[KeysForFirebase.MEAL_STARCH_QUANTITY] as? Double ?? 0.0
    totals[1] += amount
    template = template.replacingOccurrences(of: "HW_MEAL_STARCH_COUNT", with: String(amount))
    amount = meal[KeysForFirebase.MEAL_VEGGIES_QUANTITY] as? Double ?? 0.0
    totals[2] += amount
    template = template.replacingOccurrences(of: "HW_MEAL_VEGGIES_COUNT", with: String(amount))
    amount = meal[KeysForFirebase.MEAL_FRUIT_QUANTITY] as? Double ?? 0.0
    totals[3] += amount
    template = template.replacingOccurrences(of: "HW_MEAL_FRUIT_COUNT", with: String(amount))
    amount = meal[KeysForFirebase.MEAL_FAT_QUANTITY] as? Double ?? 0.0
    totals[4] += amount
    template = template.replacingOccurrences(of: "HW_MEAL_FAT_COUNT", with: String(amount))
    template = template.replacingOccurrences(of: "HW_MEAL_COMMENTS", with: meal[KeysForFirebase.MEAL_COMMENTS] as? String ?? "")
    return template
    
}
func buildJournalDateTotals(dailyTotals maxTotals : [Double], dayTotals totals : [Double]) -> String {
    var template = ConstantsHTML.JOURNAL_DATE_TOTALS

    template = template.replacingOccurrences(of: "HW_DATE_TOTAL_PROTEIN", with: String(totals[0]))
    template = template.replacingOccurrences(of: "HW_DATE_TOTAL_STARCH", with: String(totals[1]))
    if maxTotals[1] < totals[1] {
        template = template.replacingOccurrences(of: "HW_TOTAL_STARCH_COLOR", with: "red")
    } else {
        template = template.replacingOccurrences(of: "HW_TOTAL_STARCH_COLOR", with: "black")
    }
    template = template.replacingOccurrences(of: "HW_DATE_TOTAL_VEGGIES", with: String(totals[2]))
    template = template.replacingOccurrences(of: "HW_DATE_TOTAL_FRUIT", with: String(totals[3]))
    if maxTotals[3] < totals[3] {
        template = template.replacingOccurrences(of: "HW_TOTAL_FRUIT_COLOR", with: "red")
    } else {
        template = template.replacingOccurrences(of: "HW_TOTAL_FRUIT_COLOR", with: "black")
    }
    template = template.replacingOccurrences(of: "HW_DATE_TOTAL_FAT", with: String(totals[4]))
    if maxTotals[4] < totals[4] {
        template = template.replacingOccurrences(of: "HW_TOTAL_FAT_COLOR", with: "red")
    } else {
        template = template.replacingOccurrences(of: "HW_TOTAL_FAT_COLOR", with: "black")
    }
    return template
    
}
func buildJournalDateStats(journalDateString date : String, journalNode node : [String : Any?]) -> String {
    var template = ConstantsHTML.JOURNAL_DATE_STATS
    let journalDetails = node[date] as? [String : Any?] ?? [:]
    template = template.replacingOccurrences(of: "HW_DATE_WATER_CHECKS", with: String(repeating: "✔︎", count: journalDetails[KeysForFirebase.GLASSES_OF_WATER] as? Int ?? 0))
    template = template.replacingOccurrences(of: "HW_DATE_SUPPLEMENTS_CHECKS", with: String(repeating: "✔︎", count: journalDetails[KeysForFirebase.SUPPLEMENTS] as? Int ?? 0))
    let exerciseMinutes = journalDetails[KeysForFirebase.EXERCISED] as? Int ?? 0
    if exerciseMinutes > 0 {
        template = template.replacingOccurrences(of: "HW_DATE_EXERCISE_CHECKS", with: "✔︎")
    } else {
        template = template.replacingOccurrences(of: "HW_DATE_EXERCISE_CHECKS", with: " ")
    }
    return template
}

func buildJournalDateComments(journalDateString date : String, journalNode node : [String : Any?]) -> String {
    var template = ConstantsHTML.JOURNAL_DATE_COMMENTS
    let journalDetails = node[date] as? [String : Any?] ?? [:]
    template = template.replacingOccurrences(of: "HW_COMMENTS", with: journalDetails[KeysForFirebase.NOTES] as? String ?? "")
    return template
}
func buildJournalDateTrailer() -> String {
    let template = ConstantsHTML.JOURNAL_DATE_TRAILER
    return template
}

// MARK - helper methods

public func formatJournal(clientNode node : [String : Any?], isEmail : Bool) -> String? {
    // client Firebase node with 3 child nodes: Settings, Journal, and MealContents
    guard node.count > 0 else {
        return nil
    }
    let nodeSettings = node[KeysForFirebase.NODE_SETTINGS] as? [String: Any?]
    let nodeJournal = node[KeysForFirebase.NODE_JOURNAL] as? [String: Any?]
    let nodeMealContents = node[KeysForFirebase.NODE_MEAL_CONTENTS] as? [String : Any?]
    var journalMockup = buildJournalHeader(isEmail: isEmail)
    var dailyTotals = Array(repeatElement(0.0, count: 5)) // Daily Totals
    if nodeJournal == nil {
        return nil
    }
    let sortedKeysDates = Array(nodeJournal!.keys).sorted(by: >)
    for mealDate in sortedKeysDates {
        var dateTotals = Array(repeatElement(0.0, count: 5))
        let mealDateAsDate = makeDateFromString(dateAsString: mealDate)
        journalMockup += buildJournalDailyTotalsRow(dateOfMealString: mealDateAsDate.makeShortDisplayStringDate(), settingsNode: nodeSettings ?? [:], dailyTotals: &dailyTotals)
        if let meal = nodeMealContents![mealDate] as? [String : Any?] {
            if let breakfast = meal[KeysForFirebase.BREAKFAST_MEAL_KEY] as? [String : Any?] {
                journalMockup += buildJournalMealRow(mealName : KeysForFirebase.BREAKFAST_MEAL_KEY, mealDictionary: breakfast, actualTotals: &dateTotals)
            }
            if let morningSnack = meal[KeysForFirebase.MORNING_SNACK_MEAL_KEY] as? [String : Any?] {
                journalMockup += buildJournalMealRow(mealName : KeysForFirebase.MORNING_SNACK_MEAL_KEY, mealDictionary: morningSnack, actualTotals: &dateTotals)
            }
            if let lunch = meal[KeysForFirebase.LUNCH_MEAL_KEY] as? [String : Any?] {
                journalMockup += buildJournalMealRow(mealName : KeysForFirebase.LUNCH_MEAL_KEY, mealDictionary: lunch, actualTotals: &dateTotals)
            }
            if let afternoonSnack = meal[KeysForFirebase.AFTERNOON_SNACK_MEAL_KEY] as? [String : Any?] {
                journalMockup += buildJournalMealRow(mealName : KeysForFirebase.AFTERNOON_SNACK_MEAL_KEY, mealDictionary: afternoonSnack, actualTotals: &dateTotals)
            }
            if let dinner = meal[KeysForFirebase.DINNER_MEAL_KEY] as? [String : Any?] {
                journalMockup += buildJournalMealRow(mealName : KeysForFirebase.DINNER_MEAL_KEY, mealDictionary: dinner, actualTotals: &dateTotals)
            }
            if let eveningSnack = meal[KeysForFirebase.EVENING_SNACK_MEAL_KEY] as? [String : Any?] {
                journalMockup += buildJournalMealRow(mealName : KeysForFirebase.EVENING_SNACK_MEAL_KEY, mealDictionary: eveningSnack, actualTotals: &dateTotals)
            }
            journalMockup += buildJournalDateTotals(dailyTotals: dailyTotals, dayTotals: dateTotals)
            journalMockup += buildJournalDateStats(journalDateString: mealDate,
                journalNode: nodeJournal!)
            journalMockup += buildJournalDateComments(journalDateString: mealDate, journalNode: nodeJournal!)
        }
        journalMockup += buildJournalDateTrailer()
    }
    return journalMockup
}

