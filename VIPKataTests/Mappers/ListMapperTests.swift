//
//  ListMapperTests.swift
//  VIPKataTests
//
//  Created by Manuel Rodriguez on 11/5/22.
//

import Nimble
import XCTest
@testable import VIPKata

class ListMapperTests: XCTestCase {

    func testTransformComicDTO() {
        let comicsDTOList = [ComicDTOMother.comic, ComicDTOMother.comic]
        let comicsResponseDTOList = APIResponseDTOMother().generateResponseList(withList: comicsDTOList)
       
        let sut = ListMapper.transform(dto: comicsResponseDTOList)
        
        expect(sut.results).toNot(beEmpty())
        expect(sut.results.count).to(equal(comicsResponseDTOList.results?.count))
    }

    func testTransformHeroeDTO() {
        let heroesDTOList = [HeroeDTOMother.heroe, HeroeDTOMother.heroe]
        let heroeREsponseDTOList = APIResponseDTOMother().generateResponseList(withList: heroesDTOList)

        let sut = ListMapper.transform(dto: heroeREsponseDTOList)

        expect(sut.results).toNot(beEmpty())
        expect(sut.results.count).to(equal(heroeREsponseDTOList.results?.count))
    }
}

