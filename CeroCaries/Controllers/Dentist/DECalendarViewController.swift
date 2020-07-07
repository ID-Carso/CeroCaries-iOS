//
//  DECalendarViewController.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 06/07/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

class DECalendarViewController: BaseViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var viewCalendar: UIView!
    @IBOutlet weak var calendarCollection: UICollectionView!
    @IBOutlet weak var monthLabel: UILabel!
    
    let Months = ["ENERO", "FEBRERO", "MARZO", "ABRIL", "MAYO", "JUNIO",
                    "JULIO", "AGOSTO", "SEPTIEMBRE", "OCTUBRE", "NOVIEMBRE", "DICIEMBRE"]
      let DaysOfMonth = ["Domingo","Lunes","Martes","Miercoles","Jueves","Viernes","Sabado"]
      var DaysInMonths = [31,28,31,30,31,30,31,31,30,31,30,31]
      //year 2012,2016,2020 ..
      var DaysInMonthsBisiesto = [31,29,31,30,31,30,31,31,30,31,30,31]
      var currentMonth = String()
      var NumberOfEmptyBox = Int() //number of empty boxes atthe start the current month
      var NextNumberOfEmptyBox =  Int() //the same the above with next moth
      var PreviousNumberOfEmptyBox = 0 //the sabe the above with prev month
      var Direction = 0 // = 0 if we are at the current month. = 1 if we are  in a future month,= -1 if we are  in a pasr month
      var PositionIndex = 0//heree we will store the above vars of the empty boxes
      var LeapYearCounter =  4 //its 2 becausethe next time february has 29 days is in two years(it happens every 4 years)
      var dayCounter = 0
      var highligthDate = 20
      
      var DaysHighLight = ["2 ENERO 2020","10 JUNIO 2020","1 AGOSTO 2020","6 AGOSTO 2020","7 AGOSTO 2020","2 AGOSTO 2020", "30 AGOSTO 2020"]

      override func viewDidLoad() {
          super.viewDidLoad()
          
          currentMonth = Months[month]
          print("fecha\(currentMonth)\(year)")
          monthLabel.text = "\(currentMonth) \(year)"
          if weekday == 0 {
              weekday = 7
          }
          if (year%4 == 0){
              DaysInMonths  = [31,29,31,30,31,30,31,31,30,31,30,31]
          }else{
              DaysInMonths  = [31,28,31,30,31,30,31,31,30,31,30,31]
          }
          GetStartDateDayPosition()
          
      }
      
      func GetStartDateDayPosition(){  //this functions gives us the number of empty boxes
          switch Direction{
          case 0:// if we are at the current month
              NumberOfEmptyBox = weekday
              dayCounter = day
              while dayCounter > 0{
                  NumberOfEmptyBox = NumberOfEmptyBox - 1
                  dayCounter = dayCounter - 1
                  if NumberOfEmptyBox == 0 {
                      NumberOfEmptyBox = 7
                  }
              }
              if NumberOfEmptyBox == 7 {
                  NumberOfEmptyBox = 0
              }
              PositionIndex = NumberOfEmptyBox
              
          case 1...://if we are at the future month
              NextNumberOfEmptyBox = (PositionIndex + DaysInMonths[month])%7
              PositionIndex = NextNumberOfEmptyBox
          
          case  -1://if we are at the pasr month
              PreviousNumberOfEmptyBox = (7 - (DaysInMonths[month] - PositionIndex)%7)
              if PreviousNumberOfEmptyBox == 7{
                  PreviousNumberOfEmptyBox = 0
              }
              PositionIndex = PreviousNumberOfEmptyBox
          default:
              fatalError()
          }
      }
      
      @IBAction func nextMonth(_ sender: Any) {
          //highligthDate = -1
          switch currentMonth{
          case "DICIEMBRE":
              month = 0
              year += 1
              Direction = 1
      
              if (year%4 == 0){
                  DaysInMonths  = [31,29,31,30,31,30,31,31,30,31,30,31]
                  
              }else{
                   DaysInMonths  = [31,28,31,30,31,30,31,31,30,31,30,31]
              }
              GetStartDateDayPosition()
              currentMonth  = Months[month]
              monthLabel.text = "\(currentMonth) \(year)"
              calendarCollection.reloadData()
          default:
              //month += 1
              Direction   = 1
              GetStartDateDayPosition()
              month += 1
              currentMonth  = Months[month]
              monthLabel.text = "\(currentMonth) \(year)"
              calendarCollection.reloadData()
              
          }
      }
      
      @IBAction func prevMonth(_ sender: Any) {
          
          //highligthDate = -1
          switch currentMonth{
          case "ENERO":
              month = 11
              year -= 1
              Direction = -1

              if (year%4 == 0){
                  DaysInMonths  = [31,29,31,30,31,30,31,31,30,31,30,31]
                  
              }else{
                   DaysInMonths  = [31,28,31,30,31,30,31,31,30,31,30,31]
              }
              GetStartDateDayPosition()
              currentMonth  = Months[month]
              monthLabel.text = "\(currentMonth) \(year)"
              calendarCollection.reloadData()
          default:
              month -= 1
              Direction = -1
              GetStartDateDayPosition()
              currentMonth = Months[month]
              monthLabel.text = "\(currentMonth) \(year)"
              calendarCollection.reloadData()
              
          }
      }
      
      
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
          switch Direction{//it return the number of days in the moth + the numeber of empty boxes baserd on the direction we are going
          case 0 :
              return DaysInMonths[month] + NumberOfEmptyBox
          case 1...:
              return DaysInMonths[month] + NextNumberOfEmptyBox
          case -1:
              return DaysInMonths[month] + PreviousNumberOfEmptyBox
          default:
              fatalError()

          }
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "DECalendar", for: indexPath) as! DEDateCollectionViewCell
          cell.backgroundColor = UIColor.clear
          
          cell.dateLabel.textColor = UIColor.black
          
          if cell.isHidden{
              cell.isHidden = false
          }
          
          switch Direction{
          case 0 :
              cell.dateLabel.text = "\(indexPath.row + 1 - NumberOfEmptyBox)"
          case 1...:
              cell.dateLabel.text = "\(indexPath.row + 1 - NextNumberOfEmptyBox)"
          case -1:
              cell.dateLabel.text = "\(indexPath.row + 1 - PreviousNumberOfEmptyBox)"
          default:
              fatalError()

          }
          if Int(cell.dateLabel.text!)! < 1{
              cell.isHidden = true
          }
          
          //show the weekend days in different color
          
          switch indexPath.row{
          case 0,6,7,13,14,20,21,27,28,34,35: //the indexes of the collection view that matches with the weekend days in every month(they are always the same)
              
              if Int(cell.dateLabel.text!)! > 0{
                  cell.dateLabel.textColor = UIColor.lightGray
                  cell.dateImage.image = UIImage(named:"icon_setting")
              }
          default:
              cell.dateImage.image = UIImage(named:"icon_cat")
              break
          }
          
          //mark red the cell the shows the current date
          //if currentMonth == Months[calendar.component(.month, from: date) - 1] && year == calendar.component(.year, from: date) && indexPath.row + 1 == day{
          if currentMonth == Months[calendar.component(.month, from: date) - 1] && year == calendar.component(.year, from: date) && indexPath.row == day + 2{
              cell.backgroundColor = UIColor.red
              cell.dateLabel.textColor = UIColor.white
              cell.dateImage.image = UIImage(named:"")
              
          }
          //Compare array DaysHighLight with  dateString
          dateString = "\(indexPath.row - PositionIndex + 1) \(currentMonth) \(year)"
          print("FechaString \(dateString)")
          
          for i in 0..<DaysHighLight.count{
              if DaysHighLight[i] == dateString{
                  cell.backgroundColor = UIColor.green
                  cell.dateImage.image = UIImage(named:"")
                  
              }
          }
          return cell
      }
      //for select date and pass to the other vc
      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          
          dateString = "\(indexPath.row - PositionIndex + 1) \(currentMonth) \(year)"
          print(dateString)
          
          performSegue(withIdentifier: "DECalendarDate", sender: nil)
          //highligthDate = indexPath.row
          //collectionView.reloadData()
          //print(indexPath.row)
      }
}

//Width and height for collectionCell
extension DECalendarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: viewCalendar.frame.size.width/8, height: viewCalendar.frame.size.height/7.5)
    }
}
