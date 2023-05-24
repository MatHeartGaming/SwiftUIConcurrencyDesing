//
//  SectionViewModel.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 24/05/23.
//

import Foundation
import Apollo

class SectionViewModel: ObservableObject {
    
    private let apollo = Network.shared.apollo
    
    @Published public var sections = [SectionsDataCollection.SectionModel]()
    @Published public private(set) var filteredSections = [SectionsDataCollection.SectionModel]()
    
    private func querySections() async throws -> GraphQLResult<SectionQuery.Data>? {
        return await withCheckedContinuation({ continuation in
            apollo.fetch(query: SectionQuery()) {result in
                switch result {
                case .success(let grapghQLResult):
                    continuation.resume(returning: grapghQLResult)
                    print("Successfully got a GraphQL result \(grapghQLResult)")
                case .failure(let error):
                    if let error = error as? Never {
                        continuation.resume(throwing: error)
                    }
                    print("Network or response format error \(error.localizedDescription)")
                }
            }
        })
    }
    
    func fetch() async {
        do {
            let result = try await querySections()
            if let result = result {
                if let sectionCollection = result.data?.sectionCollection {
                    DispatchQueue.main.async { [self] in
                        self.sections = self.process(data: sectionCollection)
                        
                    }
                }
            }
        } catch {
            print("Error", error)
        }
    }
    
    private func process(data : SectionsCollectionData) -> [SectionsDataCollection.SectionModel] {
        let content = SectionsDataCollection.init(data)
        return content.sections
    }
    
    func randomizedSections() async {
        sections.shuffle()
    }
    
    func orderSectionsByPinnes() {
        sections.sort{$0.isPinned && !$1.isPinned}
    }
    
    func filterSections(for text : String) {
        filteredSections = []
        let searchText = text.lowercased()
        
        //MARK: How I would hav done it
        /*filteredSections = sections.filter{ sec in
            sec.title.lowercased().contains(searchText)
        }*/
        
        sections.forEach { section in
            let searchContent = section.title
            if searchContent.lowercased().range(of: searchText, options: .regularExpression) != nil {
                print("Section added: \(section.title)")
                filteredSections.append(section)
            }
        }
    }
    
}
