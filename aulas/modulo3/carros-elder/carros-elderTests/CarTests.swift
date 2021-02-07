//
//  CarTests.swift
//  carros-elderTests
//
//  Created by Elder Alcantara on 26/01/21.
//

import XCTest
@testable import carros_elder



class CarTests: XCTestCase {
    
    var ferrari: Car!
    var jeep: Car!
    var honda: Car!
    var palio: Car!
    
    override func setUp() {
        
        ferrari = Car(type: .Sport, transmissionMode: .Drive, review: .notReview)
        jeep = Car(type: .OffRoad, transmissionMode: .Drive, review: .notReview)
        honda = Car(type: .Sport, transmissionMode: .Drive, review: .notReview)
        palio = Car(type: .Economy, transmissionMode: .Drive, review: .notReview)
        
    }
    
    override func tearDown() {
        
        super.tearDown()
        
        ferrari = nil
        jeep = nil
        honda = nil
        palio = nil
        
    }
    
    func testCarroMaisRapido_comparandoSetupCarro_FerrariMaisRapida() {
        
        let minutes = 60
        ferrari.start(minutes: minutes)
        jeep.start(minutes: minutes)
        
        XCTAssert(ferrari.miles > jeep.miles)
        
    }
    
    func testCarroMaisLento_comparandoSetupCarro_PalioMaisLento() {
        
        let minutes = 60
        palio.start(minutes: minutes)
        jeep.start(minutes: minutes)
        
        XCTAssert(palio.miles < jeep.miles)
    }
    
    func testePrimeiraRevisao_comparandoMesesEMilhas_12MesesPrimeiraRevisao() {
        
        let months = 12
        let miles = 1000
        
        jeep.carReview(months: months, miles: miles)
        
        XCTAssert(jeep.review == .FirstReview)
        
    }
    
    func testeSegundaRevisao_comparandoMesesEMilhas_24MesesSegundaRevisao() {
        
        let months = 24
        let miles = 2000
        
        jeep.carReview(months: months, miles: miles)
        
        XCTAssert(jeep.review == .SecondReview)
        
    }
    
    func testeTerceiraRevisao_comparandoMesesEMilhas_36MesesTerceiraRevisao() {
        
        let months = 36
        let miles = 3000
        
        jeep.carReview(months: months, miles: miles)
        
        XCTAssert(jeep.review == .ThirdReview)
        
    }
    
    func testeQuartaRevisao_comparandoMesesEMilhas_48MesesQuartaRevisao() {
        
        let months = 48
        let miles = 4000
        
        jeep.carReview(months: months, miles: miles)
        
        XCTAssert(jeep.review == .FourthReview)
        
    }
    
    func testeSemRevisao_comparandoMesesEMilhas_SemRevisao() {
        
        let months = 60
        let miles = 5000
        
        jeep.carReview(months: months, miles: miles)
        
        XCTAssert(jeep.review != .FirstReview || jeep.review != .SecondReview || jeep.review != .ThirdReview || jeep.review != .FourthReview)
        
    }
    

}
