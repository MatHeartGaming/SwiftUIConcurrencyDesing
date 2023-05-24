//
//  SectionModel.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 24/05/23.
//

import Foundation

typealias SectionsCollectionData = SectionQuery.Data.SectionCollection

struct SectionsDataCollection: Decodable {
    let sections: [SectionModel]
    
    init(_ sectionsCollection: SectionsCollectionData?) {
        self.sections = sectionsCollection?.sections.map({ section -> SectionModel in
            SectionModel(section)
        }) ?? []
    }
    
    struct SectionModel: Decodable, Identifiable {
        let id: String
        let title: String
        var isPinned : Bool = false
        
        init(_ section: SectionQuery.Data.SectionCollection.Section?) {
            self.id = section?.sys.id ?? ""
            self.title = section?.title ?? ""
        }
    }
}
