//
//  CharacterListUITests.swift
//  RickAndMortyUITests
//
//  Created by Manuel Rodriguez Sebastian on 20/4/24.
//

import XCTest

@testable import RickAndMorty

final class CharacterListUITests: XCTestCase {

    private var sut: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        sut = XCUIApplication()
        sut.launch()
    }
    
    override func tearDown() {
        sut.terminate()
        sut = nil
        
        super.tearDown()
    }
    
    func testTabBar() {
        let charactersTabItem = sut.tabBars.buttons["characters_tab_item"]
        XCTAssertTrue(charactersTabItem.exists)
        XCTAssertTrue(charactersTabItem.isHittable)
        charactersTabItem.tap()
        XCTAssertTrue(charactersTabItem.isSelected)
        
        let charactersTitle = sut.navigationBars.staticTexts["Characters"]
        XCTAssertTrue(charactersTitle.exists)
        
        let episodesTabBarItem = sut.tabBars.buttons["episodes_tab_item"]
        XCTAssertTrue(episodesTabBarItem.exists)
        XCTAssertTrue(episodesTabBarItem.isHittable)
        episodesTabBarItem.tap()
        XCTAssertTrue(episodesTabBarItem.isSelected)
        
        let episodesTitle = sut.navigationBars.staticTexts["Episodes"]
        XCTAssertTrue(episodesTitle.exists)
    }
    
    func testListFilters() {
        let filterButton = sut.images["filter_button"]
        XCTAssertTrue(filterButton.exists)
        
        filterButton.tap()
                        
        let aliveFilter = sut.buttons[CharacterStatus.alive.accessibilityIdentifier]
        XCTAssertTrue(aliveFilter.exists)
        
        let deadFilter = sut.buttons[CharacterStatus.dead.accessibilityIdentifier]
        XCTAssertTrue(deadFilter.exists)
        
        let unknowFilter = sut.buttons[CharacterStatus.unknown.accessibilityIdentifier]
        XCTAssertTrue(unknowFilter.exists)
        
        let allFilter = sut.buttons[CharacterStatus.all.accessibilityIdentifier]
        XCTAssertTrue(allFilter.exists)
    }
}
