//
//  Network.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 24/05/23.
//

import Foundation
import Apollo

class Network {
    
    static let shared = Network()
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.contentful.com/content/v1/spaces/zo9df0fwarbc?access_token=H4JmxN699_CTrR_5L4RDFTxbMwrrAnU3UW6mHxJJK08")!)
    
}
