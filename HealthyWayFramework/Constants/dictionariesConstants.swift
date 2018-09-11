//
//  dictionariesConstants.swift
//  HealthyWayFramework
//
//  Created by Bill Weatherwax on 9/3/18.
//  Copyright © 2018 waxcruz. All rights reserved.
//

import Foundation
public enum KeysForFirebase {
    //MARK: - Firebase NONSQL Segment Names
    public static let NODE_JOURNAL = "Journal"
    public static let NODE_MEAL_CONTENTS = "MealContents"
    public static let NODE_SETTINGS = "Settings"
    //MARK: - Settings fields
    public static let LIMIT_FAT = "LIMIT_FAT"
    public static let LIMIT_FRUIT = "LIMIT_FRUIT"
    public static let LIMIT_PROTEIN_LOW = "LIMIT_PROTEIN_LOW"
    public static let LIMIT_PROTEIN_HIGH = "LIMIT_PROTEIN_HIGH"
    public static let LIMIT_STARCH = "LIMIT_STARCH"
    public static let LIMIT_VEGGIES = "LIMIT_VEGGIES"
    //MARK: - Stats fields
    public static let GLASSES_OF_WATER = "GLASSES_OF_WATER"
    public static let EXERCISED = "EXERCISED"
    public static let SUPPLEMENTS = "SUPPLEMENTS"
    public static let NOTES = "NOTES"
    public static let WEIGHED = "WEIGHED"
    //MARK: - Consume fields
    public static let MEAL_DESCRIPTION = "MEAL_DESCRIPTION"
    public static let BREAKFAST_MEAL_KEY = "Breakfast"
    public static let MORNING_SNACK_MEAL_KEY = "Morning Snack"
    public static let LUNCH_MEAL_KEY = "Lunch"
    public static let AFTERNOON_SNACK_MEAL_KEY = "Afternoon Snack"
    public static let DINNER_MEAL_KEY = "Dinner"
    public static let EVENING_SNACK_MEAL_KEY = "Evening Snack"
    public static let MEAL_COMMENTS = "MEAL_COMMENTS"
    //MARK: - MealContents fields
    public static let MEAL_PROTEIN_QUANTITY = "MEAL_PROTEIN_QUANTITY"
    public static let MEAL_FAT_QUANTITY = "MEAL_FAT_QUANTITY"
    public static let MEAL_STARCH_QUANTITY = "MEAL_STARCH_QUANTITY"
    public static let MEAL_FRUIT_QUANTITY = "MEAL_FRUIT_QUANTITY"
    public static let MEAL_VEGGIES_QUANTITY = "MEAL_VEGGIES_QUANTITY"
}

public enum FirebaseHandleIdentifiers : Int {
    case settings = 0
    case journal
    case mealContents
}


public enum FoodComponent {
    case protein
    case fat
    case starch
    case fruit
    case veggies
    case free
}

public enum MealDataEntryNumbers : Int {
    case firstPlaceholder = 0
    case numberForWeight
    case numberForWater
    case numberForExercise
    case numberForProteinLow
    case numberForFat
    case numberForStarch
    case numberForFruit
    case numberForVeggies
    case lastPlaceHolder
}

public enum SettingsDataEntryNumbers : Int {
    case firstPlaceholder = 0
    case numberForProteinLow
    case numberForFat
    case numberForStarch
    case numberForFruit
    case numberForProteinHigh
    case lastPlaceHolder
}
public enum MealTotalColumns : Int {
    case first = 0
    case columnProtein
    case columnFat
    case columnStarch
    case columnFruit
    case columnVeggies
    case last
}
public enum Meal{
    case breakfast
    case morningSnack
    case lunch
    case afternoonSnack
    case dinner
    case eveningSnack
}

public enum ConstantsHTML {
    public static let LANDSCAPE = " (easier to read in landscape mode) "
    public static let JOURNAL_DAY_HEADER = """
            <!DOCTYPE html>
            <html>
            <head>
            <style>
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
            }
            </style>
            </head>
            <div style="overflow-x:auto;">
            </head>
            <body>
            <h2>Journal</h2>
            <h3>HW_EMAIL_INSTRUCTION</h3>
            """
    public static let JOURNAL_DAILY_TOTALS_ROW = """
            <p>HW_RECORDED_DATE</p>
            <table style="font-size:10px;">
                <col width="17%">
                <col width="30%">
                <col width="7%">
                <col width="7%">
                <col width="7%">
                <col width="7%">
                <col width="7%">
                <col width="1    let journalDetails = node[date] as? [String : Any?] ?? [:]8%">
              <tr>
                <th>Meal</th>
                <th>Food eaten</th>
                <th>P</th>
                <th>S</th>
                <th>V</th>
                <th>Fr</th>
                <th>F</th>
                <th>Feelings/Comments</th>
              </tr>
              <tr>
                <td>Daily Totals</td>
                <td> </td>
                <td>HW_DAILY_TOTAL_PROTEIN_VALUE</td>
                <td>HW_DAILY_TOTAL_STARCH_VALUE</td>
                <td>HW_DAILY_TOTAL_VEGGIES_VALUE</td>
                <td>HW_DAILY_TOTAL_FRUIT_VALUE</td>
                <td>HW_DAILY_TOTAL_FAT_VALUE</td>
                <td> </td>
              </tr>
            """
    public static let JOURNAL_MEAL_ROW = """
              <tr>
                <td>HW_MEAL_NAME</td>
                <td>HW_MEAL_CONTENTS_DESCRIPTION</td>
                <td>HW_MEAL_PROTEIN_COUNT</td>
                <td>HW_MEAL_STARCH_COUNT</td>
                <td>HW_MEAL_VEGGIES_COUNT</td>
                <td>HW_MEAL_FRUIT_COUNT</td>
                <td>HW_MEAL_FAT_COUNT</td>
                <td>HW_MEAL_COMMENTS</td>
              </tr>
            """
    public static let JOURNAL_DATE_TOTALS = """
                <td>Totals</td>
                <td> </td>
                <td>HW_DATE_TOTAL_PROTEIN</td>
                <td><font color="HW_TOTAL_STARCH_COLOR">HW_DATE_TOTAL_STARCH</font></td>
                <td>HW_DATE_TOTAL_VEGGIES</td>
                <td><font color="HW_TOTAL_FRUIT_COLOR">HW_DATE_TOTAL_FRUIT</font></td>
                <td><font color="HW_TOTAL_FAT_COLOR">HW_DATE_TOTAL_FAT</font></td>
                <td> </td>
              </tr>
            </table>
            """
    public static let JOURNAL_DATE_STATS = """
            <font size="1">     Water: HW_DATE_WATER_CHECKS Supplements: HW_DATE_SUPPLEMENTS_CHECKS Exercise: HW_DATE_EXERCISE_CHECKS</font>
            <p>
            """
    public static let JOURNAL_DATE_COMMENTS = """
            <font size="1">HW_COMMENTS</font>
            """
    public static let JOURNAL_DATE_TRAILER = """
            </p>
            </div>
            </body>
            </html>
            """
    
}
