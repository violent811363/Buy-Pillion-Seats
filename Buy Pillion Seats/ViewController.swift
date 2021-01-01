//
//  ViewController.swift
//  Buy Pillion Seats
//
//  Created by 吳世馨 on 2021/1/1.
//

import UIKit
class ViewController: UIViewController{
    //拉IBOutlet們
    @IBOutlet weak var pillionSeatChoices: UISegmentedControl!
    @IBOutlet weak var pillionSeatImageView: UIImageView!
    @IBOutlet weak var pillionSeatPriceLabel:UILabel!
    @IBOutlet weak var oneThousandQtyLabel: UILabel!
    @IBOutlet weak var fiveHundredQtyLabel: UILabel!
    @IBOutlet weak var oneHundredQtyLabel: UILabel!
    @IBOutlet weak var fiftyQtyLabel: UILabel!
    @IBOutlet weak var tenQtyLabel: UILabel!
    @IBOutlet weak var fiveQtyLabel: UILabel!
    @IBOutlet weak var oneQtyLabel: UILabel!

    @IBOutlet weak var oneThousandStepper: UIStepper!
    @IBOutlet weak var fiveHundredStepper: UIStepper!
    @IBOutlet weak var oneHundredStepper: UIStepper!
    @IBOutlet weak var fiftyStepper: UIStepper!
    @IBOutlet weak var tenStepper: UIStepper!
    @IBOutlet weak var fiveStepper: UIStepper!
    @IBOutlet weak var oneStepper: UIStepper!

    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!


    //坐墊圖片
    let luxuriousLVSeatImage = UIImage(named: "luxuriousLVSeat")
    let mushroomSeatImage = UIImage(named: "mushroomSeat")
    let meowPlanetPeopleSeatImage = UIImage(named: "meowPlanetPeopleSeat")
    //定義坐墊價錢
    let luxuriousLVSeatPrice = 81000
    let mushroomSeatPrice = 81000
    let meowPlanetPeopleSeatPrice = 81000
    //金額預設數量（底下拉IBAction取Stepper.value，文字轉數字用）
    var oneThousandQtyNum: Int = 0
    var fiveHundredQtyNum: Int = 0
    var oneHundredQtyNum: Int = 0
    var fiftyQtyNum: Int = 0
    var tenQtyNum: Int = 0
    var fiveQtyNum: Int = 0
    var oneQtyNum: Int = 0


    //定義合計金額fuction
    func calculate() {
        let sum = oneThousandQtyNum*1000 + fiveHundredQtyNum*500 + oneHundredQtyNum*100 + fiftyQtyNum*50 + tenQtyNum*10 + fiveQtyNum*5 + oneQtyNum*1
        sumLabel.text = "\(sum)"

    }


    //把UISegmentedControl和坐墊圖片及價錢連結
    @IBAction func chooseAPillionSeat(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            pillionSeatImageView.image = luxuriousLVSeatImage
            pillionSeatPriceLabel.text = "\(luxuriousLVSeatPrice)"
        } else if sender.selectedSegmentIndex == 1 {
            pillionSeatImageView.image = mushroomSeatImage
            pillionSeatPriceLabel.text = "\(mushroomSeatPrice)"
        } else {
            pillionSeatImageView.image = meowPlanetPeopleSeatImage
            pillionSeatPriceLabel.text = "\(meowPlanetPeopleSeatPrice)"
        }
    }

    

    @IBAction func changeQty(_ sender: UIStepper) {
        oneThousandQtyNum = Int(oneThousandStepper.value)
        fiveHundredQtyNum = Int(fiveHundredStepper.value)
        oneHundredQtyNum = Int(oneHundredStepper.value)
        fiftyQtyNum = Int(fiftyStepper.value)
        tenQtyNum = Int(tenStepper.value)
        fiveQtyNum = Int(fiveStepper.value)
        oneQtyNum = Int(oneStepper.value)
        
        //將Stepper值，顯示於對應label中
        oneThousandQtyLabel.text = "\(oneThousandQtyNum)"
        fiveHundredQtyLabel.text = "\(fiveHundredQtyNum)"
        oneHundredQtyLabel.text = "\(oneHundredQtyNum)"
        fiftyQtyLabel.text = "\(fiftyQtyNum)"
        tenQtyLabel.text = "\(tenQtyNum)"
        fiveQtyLabel.text = "\(fiveQtyNum)"
        oneQtyLabel.text = "\(oneQtyNum)"
        
        calculate()
    }
        
        @IBAction func buy(_sender: UIButton) {
            if pillionSeatChoices.selectedSegmentIndex == 0 {
                if sumLabel.text == "\(luxuriousLVSeatPrice)" {
                    discriptionLabel.text = "公道價八萬一，成交！"}else if sumLabel.text! < "\(luxuriousLVSeatPrice)" {
                        discriptionLabel.text = "不要起爭議啦！"
                    }else if sumLabel.text! > "\(luxuriousLVSeatPrice)" {
                        discriptionLabel.text = "你在大聲什麼啦！"}
            }else if pillionSeatChoices.selectedSegmentIndex == 1 {
                if sumLabel.text == "\(mushroomSeatPrice)" {
                    discriptionLabel.text = "公道價八萬一，成交！"
                }else if sumLabel.text! < "\(mushroomSeatPrice)" {
                    discriptionLabel.text = "不要起爭議啦！"
                }else if sumLabel.text! > "\(mushroomSeatPrice)"{
                    discriptionLabel.text = "你在大聲什麼啦！"}
            }else{
                if sumLabel.text == "\(meowPlanetPeopleSeatPrice)" {
                    discriptionLabel.text = "公道價八萬一，成交！"
                }else if sumLabel.text! < "\(meowPlanetPeopleSeatPrice)" {
                    discriptionLabel.text = "不要起爭議啦！"
                }else if sumLabel.text! > "\(meowPlanetPeopleSeatPrice)" {
                    discriptionLabel.text = "你在大聲什麼啦！"}
            }
        }
            
            
        //全部歸零
        @IBAction func restart(_ sender: Any) {
            pillionSeatChoices.selectedSegmentIndex = 0
            pillionSeatImageView.image = luxuriousLVSeatImage
            pillionSeatPriceLabel.text = "\(luxuriousLVSeatPrice)"
            oneThousandStepper.value = 0
            fiveHundredStepper.value = 0
            oneHundredStepper.value = 0
            fiftyStepper.value = 0
            tenStepper.value = 0
            fiveStepper.value = 0
            oneStepper.value = 0

            oneThousandQtyLabel.text = "0"
            fiveHundredQtyLabel.text = "0"
            oneHundredQtyLabel.text = "0"
            fiftyQtyLabel.text = "0"
            tenQtyLabel.text = "0"
            fiveQtyLabel.text = "0"
            oneQtyLabel.text = "0"

            sumLabel.text = "0"
            discriptionLabel.text = ""
        }




}


