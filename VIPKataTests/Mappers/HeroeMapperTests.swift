//
//  HeroeMapperTests.swift
//  VIPKataTests
//
//  Created by Manuel Rodriguez on 11/5/22.
//

import Nimble
import XCTest
@testable import VIPKata

class HeroeMapperTests: XCTestCase {
    
    func testTransformHeroeDTO() {
        let heroeDTO = HeroeDTOMother.heroe
        let sut = HeroeMapper.transform(dto: heroeDTO)
        
        expect(sut).toNot(beNil())
        expect(sut?.id).to(equal(heroeDTO.id))
        expect(sut?.name).to(equal(heroeDTO.name))
        expect(sut?.imageURL).toNot(beNil())
    }
    
}
