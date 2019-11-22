//
//  ViewController.swift
//  assignment2
//
//  Created by Younhee Lee on 2019-11-18.
//  Copyright © 2019 Younhee Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var progressPercent: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var successMessage: UILabel!
    
    var time : [Int] = [0, 0, 0]
    var percentPerSec:Double = 1
    let e = 2.71828
    var currentPercent:Double = 0
    var currentTime:Double = 0
    var thisYear:Double = 0
    var i = 0
    var timer:Timer?
    
    let history = ["Phone hacking scandal breaks", //0.55 2012?
                    "$10,000 bet", //0.95 12/10/11
                    "UC Davis pepper spray incident", //1.01 11/18/11
                    "Skyrim released", //1.02 11/11/11
                    "Oops", //1.03 11/9/11
                    "Someone Like You leaves #1", //1.04 11/5/11
                    "Gadhaffi killed", //1.09 10/20/11
                    "We are the 99%", //1.12 10/12/11
                    "Tea party sweep", //1.15
                    "Someone Like You reaches #1", //1.18 9/17/11
        
                    "Party Rock leaves #1", //1.25 8/20/11
                    "Norway massacre", //1.33 7/22/11
                    "Party Rock reaches #1", //1.35 7/16/11
                    "Wikileaks posts state department cables", //1.43
                    "Rolling in the Deep reaches #1", //1.44 6/12/11
                    "Rolling in the Deep leaves #1", //1.50 5/21/11,
                    "Osama bin Laden killed, Iceland volcano erupts", //1.55 5/2/11
                    "Iraq invaded, same-sex marriage legalized in MA", //1.63
                    "Born This Way stops", //1.64 4/2/11
                    "Japan tsunami", //1.70 3/11/11
                    "Born This Way starts", //1.73 2/26/11
                    "iPad released, health care reform law passed", //1.75
                    "Rebecca Black - Friday", //1.77 2/10/11
                    "Haiti, Ft. Hood, Michael Jackson", //2.11
                    "Vengeance Dad", //2.39 7/1/10
                    "Green revolution, swine flu", //2.53
                    "Obama inaugurated, Tea party forms", //3.01
                    "Windows 7 released", //3.08 10/22/09
                    "It's dangerous to go alone", //3.52 5/13/09
                    "Obama beats Clinton, financial system collapses", //3.55
        
                    "I'm on a boat", //3.78 2/7/09
                    "Shoe thrower Bush", //3.93 12/14/08
                    "Chrome released", //3.94 12/11/08
                    "Mortgage crisis, last Harry Potter book", //4.16
                    "Dr. Horrible", // 4.35 7/13/08
                    "Pork and Beans video", //4.49 5/23/08
                    "Ask Reddit created", //4.82 1/24/08
                    "Virginia Tech massacre, iPhone", //4.86
                    "iPhone released", //5.39 6/29/07
                    "Daft Hands", //5.46 6/6/07
                    "Chocolate Rain", //5.58 4/21/07
                    "Gas above $4.00, Democrats poised to win House and Senate", //5.64
                    "What What in the butt", //5.76 2/14/07
                    "Windows Vista released", //5.81 1/30/07
                    "iPhone announced", //5.86 1/9/07
                    "Wii released", //6.00 11/19/06
                    "PS3", //6.02 11/11/06
                    "Over 9000", //6.09 10/17/06
                    
                    
                    "Serenity released", //6.14 9/30/05
                    "Diet Coke/Mentos", //6.22 8/31/05
                    "Leeeeeroy Jenkins", //6.30 8/1/05
                    "Reddit founded", //6.47 6/1/05
                    "XBOX 360", //6.52 5/12/05
                    "Evolution of Dance", //6.63 4/5/06
                    "Twitter", //6.72 3/1/06
                    "YouTUBE launched", //6.80 2/1/05
                    "Leekspin", //6.88 1/1/06
                    "numa numa", //6.95 12/6/04
        
                    "Nintendo DS",  //7.00 11/21/04
                    "Do a barrel roll", //7.47 6/1/04
                    "Bird flu panic, tsunami, Facebook, Mars rovers", //7.52
                    "GMail launched", //7.64 4/1/04
                    "Firefox released", //7.78 2/9/04
                    "Facebook launched", //7.89 1/1/04
                    "Return of the King", //7.93 12/17/03
                    "End of the WOrld", //8.14 10/1/03
                    "Badger Badger Badger", //8.22 9/2/03
                    "Internet is for porn", //8.69 3/14/03
                    "I'm in your base", //8.88 1/1/03
                    "Firefly cancelled", //8.92 12/20/02
                    "Firefly premiers", //9.17 9/20/02
                    "Pirates v. Ninjas", //9.45 6/7/02
                    "9/11, Afghanistan", //9.89
                    "Clinton inaugurated", //10.02
                    "iPod released", //10.03 11/10/01
                    "iPod announced", //10.08 10/23/01
                    "All Your Base!", //10.72 3/1/01
                    "Homestar Runner", //10.80 2/1/01
                    "Bush/Gore election, Google, Segway, Windows XP", //11.31
                    "PS2 released", //11.71 3/4/00
                    "The Blair Witch Project", //12.35 7/14/99
                    "Clinton impeached/acquitted, Columbine massacre, The Matrix", //12.90
                    "Hamster Dance", //13.30 8/1/98
                    "Google.com launched", //14.18 9/15/97
                    "Deep Blue", //14.55 5/1/97
                    "Princess Diana dies", //14.70
                    "Dancing Baby", //15.08 10/21/96
                    "Ate My Balls", //15.89 12/31/95
                    "Dysfunctional Family Circus", //16.47 6/1/95
                    "OJ Simpson trial, Windows 95", //16.74
                    "Soviet Union collapses, Tiananmen Square, Gulf War", //21.64
                    "Challenger, Pan Am Flight 103, Iran-Contra", //24.60
                    "Reagan crushes Mondale, Macintosh introduced, I'm born", //27.97
                    "Mt. St. Helens, AIDS, PCs, Empire Strikes Back", //31.81
                    "Watergate, Roe v. Wade, Microsoft, Ebola, Elvis dies", //36.20
                    "Moon landing, Kent State, Nixon", //41.25
                    "Civil rights, Kennedy shot, Six Day War", //47.06
                    "Elvis, velcro, Great Leap Forward, Castro, Cuban missiles", //53.76
                    "DNA, Stalin dies, Color TV, Polio vaccine, Elizabeth", //61.54
                    "Pearl Harbor, World War II, Manhattan Project", //70.59
                    "Great Depression, Dust Bowl, Hitler, Prohibition ends, Babe Ruth", //81.16
                    "Chaplin, Titanic, Russian Revolution", //93.55
                    "Flight, movies, Relativity, New York subway, San Francisco earthquake", //108
                    "telephones, Krakatoa, machine guns, cars, RADAR, coke, movie cameras", //125
                    "Civil War, Lincoln shot, dynamite invented", //146
                    "Wrenches, vulcanized rubber, bicycle, stamps, US I.R.", //170
                    "Photos, War of 1812, cement, battery, machine tools, Waterloo", //200
                    "American and French revolutions, Haiti rebellion, Industrial Revolution, Napoleon", //235
                    "First Great Awakening, Enlightenment, Qianlong Emperor expansion, Enlightenment", //278
                    "Newton's Principia, Ming Dynasty collapses, Great Turkish War, Salem witch trials", //331
                    "Logarithms, Kepler, 30 Years' War, Plymouth Rock, Jamestown, Shakespeare", //395
                    "Reformation, Columbian Exchange, Copernicus, Sack of Rome, Cortés, Pizarro", //474
                    "Agincourt, Joan of Arc, end of Byzantine Empire, Moctezuma I, printing press, Zheng He", //573
                    "Tenochtitlan, Renaissance, Chaucer, Lake Poyang, Ming dynasty, Black Death", //695
                    "Mongol empire, explosive weapons, windmills, compass, Crusades", //849
                    "Classical China and Islam, gunpowder, zero invented, moveable type, Mayan collapse", //1,044
                    "Muslim conquests, Constantinople flourished, Beowulf composed, Tang Dynasty, Viking raids", //1,291
                    "Teotihuacan, collapse of western Roman Empire, vandals, Atilla the Hun, Christianity", //1,607
                    "Roman Empire, Jesus, Pyramid of the Son, London, Pompeii", //2,014
                    "Rome founded, Roman Republic, Battle of Thermopylae, corn, Mexican writing, Alexander", //2,542
                    "Egypt conquers Nubia, Exodus, Judaism, Athens, Classical Greece, wheel, ironsmithing, alphabet", //3,232
                    "Ancient Egypt, pyramids, Ur, Bristlecone pine Methusaleh, chariots, Stonehenge", //4,139
                    "Otzi, Sumerian language, Minoans, silk, pottery, copper, bronze, dams, harps, Mayan day zero", //5,342
                    "Mesopotamia, wheel, copper, first cities, animal husbandry, menhirs, beer, maize", //6,947
                    "England separated, Norway megatsunami, wine, Jericho, cows, metal ornaments, agriculture", //9,106
                    "Ice withdraws, Clovis culture, people settling into permanent locations, domestic reindeer", //12,031
                    "Last glacial maximum, land bridge blocked by ice, permafrost/ice cover Europe, ice sheets in Tibet", //16,028
                    "Nets, dogs domesticated, recent glacial period starts, Neanderthals go extinct, wall paintings, Japan colonized", //21,530
                    "Ceramic art, bow and arrow, spear thrower, lunar calendars, first known shaman", //29,167
                    "Humans colonize colder areas, tools spread into Europe, Cro-Magnon, people in Australia", //39,855
                    "Big increase in diversity of artifacts, better stone tools, settlements, flint tools, art", //54,938
                    "Fishing in Congo, behavioral modernity, bone tools, Homo sapiens spreads", //76,403
                    "First Homo sapiens expeditions out of Africa", //107,217
                    "Homo sapiens evolves, Mitochondrial Eve and Y-Chromosomal Adam in Africa", //151,838
                    "Cooked food, flint and stone tools, Neandertals, prepared core technique", //217,031
                    "Glacial began, Neanderthals thrive",//313,142
                    "Homo heidelbergensis (ancestor of Neanderthals and Homo sapiens), burying dead, controlled fire", //456,132
                    "Homo heidelbergensis and many other homonids arise, possible use of fire", //670,851
                    "Homo antecessor common", //996,324
                    "Homo erectus first uses crude stone tools", //1,494,404
                    "Homo genus emerges from Australopithecus, modern Ice Ages begin", //2,264,025
                    "Isthmus of Panama forms, cooling oceans. Africa hits Europe, forming Mediterranean, Australopithecus", //3,464,925
                    "Africa hits Europe, forming Mediterranean. Messian salinity crisis", //5,357,462
                    "Himalayas start to rise, gorillas split off from hominids, owls, crows, all bird families", //8,370,091
                    "Africa collides with Asia, Greenland ice cap develops, wave of extinctions, permanent cooling, great apes", //13,214,786
                    "Ice cap began forming, grasses diversified", //21,086,382
                    "Ice began to build up in Antarctica, higher and narrow-nosed primates evolve", //34,010,190
                    "Asteroid impact kills most dinosaurs, PE warming, acidic oceans, mammals proliferated", //55,454,157
                    "Europe is island chain, sauropods grow huge, Tyrannosaurs dominant, birds replace pterosaurs, flowers", //91,417,696
        
                    "Pangea began to separate, ancestral Rocky Mountains form, large conifers dominate, ginkgos, dinosaurs", //152,387,933
                    "Pangea dominates, hot and dry, massive extinction wipes out nearly all life, winged insects and trees", //256,890,498
                    "Land vertibrates, sea scorpions, invertebrates diversify, green plants and fungi", //438,001,584
                    "Possible snowball earth, multicellular organisms followed by Cambrian explosion", //755,416,585
                    "Complex single-celled life, primordial supercontinent, green algae colonies, stable cratons", //1,318,055,081
                    "Cyanobacteria form, oxygen fills atmosphere, most life wiped out, several snowball Earth episodes", //2,326,857,711
                    "Solar system coalesces from nebula, sun ignites, Earth forms, impact forms Moon, late heavy bombardment, life", //4,156,696,645
                    "Milky Way forms from disc of matter, along with clusters and superclusters, full of heavy nova debris", //7,514,880,608
                    "Universe begins. Big Bang, universe cools, first stars and quasars form, first generation of supernovas create heavy elements", //1.37513e+10
    ]

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.travelTo.delegate = self
        /**************** progressBar ******************/
        progressbar.progress = 0.0
        progressbar.transform = progressbar.transform.scaledBy(x: 1, y: 8)
        progressbar.layer.cornerRadius = 8
        progressbar.clipsToBounds = true
        progressbar.layer.sublayers![1].cornerRadius = 8
        progressbar.subviews[1].clipsToBounds = true
        /**************************************/
        /* current year setting */
        thisYear = Double(2012)
        currentTime = Double(thisYear) - (pow(e,(20.3444 * pow(0.0,3.0) + 3.0)) - pow(e,3.0))
        /* default content */
        contents.text = history[0]
        /* Set timer */
        let hoursInSeconds:Double = Double(time[0]*3600)
        let minsInSeconds:Double = Double(time[1]*60)
        percentPerSec = Double(100/(hoursInSeconds + minsInSeconds + Double(time[2])))
        timerStart()
    }
    
    func timerStart(){
        guard timer == nil else { return }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.runEverySecond), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
      timer?.invalidate()
      timer = nil
        successMessage.text = "Download Complete !"
    }
    
    @objc func runEverySecond(){
        
        if(currentPercent < 100){
            currentPercent = currentPercent + percentPerSec;
            currentTime = Double(thisYear) - (pow(e,(20.3444 * pow(Double(currentPercent)/100.0,3.0) + 3.0)) - pow(e,3.0))
            progressbar.progress = Float(currentPercent/100)
        }
        
        progressPercent.text = String(round(1000*currentPercent)/1000) + "%"
        
        //update info
        updateInfo()
    }

    func updateInfo(){
        if(currentTime <= thisYear-13751093099){contents.text = history[157]; updateDate(0); stopTimer(); }
        else if (currentTime <= thisYear-7514880608){contents.text = history[156]; updateDate(0) }
        else if (currentTime <= thisYear-4156696645){contents.text = history[155]; updateDate(0) }
        else if (currentTime <= thisYear-2326857711){contents.text = history[154]; updateDate(0) }
        else if (currentTime <= thisYear-1318055081){contents.text = history[153]; updateDate(0) }
        else if (currentTime <= thisYear-755416585){contents.text = history[152]; updateDate(0)}
        else if (currentTime <= thisYear-438001584){contents.text = history[151]; updateDate(0)}
        else if (currentTime <= thisYear-256890498){contents.text = history[150]; updateDate(0) }
            
        else if (currentTime <= thisYear-152387933){contents.text = history[149]; updateDate(0) }
        else if (currentTime <= thisYear-91417696){contents.text = history[148]; updateDate(0)}
        else if (currentTime <= thisYear-55454157){contents.text = history[147]; updateDate(0) }
        else if (currentTime <= thisYear-34010190){contents.text = history[146]; updateDate(0) }
        else if (currentTime <= thisYear-21086382){contents.text = history[145]; updateDate(0)}
        else if (currentTime <= thisYear-13214786){contents.text = history[144]; updateDate(0) }
        else if (currentTime <= thisYear-8370091){contents.text = history[143]; updateDate(0) }
        else if (currentTime <= thisYear-5357462){contents.text = history[142]; updateDate(0) }
        else if (currentTime <= thisYear-3464925){contents.text = history[141]; updateDate(0) }
        else if (currentTime <= thisYear-2264025){contents.text = history[140]; updateDate(0) }
            
        else if (currentTime <= thisYear-1494404){contents.text = history[139]; updateDate(0) }
        else if (currentTime <= thisYear-996324){contents.text = history[138] ; updateDate(0)}
        else if (currentTime <= thisYear-670851){contents.text = history[137]; updateDate(0) }
        else if (currentTime <= thisYear-456132){contents.text = history[136]; updateDate(0) }
        else if (currentTime <= thisYear-313142){contents.text = history[135]; updateDate(0) }
        else if (currentTime <= thisYear-217031){contents.text = history[134]; updateDate(0) }
        else if (currentTime <= thisYear-151838){contents.text = history[133]; updateDate(0) }
        else if (currentTime <= thisYear-107217){contents.text = history[132]; updateDate(0) }
        else if (currentTime <= thisYear-76403){contents.text = history[131]; updateDate(0) }
        else if (currentTime <= thisYear-54938){contents.text = history[130]; updateDate(0) }
            
        else if (currentTime <= thisYear-39855){contents.text = history[129] ; updateDate(0)}
        else if (currentTime <= thisYear-29167){contents.text = history[128] ; updateDate(0)}
        else if (currentTime <= thisYear-21530){contents.text = history[127]; updateDate(0) }
        else if (currentTime <= thisYear-16028){contents.text = history[126]; updateDate(0) }
        else if (currentTime <= thisYear-12031){contents.text = history[125] ; updateDate(0)}
        else if (currentTime <= thisYear-9106){contents.text = history[124]; updateDate(0) }
        else if (currentTime <= thisYear-6947){contents.text = history[123]; updateDate(0) }
        else if (currentTime <= thisYear-5342){contents.text = history[122]; updateDate(0) }
        else if (currentTime <= thisYear-4139){contents.text = history[121]; updateDate(0) }
        else if (currentTime <= thisYear-3232){contents.text = history[120]; updateDate(0) }
            
        else if (currentTime <= thisYear-2542){contents.text = history[119]; updateDate(0) }
        else if (currentTime <= thisYear-2014){contents.text = history[118] ; updateDate(0)}
        else if (currentTime <= thisYear-1607){contents.text = history[117] ; updateDate(0)}
        else if (currentTime <= thisYear-1291){contents.text = history[116] ; updateDate(0)}
        else if (currentTime <= thisYear-1044){contents.text = history[115] ; updateDate(0)}
        else if (currentTime <= thisYear-849){contents.text = history[114] ; updateDate(0)}
        else if (currentTime <= thisYear-695){contents.text = history[113] ; updateDate(0)}
        else if (currentTime <= thisYear-573){contents.text = history[112]; updateDate(0) }
        else if (currentTime <= thisYear-474){contents.text = history[111]; updateDate(0) }
        else if (currentTime <= thisYear-395){contents.text = history[110]; updateDate(0) }
            
        else if (currentTime <= thisYear-331){contents.text = history[109]; updateDate(0) }
        else if (currentTime <= thisYear-278){contents.text = history[108]; updateDate(0) }
        else if (currentTime <= thisYear-235){contents.text = history[107]; updateDate(0) }
        else if (currentTime <= thisYear-200){contents.text = history[106]; updateDate(0) }
        else if (currentTime <= thisYear-170){contents.text = history[105]; updateDate(0) }
        else if (currentTime <= thisYear-146){contents.text = history[104]; updateDate(0) }
        else if (currentTime <= thisYear-125){contents.text = history[103]; updateDate(0) }
        else if (currentTime <= thisYear-108){contents.text = history[102]; updateDate(0) }
        else if (currentTime <= thisYear-93.55){contents.text = history[101]; updateDate(0) }
        else if (currentTime <= thisYear-81.16){contents.text = history[100]; updateDate(0) }
            
        else if (currentTime <= thisYear-70.59){contents.text = history[99]; updateDate(0) }
        else if (currentTime <= thisYear-61.54){contents.text = history[98]; updateDate(0) }
        else if (currentTime <= thisYear-53.76){contents.text = history[97]; updateDate(0) }
        else if (currentTime <= thisYear-47.06){contents.text = history[96]; updateDate(0) }
        else if (currentTime <= thisYear-41.25){contents.text = history[95]; updateDate(0) }
        else if (currentTime <= thisYear-36.20){contents.text = history[94]; updateDate(0) }
        else if (currentTime <= thisYear-31.81){contents.text = history[93]; updateDate(0) }
        else if (currentTime <= thisYear-27.97){contents.text = history[92]; updateDate(0) }
        else if (currentTime <= thisYear-24.60){contents.text = history[91]; updateDate(0) }
        else if (currentTime <= thisYear-21.64){contents.text = history[90]; updateDate(0) }
            
        else if (currentTime <= thisYear-16.74){contents.text = history[89]; updateDate(0) }
        else if (currentTime <= thisYear-16.47){contents.text = history[88]; updateDate(0) }
        else if (currentTime <= thisYear-15.89){contents.text = history[87]; updateDate(0) }
        else if (currentTime <= thisYear-15.08){contents.text = history[86]; updateDate(0) }
        else if (currentTime <= thisYear-14.70){contents.text = history[85]; updateDate(0) }
        else if (currentTime <= thisYear-14.55){contents.text = history[84]; updateDate(84) }
        else if (currentTime <= thisYear-14.18){contents.text = history[83]; updateDate(83) }
        else if (currentTime <= thisYear-13.30){contents.text = history[82]; updateDate(82) }
        else if (currentTime <= thisYear-12.90){contents.text = history[81]; updateDate(81) }
        else if (currentTime <= thisYear-12.35){contents.text = history[80]; updateDate(80) }
            
        else if (currentTime <= thisYear-11.71){contents.text = history[79]; updateDate(79) }
        else if (currentTime <= thisYear-11.31){contents.text = history[78]; updateDate(78) }
        else if (currentTime <= thisYear-10.80){contents.text = history[77]; updateDate(77) }
        else if (currentTime <= thisYear-10.72){contents.text = history[76]; updateDate(76) }
        else if (currentTime <= thisYear-10.08){contents.text = history[75]; updateDate(75) }
        else if (currentTime <= thisYear-10.03){contents.text = history[74]; updateDate(74) }
        else if (currentTime <= thisYear-10.02){contents.text = history[73]; updateDate(73) }
        else if (currentTime <= thisYear-9.89){contents.text = history[72]; updateDate(72) }
        else if (currentTime <= thisYear-9.45){contents.text = history[71]; updateDate(71) }
        else if (currentTime <= thisYear-9.17){contents.text = history[70]; updateDate(70) }
            
        else if (currentTime <= thisYear-8.92){contents.text = history[69]; updateDate(60) }
        else if (currentTime <= thisYear-8.88){contents.text = history[68]; updateDate(68) }
        else if (currentTime <= thisYear-8.69){contents.text = history[67]; updateDate(67) }
        else if (currentTime <= thisYear-8.22){contents.text = history[66]; updateDate(66) }
        else if (currentTime <= thisYear-8.14){contents.text = history[65]; updateDate(65) }
        else if (currentTime <= thisYear-7.93){contents.text = history[64]; updateDate(64) }
        else if (currentTime <= thisYear-7.89){contents.text = history[63]; updateDate(63) }
        else if (currentTime <= thisYear-7.78){contents.text = history[62]; updateDate(62) }
        else if (currentTime <= thisYear-7.64){contents.text = history[61]; updateDate(61) }
        else if (currentTime <= thisYear-7.52){contents.text = history[60]; updateDate(60) }
            
        else if (currentTime <= thisYear-7.47){contents.text = history[59]; updateDate(59) }
        else if (currentTime <= thisYear-7.00){contents.text = history[58]; updateDate(58) }
        else if (currentTime <= thisYear-6.95){contents.text = history[57]; updateDate(57) }
        else if (currentTime <= thisYear-6.88){contents.text = history[56]; updateDate(56) }
        else if (currentTime <= thisYear-6.80){contents.text = history[55]; updateDate(55) }
        else if (currentTime <= thisYear-6.72){contents.text = history[54]; updateDate(54) }
        else if (currentTime <= thisYear-6.63){contents.text = history[53]; updateDate(53) }
        else if (currentTime <= thisYear-6.52){contents.text = history[52]; updateDate(52) }
        else if (currentTime <= thisYear-6.47){contents.text = history[51]; updateDate(51) }
        else if (currentTime <= thisYear-6.30){contents.text = history[50]; updateDate(50) }
            
        else if (currentTime <= thisYear-6.22){contents.text = history[49]; updateDate(49) }
        else if (currentTime <= thisYear-6.14){contents.text = history[48]; updateDate(48) }
        else if (currentTime <= thisYear-6.09){contents.text = history[47]; updateDate(47) }
        else if (currentTime <= thisYear-6.02){contents.text = history[46]; updateDate(46) }
        else if (currentTime <= thisYear-6.00){contents.text = history[45]; updateDate(45) }
        else if (currentTime <= thisYear-5.86){contents.text = history[44]; updateDate(44) }
        else if (currentTime <= thisYear-5.81){contents.text = history[43]; updateDate(43) }
        else if (currentTime <= thisYear-5.76){contents.text = history[42]; updateDate(42) }
        else if (currentTime <= thisYear-5.64){contents.text = history[41]; updateDate(41) }
        else if (currentTime <= thisYear-5.58){contents.text = history[40]; updateDate(40) }
            
        else if (currentTime <= thisYear-5.46){contents.text = history[39]; updateDate(39)}
        else if (currentTime <= thisYear-5.39){contents.text = history[38]; updateDate(38) }
        else if (currentTime <= thisYear-4.86){contents.text = history[37]; updateDate(37) }
        else if (currentTime <= thisYear-4.82){contents.text = history[36]; updateDate(36) }
        else if (currentTime <= thisYear-4.49){contents.text = history[35]; updateDate(35) }
        else if (currentTime <= thisYear-4.35){contents.text = history[34]; updateDate(34) }
        else if (currentTime <= thisYear-4.16){contents.text = history[33]; updateDate(33) }
        else if (currentTime <= thisYear-3.94){contents.text = history[32]; updateDate(32) }
        else if (currentTime <= thisYear-3.93){contents.text = history[31]; updateDate(31) }
        else if (currentTime <= thisYear-3.78){contents.text = history[30] ; updateDate(30)}
        
        else if (currentTime <= thisYear-3.55){contents.text = history[29]; updateDate(29) }
        else if (currentTime <= thisYear-3.52){contents.text = history[28]; updateDate(28) }
        else if (currentTime <= thisYear-3.05){contents.text = history[27]; updateDate(27) }
        else if (currentTime <= thisYear-3.01){contents.text = history[26]; updateDate(26) }
        else if (currentTime <= thisYear-2.53){contents.text = history[25]; updateDate(25) }
        else if (currentTime <= thisYear-2.39){contents.text = history[24]; updateDate(24) }
        else if (currentTime <= thisYear-2.11){contents.text = history[23]; updateDate(23) }
        else if (currentTime <= thisYear-1.77){contents.text = history[22]; updateDate(22) }
        else if (currentTime <= thisYear-1.75){contents.text = history[21]; updateDate(21) }
        else if (currentTime <= thisYear-1.73){contents.text = history[20]; updateDate(20) }
        
        else if (currentTime <= thisYear-1.70){contents.text = history[19]; updateDate(19) }
        else if (currentTime <= thisYear-1.64){contents.text = history[18]; updateDate(18) }
        else if (currentTime <= thisYear-1.63){contents.text = history[17]; updateDate(17) }
        else if (currentTime <= thisYear-1.55){contents.text = history[16]; updateDate(16) }
        else if (currentTime <= thisYear-1.50){contents.text = history[15]; updateDate(15) }
        else if (currentTime <= thisYear-1.44){contents.text = history[14]; updateDate(14) }
        else if (currentTime <= thisYear-1.43){contents.text = history[13]; updateDate(13) }
        else if (currentTime <= thisYear-1.35){contents.text = history[12]; updateDate(12) }
        else if (currentTime <= thisYear-1.33){contents.text = history[11]; updateDate(11) }
        else if (currentTime <= thisYear-1.25){contents.text = history[10]; updateDate(10) }
        
        else if (currentTime <= thisYear-1.18){contents.text = history[9]; updateDate(9) }
        else if (currentTime <= thisYear-1.15){contents.text = history[8]; updateDate(8) }
        else if (currentTime <= thisYear-1.12){contents.text = history[7]; updateDate(7) }
        else if (currentTime <= thisYear-1.09){contents.text = history[6]; updateDate(6) }
        else if (currentTime <= thisYear-1.04){contents.text = history[5]; updateDate(5) }
        else if (currentTime <= thisYear-1.03){contents.text = history[4]; updateDate(4) }
        else if (currentTime <= thisYear-1.02){contents.text = history[3]; updateDate(3) }
        else if (currentTime <= thisYear-1.01){contents.text = history[2]; updateDate(2) }
        else if (currentTime <= thisYear-0.95){contents.text = history[1]; updateDate(1) }
        else {contents.text = history[0]; updateDate(0) }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func updateDate(_ i: Int) {
        if(currentTime < 0 ){
            date.text = String(format: "%.0f years ago", (abs(currentTime)+thisYear))
            print(currentTime)
        } else {
            switch i {
            case 1: date.text = "December 10, 2011"
            case 2: date.text = "November 18, 2011"
            case 3: date.text = "November 11, 2011"
            case 4: date.text = "November 9, 2011"
            case 5: date.text = "November 5, 2011"
            case 6: date.text = "October 20, 2011"
            case 7: date.text = "October 12, 2011"
            case 9: date.text = "September 17, 2011"
            case 10: date.text = "August 20, 2011"
            case 11: date.text = "July 22, 2011"
            case 12: date.text = "July 16, 2011"
            case 14: date.text = "June 12, 2011"
            case 15: date.text = "May 21, 2011"
            case 16: date.text = "May 2, 2011"
            case 18: date.text = "April 2, 2011"
            case 20: date.text = "February 26, 2011"
            case 22: date.text = "February 10, 2011"
            case 24: date.text = "July 1, 2010"
            case 27: date.text = "October 22, 2009"
            case 32: date.text = "December 1, 2008"
            case 36: date.text = "January 24, 2008"
            case 38: date.text = "July 29, 2007"
            case 42: date.text = "February 14, 2007"
            case 43: date.text = "January 30, 2007"
            case 44: date.text = "January 9, 2007"
            case 45: date.text = "November 19, 2006"
            case 46: date.text = "November 11, 2006"
            case 50: date.text = "August 1, 2005"
            case 51: date.text = "June 1, 2005"
            case 52: date.text = "May 12, 2005"
            case 54: date.text = "March 1, 2005"
            case 55: date.text = "February 1, 2005"
            case 58: date.text = "November 21, 2004"
            case 61: date.text = "April 1, 2004"
            case 62: date.text = "February 9, 2004"
            case 63: date.text = "January 1, 2004"
            case 72: date.text = "September 11, 2001"
            case 74: date.text = "October 23, 2001"
            case 79: date.text = "March 24, 2000"
            case 83: date.text = "September 15, 1997"
            case 84: date.text = "May 1, 1997"
            default:
                date.text = String(format: "%.0f", currentTime)
            }
            
        }
    }
    
    /** Not a requirement **/
//    @IBAction func travelToWhere(_ sender: Any) {
//        currentPercent = Double(date.text ?? "0")!
//        currentTime = Double(thisYear) - (pow(e,(20.3444 * pow(currentPercent/100,3) + 3)) - pow(e,3))
//        progressbar.progress = Float(currentPercent/100)
//        if(currentTime < 0 ){
//            date.text = String(format: "%.0f years ago", (abs(currentTime)+thisYear))
//        } else {
//            date.text = String(format: "%.0f", currentTime)
//        }
//        updateInfo()
//    }
}

