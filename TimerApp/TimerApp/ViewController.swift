//
//  ViewController.swift
//  TimerApp
//
//  Created by Yasemin salan on 26.01.2025.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var counter = 0
    let timerLoop = Timer(timeInterval: 2.0, repeats: true) { _ in
        print("RunLoop ile çalışan Timer!")
    }
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        // Timer'ı aktif hale getirmek için:
        RunLoop.current.add(timerLoop, forMode: .default)
    }
   
    @objc func updateTimer(){
        
        timeLabel.text = "Time: \(counter)"
        counter -= 1
        if counter == 0{
            timeLabel.text = "Time's Up!"
            //timer ı durduruyoruz
            timer.invalidate()
            print("Timer durduruldu.")
        }
    }
    @IBAction func buttonClicked(_ sender: Any) {
        counter = 10
        timeLabel.text = "Time: \(counter)"
        //planlanmış timerı kullanıyoruz
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func timerLoopClicked(_ sender: Any) {
        //Eğer bir Timer'ı manuel olarak kontrol etmek istiyorsanız, RunLoop içinde kullanabilirsiniz
        /*
         RunLoop, bir thread'in sürekli çalışmasını ve gelen olayları işleyebilmesini sağlayan bir mekanizmadır.
         Ana thread'deki veya arka plan thread'lerindeki Timer, giriş olayları (dokunma gibi), ağ istekleri ve diğer olayları işler.
         Timer'ı bir RunLoop'a ekleyerek, onun yaşam döngüsünü ve hangi modda çalışacağını kontrol edebilirsiniz.
         RunLoop, olayları farklı modlarda işler. Timer'ınızın hangi modda çalışacağını seçebilirsiniz:

         .default: Varsayılan mod, genellikle ana iş parçacığındaki olaylar için kullanılır.
         .common: UI olayları gibi daha geniş kapsamlı modlar için kullanılır. Örneğin, kaydırma işlemleri sırasında Timer'ın çalışmaya devam etmesini istiyorsanız bu modu tercih edebilirsiniz.
         */
        // Timer'ı aktif hale getirmek için:
        RunLoop.current.add(timerLoop, forMode: .default)
    }
    
}

