//
//  ComicMapperTests.swift
//  VIPKataTests
//
//  Created by Manuel Rodriguez on 11/5/22.
//

import Nimble
import XCTest
@testable import VIPKata

class ComicMapperTests: XCTestCase {

    func testTransformComicDTO() {
        let comicDTO = ComicDTOMother.comic
        let sut = ComicMapper.transform(dto: comicDTO)
        
        expect(sut).toNot(beNil())
        expect(sut?.id).to(equal(comicDTO.id))
        expect(sut?.title).to(equal(comicDTO.title))
        expect(sut?.imageURL).toNot(beNil())
    }
    
}
