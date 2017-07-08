//
//  XMLParser.swift
//  SplitAndPopover
//
//  Created by xrickliao on 29/06/2017.
//  Copyright © 2017 xrickliao. All rights reserved.
//

import UIKit

@objc protocol RLXMLParserDelegate{
    func parsingWasFinished()
}

class RLXMLParser: NSObject,XMLParserDelegate
{
    var arrParsedData = [Dictionary<String,String>]() // array of diction
    var currentDataDictory = Dictionary<String,String>()
    var currentElement = ""
    var foundCharacters = ""
    var delegate : RLXMLParserDelegate?
    
    
    func startParseWithContentOfURL(rssURL : URL)
    {
        let parser = XMLParser(contentsOf: rssURL)
        parser?.delegate = self
        parser?.parse()
    }
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:])
    {
        debugPrint("parser didStartElement attributes called!")
        currentElement = elementName
    }
    
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        debugPrint("xmlParser, foundCharacters")
        if ((currentElement == "title" && currentElement != "Appcoda") || currentElement == "link" || currentElement == "pubDate")
        {
            foundCharacters += string;
        }
    }
    
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        debugPrint("_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String? called")
        if !foundCharacters.isEmpty
        {
            if elementName == "link"
            {
                foundCharacters = (foundCharacters as NSString).substring(from: 3)
            }
            currentDataDictory[currentElement] = foundCharacters
            foundCharacters = ""
            if currentElement == "pubDate"
            {
                arrParsedData.append(currentDataDictory)
            }
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        debugPrint("parserDidEndDocument")
        delegate?.parsingWasFinished()
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription)
    }
    
    func parser(_ parser: XMLParser, validationErrorOccurred validationError: Error) {
        print(validationError.localizedDescription)
    }
    
    
}
