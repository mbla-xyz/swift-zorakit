// This file was auto-generated using maticzav/swift-graphql. DO NOT EDIT MANUALLY!
import SwiftGraphQL

// MARK: - Operations

enum Operations {}
extension Objects.RootQuery: GraphQLHttpOperation {
    static var operation: String { "query" }
}

// MARK: - Objects

enum Objects {}
extension Objects {
    struct RootQuery {
        let __typename: TypeName = .rootQuery
        let aggregateAttributes: [String: [Objects.AggregateAttribute]]
        let aggregateStat: [String: Objects.AggregateStat]
        let collections: [String: Objects.CollectionConnection]
        let events: [String: Objects.EventConnection]
        let markets: [String: Objects.MarketWithTokenConnection]
        let mints: [String: Objects.MintWithTokenAndMarketsConnection]
        let sales: [String: Objects.SaleWithTokenConnection]
        let search: [String: Objects.SearchResultConnection]
        let token: [String: Objects.TokenWithFullMarketHistory]
        let tokens: [String: Objects.TokenWithMarketsSummaryConnection]

        enum TypeName: String, Codable {
            case rootQuery = "RootQuery"
        }
    }
}

extension Objects.RootQuery: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "aggregateAttributes":
                if let value = try container.decode([Objects.AggregateAttribute]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "aggregateStat":
                if let value = try container.decode(Objects.AggregateStat?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "collections":
                if let value = try container.decode(Objects.CollectionConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "events":
                if let value = try container.decode(Objects.EventConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "markets":
                if let value = try container.decode(Objects.MarketWithTokenConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "mints":
                if let value = try container.decode(Objects.MintWithTokenAndMarketsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sales":
                if let value = try container.decode(Objects.SaleWithTokenConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "search":
                if let value = try container.decode(Objects.SearchResultConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "token":
                if let value = try container.decode(Objects.TokenWithFullMarketHistory?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokens":
                if let value = try container.decode(Objects.TokenWithMarketsSummaryConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        aggregateAttributes = map["aggregateAttributes"]
        aggregateStat = map["aggregateStat"]
        collections = map["collections"]
        events = map["events"]
        markets = map["markets"]
        mints = map["mints"]
        sales = map["sales"]
        search = map["search"]
        token = map["token"]
        tokens = map["tokens"]
    }
}

extension Fields where TypeLock == Objects.RootQuery {
    /// Gets counts, sales volume, and other statistics

    func aggregateStat<Type>(selection: Selection<Type, Objects.AggregateStat>) throws -> Type {
        let field = GraphQLField.composite(
            name: "aggregateStat",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.aggregateStat[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// Gets the total set of NFT attributes

    func aggregateAttributes<Type>(where: InputObjects.AggregateAttributesQueryInput, networks: OptionalArgument<[InputObjects.NetworkInput]> = .absent(), selection: Selection<Type, [Objects.AggregateAttribute]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "aggregateAttributes",
            arguments: [Argument(name: "where", type: "AggregateAttributesQueryInput!", value: `where`), Argument(name: "networks", type: "[NetworkInput!]", value: networks)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.aggregateAttributes[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// NFT collection data

    func collections<Type>(where: OptionalArgument<InputObjects.CollectionsQueryInput> = .absent(), sort: OptionalArgument<InputObjects.CollectionSortKeySortInput> = .absent(), pagination: OptionalArgument<InputObjects.PaginationInput> = .absent(), networks: OptionalArgument<[InputObjects.NetworkInput]> = .absent(), selection: Selection<Type, Objects.CollectionConnection>) throws -> Type {
        let field = GraphQLField.composite(
            name: "collections",
            arguments: [Argument(name: "where", type: "CollectionsQueryInput", value: `where`), Argument(name: "sort", type: "CollectionSortKeySortInput", value: sort), Argument(name: "pagination", type: "PaginationInput", value: pagination), Argument(name: "networks", type: "[NetworkInput!]", value: networks)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collections[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// Contract event information, e.g. Sales, Transfers, Mints, etc.

    func events<Type>(where: OptionalArgument<InputObjects.EventsQueryInput> = .absent(), pagination: OptionalArgument<InputObjects.PaginationInput> = .absent(), sort: OptionalArgument<InputObjects.EventSortKeySortInput> = .absent(), networks: OptionalArgument<[InputObjects.NetworkInput]> = .absent(), filter: OptionalArgument<InputObjects.EventsQueryFilter> = .absent(), selection: Selection<Type, Objects.EventConnection>) throws -> Type {
        let field = GraphQLField.composite(
            name: "events",
            arguments: [Argument(name: "where", type: "EventsQueryInput", value: `where`), Argument(name: "pagination", type: "PaginationInput", value: pagination), Argument(name: "sort", type: "EventSortKeySortInput", value: sort), Argument(name: "networks", type: "[NetworkInput!]", value: networks), Argument(name: "filter", type: "EventsQueryFilter", value: filter)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.events[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// Data for specific ZORA markets, e.g. Buy Now, Auctions, Offers

    func markets<Type>(networks: OptionalArgument<[InputObjects.NetworkInput]> = .absent(), pagination: OptionalArgument<InputObjects.PaginationInput> = .absent(), sort: OptionalArgument<InputObjects.MarketSortKeySortInput> = .absent(), filter: OptionalArgument<InputObjects.MarketsQueryFilter> = .absent(), where: OptionalArgument<InputObjects.MarketsQueryInput> = .absent(), selection: Selection<Type, Objects.MarketWithTokenConnection>) throws -> Type {
        let field = GraphQLField.composite(
            name: "markets",
            arguments: [Argument(name: "networks", type: "[NetworkInput!]", value: networks), Argument(name: "pagination", type: "PaginationInput", value: pagination), Argument(name: "sort", type: "MarketSortKeySortInput", value: sort), Argument(name: "filter", type: "MarketsQueryFilter", value: filter), Argument(name: "where", type: "MarketsQueryInput", value: `where`)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.markets[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// Historical minting data

    func mints<Type>(networks: OptionalArgument<[InputObjects.NetworkInput]> = .absent(), pagination: OptionalArgument<InputObjects.PaginationInput> = .absent(), sort: OptionalArgument<InputObjects.MintSortKeySortInput> = .absent(), filter: OptionalArgument<InputObjects.MintsQueryFilter> = .absent(), where: OptionalArgument<InputObjects.MintsQueryInput> = .absent(), selection: Selection<Type, Objects.MintWithTokenAndMarketsConnection>) throws -> Type {
        let field = GraphQLField.composite(
            name: "mints",
            arguments: [Argument(name: "networks", type: "[NetworkInput!]", value: networks), Argument(name: "pagination", type: "PaginationInput", value: pagination), Argument(name: "sort", type: "MintSortKeySortInput", value: sort), Argument(name: "filter", type: "MintsQueryFilter", value: filter), Argument(name: "where", type: "MintsQueryInput", value: `where`)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.mints[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// Historical sales data from ZORA, OpenSea, LooksRare, 0x, and more

    func sales<Type>(where: OptionalArgument<InputObjects.SalesQueryInput> = .absent(), networks: OptionalArgument<[InputObjects.NetworkInput]> = .absent(), pagination: OptionalArgument<InputObjects.PaginationInput> = .absent(), sort: OptionalArgument<InputObjects.SaleSortKeySortInput> = .absent(), filter: OptionalArgument<InputObjects.SalesQueryFilter> = .absent(), selection: Selection<Type, Objects.SaleWithTokenConnection>) throws -> Type {
        let field = GraphQLField.composite(
            name: "sales",
            arguments: [Argument(name: "where", type: "SalesQueryInput", value: `where`), Argument(name: "networks", type: "[NetworkInput!]", value: networks), Argument(name: "pagination", type: "PaginationInput", value: pagination), Argument(name: "sort", type: "SaleSortKeySortInput", value: sort), Argument(name: "filter", type: "SalesQueryFilter", value: filter)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.sales[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// Gets data for multiple tokens

    func tokens<Type>(networks: OptionalArgument<[InputObjects.NetworkInput]> = .absent(), pagination: OptionalArgument<InputObjects.PaginationInput> = .absent(), sort: OptionalArgument<InputObjects.TokenSortInput> = .absent(), where: OptionalArgument<InputObjects.TokensQueryInput> = .absent(), filter: OptionalArgument<InputObjects.TokensQueryFilter> = .absent(), selection: Selection<Type, Objects.TokenWithMarketsSummaryConnection>) throws -> Type {
        let field = GraphQLField.composite(
            name: "tokens",
            arguments: [Argument(name: "networks", type: "[NetworkInput!]", value: networks), Argument(name: "pagination", type: "PaginationInput", value: pagination), Argument(name: "sort", type: "TokenSortInput", value: sort), Argument(name: "where", type: "TokensQueryInput", value: `where`), Argument(name: "filter", type: "TokensQueryFilter", value: filter)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokens[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// Gets data on a single token

    func token<Type>(token: InputObjects.TokenInput, network: OptionalArgument<InputObjects.NetworkInput> = .absent(), selection: Selection<Type, Objects.TokenWithFullMarketHistory?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "token",
            arguments: [Argument(name: "token", type: "TokenInput!", value: token), Argument(name: "network", type: "NetworkInput", value: network)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.token[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// Returns search results for a query

    func search<Type>(query: InputObjects.SearchQueryInput, pagination: InputObjects.SearchPaginationInput, filter: OptionalArgument<InputObjects.SearchFilter> = .absent(), selection: Selection<Type, Objects.SearchResultConnection>) throws -> Type {
        let field = GraphQLField.composite(
            name: "search",
            arguments: [Argument(name: "query", type: "SearchQueryInput!", value: query), Argument(name: "pagination", type: "SearchPaginationInput!", value: pagination), Argument(name: "filter", type: "SearchFilter", value: filter)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.search[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias RootQuery<T> = Selection<T, Objects.RootQuery>
}

extension Objects {
    struct AggregateStat {
        let __typename: TypeName = .aggregateStat
        let floorPrice: [String: Double]
        let nftCount: [String: Int]
        let ownerCount: [String: Int]
        let ownersByCount: [String: Objects.OwnerCountConnection]
        let salesVolume: [String: Objects.SalesVolume]

        enum TypeName: String, Codable {
            case aggregateStat = "AggregateStat"
        }
    }
}

extension Objects.AggregateStat: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "floorPrice":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "nftCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "ownerCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "ownersByCount":
                if let value = try container.decode(Objects.OwnerCountConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "salesVolume":
                if let value = try container.decode(Objects.SalesVolume?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        floorPrice = map["floorPrice"]
        nftCount = map["nftCount"]
        ownerCount = map["ownerCount"]
        ownersByCount = map["ownersByCount"]
        salesVolume = map["salesVolume"]
    }
}

extension Fields where TypeLock == Objects.AggregateStat {
    func floorPrice(where: InputObjects.CollectionAddressAndAttributesInput, networks: OptionalArgument<[InputObjects.NetworkInput]> = .absent()) throws -> Double? {
        let field = GraphQLField.leaf(
            name: "floorPrice",
            arguments: [Argument(name: "where", type: "CollectionAddressAndAttributesInput!", value: `where`), Argument(name: "networks", type: "[NetworkInput!]", value: networks)]
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.floorPrice[field.alias!]
        case .mocking:
            return nil
        }
    }

    func nftCount(where: InputObjects.CollectionAddressOwnerAddressAttributesInput, networks: OptionalArgument<[InputObjects.NetworkInput]> = .absent()) throws -> Int {
        let field = GraphQLField.leaf(
            name: "nftCount",
            arguments: [Argument(name: "where", type: "CollectionAddressOwnerAddressAttributesInput!", value: `where`), Argument(name: "networks", type: "[NetworkInput!]", value: networks)]
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.nftCount[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }

    func ownerCount(where: InputObjects.CollectionAddressAndAttributesInput, networks: OptionalArgument<[InputObjects.NetworkInput]> = .absent()) throws -> Int {
        let field = GraphQLField.leaf(
            name: "ownerCount",
            arguments: [Argument(name: "where", type: "CollectionAddressAndAttributesInput!", value: `where`), Argument(name: "networks", type: "[NetworkInput!]", value: networks)]
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.ownerCount[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }

    func ownersByCount<Type>(where: InputObjects.CollectionAddressAndAttributesInput, pagination: OptionalArgument<InputObjects.PaginationInput> = .absent(), networks: OptionalArgument<[InputObjects.NetworkInput]> = .absent(), selection: Selection<Type, Objects.OwnerCountConnection>) throws -> Type {
        let field = GraphQLField.composite(
            name: "ownersByCount",
            arguments: [Argument(name: "where", type: "CollectionAddressAndAttributesInput!", value: `where`), Argument(name: "pagination", type: "PaginationInput", value: pagination), Argument(name: "networks", type: "[NetworkInput!]", value: networks)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.ownersByCount[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func salesVolume<Type>(where: InputObjects.CollectionAddressOwnerAddressAttributesInput, timeFilter: OptionalArgument<InputObjects.TimeFilter> = .absent(), networks: OptionalArgument<[InputObjects.NetworkInput]> = .absent(), selection: Selection<Type, Objects.SalesVolume>) throws -> Type {
        let field = GraphQLField.composite(
            name: "salesVolume",
            arguments: [Argument(name: "where", type: "CollectionAddressOwnerAddressAttributesInput!", value: `where`), Argument(name: "timeFilter", type: "TimeFilter", value: timeFilter), Argument(name: "networks", type: "[NetworkInput!]", value: networks)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.salesVolume[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias AggregateStat<T> = Selection<T, Objects.AggregateStat>
}

extension Objects {
    struct OwnerCountConnection {
        let __typename: TypeName = .ownerCountConnection
        let nodes: [String: [Objects.OwnerCount]]
        let pageInfo: [String: Objects.PageInfo]

        enum TypeName: String, Codable {
            case ownerCountConnection = "OwnerCountConnection"
        }
    }
}

extension Objects.OwnerCountConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "nodes":
                if let value = try container.decode([Objects.OwnerCount]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        nodes = map["nodes"]
        pageInfo = map["pageInfo"]
    }
}

extension Fields where TypeLock == Objects.OwnerCountConnection {
    func nodes<Type>(selection: Selection<Type, [Objects.OwnerCount]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "nodes",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.nodes[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias OwnerCountConnection<T> = Selection<T, Objects.OwnerCountConnection>
}

extension Objects {
    struct OwnerCount {
        let __typename: TypeName = .ownerCount
        let count: [String: Int]
        let owner: [String: String]

        enum TypeName: String, Codable {
            case ownerCount = "OwnerCount"
        }
    }
}

extension Objects.OwnerCount: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "count":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "owner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        count = map["count"]
        owner = map["owner"]
    }
}

extension Fields where TypeLock == Objects.OwnerCount {
    func owner() throws -> String {
        let field = GraphQLField.leaf(
            name: "owner",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.owner[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func count() throws -> Int {
        let field = GraphQLField.leaf(
            name: "count",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.count[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias OwnerCount<T> = Selection<T, Objects.OwnerCount>
}

extension Objects {
    struct PageInfo {
        let __typename: TypeName = .pageInfo
        let endCursor: [String: String]
        let hasNextPage: [String: Bool]
        let limit: [String: Int]

        enum TypeName: String, Codable {
            case pageInfo = "PageInfo"
        }
    }
}

extension Objects.PageInfo: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "endCursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "hasNextPage":
                if let value = try container.decode(Bool?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "limit":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        endCursor = map["endCursor"]
        hasNextPage = map["hasNextPage"]
        limit = map["limit"]
    }
}

extension Fields where TypeLock == Objects.PageInfo {
    func limit() throws -> Int {
        let field = GraphQLField.leaf(
            name: "limit",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.limit[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }

    func endCursor() throws -> String? {
        let field = GraphQLField.leaf(
            name: "endCursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.endCursor[field.alias!]
        case .mocking:
            return nil
        }
    }

    func hasNextPage() throws -> Bool {
        let field = GraphQLField.leaf(
            name: "hasNextPage",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.hasNextPage[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Bool.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias PageInfo<T> = Selection<T, Objects.PageInfo>
}

extension Objects {
    struct SalesVolume {
        let __typename: TypeName = .salesVolume
        let chainTokenPrice: [String: Double]
        let totalCount: [String: Int]
        let usdcPrice: [String: Double]

        enum TypeName: String, Codable {
            case salesVolume = "SalesVolume"
        }
    }
}

extension Objects.SalesVolume: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "chainTokenPrice":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "usdcPrice":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        chainTokenPrice = map["chainTokenPrice"]
        totalCount = map["totalCount"]
        usdcPrice = map["usdcPrice"]
    }
}

extension Fields where TypeLock == Objects.SalesVolume {
    func chainTokenPrice() throws -> Double {
        let field = GraphQLField.leaf(
            name: "chainTokenPrice",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.chainTokenPrice[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Double.mockValue
        }
    }

    func usdcPrice() throws -> Double {
        let field = GraphQLField.leaf(
            name: "usdcPrice",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.usdcPrice[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Double.mockValue
        }
    }

    func totalCount() throws -> Int {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.totalCount[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias SalesVolume<T> = Selection<T, Objects.SalesVolume>
}

extension Objects {
    struct AggregateAttribute {
        let __typename: TypeName = .aggregateAttribute
        let traitType: [String: String]
        let valueMetrics: [String: [Objects.AggregateAttributeValue]]

        enum TypeName: String, Codable {
            case aggregateAttribute = "AggregateAttribute"
        }
    }
}

extension Objects.AggregateAttribute: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "traitType":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "valueMetrics":
                if let value = try container.decode([Objects.AggregateAttributeValue]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        traitType = map["traitType"]
        valueMetrics = map["valueMetrics"]
    }
}

extension Fields where TypeLock == Objects.AggregateAttribute {
    func traitType() throws -> String {
        let field = GraphQLField.leaf(
            name: "traitType",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.traitType[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func valueMetrics<Type>(selection: Selection<Type, [Objects.AggregateAttributeValue]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "valueMetrics",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.valueMetrics[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias AggregateAttribute<T> = Selection<T, Objects.AggregateAttribute>
}

extension Objects {
    struct AggregateAttributeValue {
        let __typename: TypeName = .aggregateAttributeValue
        let count: [String: Int]
        let percent: [String: Double]
        let value: [String: String]

        enum TypeName: String, Codable {
            case aggregateAttributeValue = "AggregateAttributeValue"
        }
    }
}

extension Objects.AggregateAttributeValue: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "count":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "percent":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "value":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        count = map["count"]
        percent = map["percent"]
        value = map["value"]
    }
}

extension Fields where TypeLock == Objects.AggregateAttributeValue {
    func value() throws -> String {
        let field = GraphQLField.leaf(
            name: "value",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.value[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func count() throws -> Int {
        let field = GraphQLField.leaf(
            name: "count",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.count[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }

    func percent() throws -> Double {
        let field = GraphQLField.leaf(
            name: "percent",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.percent[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Double.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias AggregateAttributeValue<T> = Selection<T, Objects.AggregateAttributeValue>
}

extension Objects {
    struct CollectionConnection {
        let __typename: TypeName = .collectionConnection
        let nodes: [String: [Objects.Collection]]
        let pageInfo: [String: Objects.PageInfo]

        enum TypeName: String, Codable {
            case collectionConnection = "CollectionConnection"
        }
    }
}

extension Objects.CollectionConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "nodes":
                if let value = try container.decode([Objects.Collection]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        nodes = map["nodes"]
        pageInfo = map["pageInfo"]
    }
}

extension Fields where TypeLock == Objects.CollectionConnection {
    func nodes<Type>(selection: Selection<Type, [Objects.Collection]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "nodes",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.nodes[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias CollectionConnection<T> = Selection<T, Objects.CollectionConnection>
}

extension Objects {
    struct Collection {
        let __typename: TypeName = .collection
        let address: [String: String]
        let attributes: [String: [Objects.CollectionAttribute]]
        let description: [String: String]
        let name: [String: String]
        let networkInfo: [String: Objects.NetworkInfo]
        let symbol: [String: String]
        let totalSupply: [String: Int]

        enum TypeName: String, Codable {
            case collection = "Collection"
        }
    }
}

extension Objects.Collection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "address":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "attributes":
                if let value = try container.decode([Objects.CollectionAttribute]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "description":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "name":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "networkInfo":
                if let value = try container.decode(Objects.NetworkInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "symbol":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalSupply":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        address = map["address"]
        attributes = map["attributes"]
        description = map["description"]
        name = map["name"]
        networkInfo = map["networkInfo"]
        symbol = map["symbol"]
        totalSupply = map["totalSupply"]
    }
}

extension Fields where TypeLock == Objects.Collection {
    func address() throws -> String {
        let field = GraphQLField.leaf(
            name: "address",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.address[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func description() throws -> String {
        let field = GraphQLField.leaf(
            name: "description",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.description[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func name() throws -> String? {
        let field = GraphQLField.leaf(
            name: "name",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.name[field.alias!]
        case .mocking:
            return nil
        }
    }

    func symbol() throws -> String? {
        let field = GraphQLField.leaf(
            name: "symbol",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.symbol[field.alias!]
        case .mocking:
            return nil
        }
    }

    func totalSupply() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalSupply",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalSupply[field.alias!]
        case .mocking:
            return nil
        }
    }

    func networkInfo<Type>(selection: Selection<Type, Objects.NetworkInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "networkInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.networkInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func attributes<Type>(selection: Selection<Type, [Objects.CollectionAttribute]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "attributes",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.attributes[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias Collection<T> = Selection<T, Objects.Collection>
}

extension Objects {
    struct NetworkInfo {
        let __typename: TypeName = .networkInfo
        let chain: [String: Enums.Chain]
        let network: [String: Enums.Network]

        enum TypeName: String, Codable {
            case networkInfo = "NetworkInfo"
        }
    }
}

extension Objects.NetworkInfo: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "chain":
                if let value = try container.decode(Enums.Chain?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "network":
                if let value = try container.decode(Enums.Network?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        chain = map["chain"]
        network = map["network"]
    }
}

extension Fields where TypeLock == Objects.NetworkInfo {
    func network() throws -> Enums.Network {
        let field = GraphQLField.leaf(
            name: "network",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.network[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Enums.Network.allCases.first!
        }
    }

    func chain() throws -> Enums.Chain {
        let field = GraphQLField.leaf(
            name: "chain",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.chain[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Enums.Chain.allCases.first!
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias NetworkInfo<T> = Selection<T, Objects.NetworkInfo>
}

extension Objects {
    struct CollectionAttribute {
        let __typename: TypeName = .collectionAttribute
        let traitType: [String: String]
        let valueMetrics: [String: [Objects.CollectionAttributeValue]]

        enum TypeName: String, Codable {
            case collectionAttribute = "CollectionAttribute"
        }
    }
}

extension Objects.CollectionAttribute: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "traitType":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "valueMetrics":
                if let value = try container.decode([Objects.CollectionAttributeValue]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        traitType = map["traitType"]
        valueMetrics = map["valueMetrics"]
    }
}

extension Fields where TypeLock == Objects.CollectionAttribute {
    func traitType() throws -> String? {
        let field = GraphQLField.leaf(
            name: "traitType",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.traitType[field.alias!]
        case .mocking:
            return nil
        }
    }

    func valueMetrics<Type>(selection: Selection<Type, [Objects.CollectionAttributeValue]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "valueMetrics",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.valueMetrics[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias CollectionAttribute<T> = Selection<T, Objects.CollectionAttribute>
}

extension Objects {
    struct CollectionAttributeValue {
        let __typename: TypeName = .collectionAttributeValue
        let count: [String: Int]
        let percent: [String: Double]
        let value: [String: String]

        enum TypeName: String, Codable {
            case collectionAttributeValue = "CollectionAttributeValue"
        }
    }
}

extension Objects.CollectionAttributeValue: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "count":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "percent":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "value":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        count = map["count"]
        percent = map["percent"]
        value = map["value"]
    }
}

extension Fields where TypeLock == Objects.CollectionAttributeValue {
    func value() throws -> String {
        let field = GraphQLField.leaf(
            name: "value",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.value[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func count() throws -> Int {
        let field = GraphQLField.leaf(
            name: "count",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.count[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }

    func percent() throws -> Double {
        let field = GraphQLField.leaf(
            name: "percent",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.percent[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Double.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias CollectionAttributeValue<T> = Selection<T, Objects.CollectionAttributeValue>
}

extension Objects {
    struct EventConnection {
        let __typename: TypeName = .eventConnection
        let nodes: [String: [Objects.Event]]
        let pageInfo: [String: Objects.PageInfo]

        enum TypeName: String, Codable {
            case eventConnection = "EventConnection"
        }
    }
}

extension Objects.EventConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "nodes":
                if let value = try container.decode([Objects.Event]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        nodes = map["nodes"]
        pageInfo = map["pageInfo"]
    }
}

extension Fields where TypeLock == Objects.EventConnection {
    func nodes<Type>(selection: Selection<Type, [Objects.Event]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "nodes",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.nodes[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias EventConnection<T> = Selection<T, Objects.EventConnection>
}

extension Objects {
    struct Event {
        let __typename: TypeName = .event
        let collectionAddress: [String: String]
        let eventType: [String: Enums.EventType]
        let networkInfo: [String: Objects.NetworkInfo]
        let properties: [String: Unions.EventProperties]
        let tokenId: [String: String]
        let transactionInfo: [String: Objects.TransactionInfo]

        enum TypeName: String, Codable {
            case event = "Event"
        }
    }
}

extension Objects.Event: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "eventType":
                if let value = try container.decode(Enums.EventType?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "networkInfo":
                if let value = try container.decode(Objects.NetworkInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "properties":
                if let value = try container.decode(Unions.EventProperties?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "transactionInfo":
                if let value = try container.decode(Objects.TransactionInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        collectionAddress = map["collectionAddress"]
        eventType = map["eventType"]
        networkInfo = map["networkInfo"]
        properties = map["properties"]
        tokenId = map["tokenId"]
        transactionInfo = map["transactionInfo"]
    }
}

extension Fields where TypeLock == Objects.Event {
    func networkInfo<Type>(selection: Selection<Type, Objects.NetworkInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "networkInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.networkInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func transactionInfo<Type>(selection: Selection<Type, Objects.TransactionInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "transactionInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.transactionInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func eventType() throws -> Enums.EventType {
        let field = GraphQLField.leaf(
            name: "eventType",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.eventType[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Enums.EventType.allCases.first!
        }
    }

    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func tokenId() throws -> String? {
        let field = GraphQLField.leaf(
            name: "tokenId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.tokenId[field.alias!]
        case .mocking:
            return nil
        }
    }

    func properties<Type>(selection: Selection<Type, Unions.EventProperties>) throws -> Type {
        let field = GraphQLField.composite(
            name: "properties",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.properties[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias Event<T> = Selection<T, Objects.Event>
}

extension Objects {
    struct TransactionInfo {
        let __typename: TypeName = .transactionInfo
        let blockNumber: [String: Int]
        let blockTimestamp: [String: DateTime]
        let logIndex: [String: Int]
        let transactionHash: [String: String]

        enum TypeName: String, Codable {
            case transactionInfo = "TransactionInfo"
        }
    }
}

extension Objects.TransactionInfo: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "blockNumber":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "blockTimestamp":
                if let value = try container.decode(DateTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "logIndex":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "transactionHash":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        blockNumber = map["blockNumber"]
        blockTimestamp = map["blockTimestamp"]
        logIndex = map["logIndex"]
        transactionHash = map["transactionHash"]
    }
}

extension Fields where TypeLock == Objects.TransactionInfo {
    func blockNumber() throws -> Int {
        let field = GraphQLField.leaf(
            name: "blockNumber",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.blockNumber[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }

    func blockTimestamp() throws -> DateTime {
        let field = GraphQLField.leaf(
            name: "blockTimestamp",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.blockTimestamp[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return DateTime.mockValue
        }
    }

    func transactionHash() throws -> String? {
        let field = GraphQLField.leaf(
            name: "transactionHash",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.transactionHash[field.alias!]
        case .mocking:
            return nil
        }
    }

    func logIndex() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "logIndex",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.logIndex[field.alias!]
        case .mocking:
            return nil
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias TransactionInfo<T> = Selection<T, Objects.TransactionInfo>
}

extension Objects {
    struct ApprovalEvent {
        let __typename: TypeName = .approvalEvent
        let approvalEventType: [String: Enums.ApprovalEventType]
        let approved: [String: Bool]
        let approvedAddress: [String: String]
        let collectionAddress: [String: String]
        let ownerAddress: [String: String]
        let tokenId: [String: String]

        enum TypeName: String, Codable {
            case approvalEvent = "ApprovalEvent"
        }
    }
}

extension Objects.ApprovalEvent: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "approvalEventType":
                if let value = try container.decode(Enums.ApprovalEventType?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "approved":
                if let value = try container.decode(Bool?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "approvedAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "ownerAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        approvalEventType = map["approvalEventType"]
        approved = map["approved"]
        approvedAddress = map["approvedAddress"]
        collectionAddress = map["collectionAddress"]
        ownerAddress = map["ownerAddress"]
        tokenId = map["tokenId"]
    }
}

extension Fields where TypeLock == Objects.ApprovalEvent {
    func approvalEventType() throws -> Enums.ApprovalEventType {
        let field = GraphQLField.leaf(
            name: "approvalEventType",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.approvalEventType[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Enums.ApprovalEventType.allCases.first!
        }
    }

    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func ownerAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "ownerAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.ownerAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func approvedAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "approvedAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.approvedAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func tokenId() throws -> String? {
        let field = GraphQLField.leaf(
            name: "tokenId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.tokenId[field.alias!]
        case .mocking:
            return nil
        }
    }

    func approved() throws -> Bool? {
        let field = GraphQLField.leaf(
            name: "approved",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.approved[field.alias!]
        case .mocking:
            return nil
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias ApprovalEvent<T> = Selection<T, Objects.ApprovalEvent>
}

extension Objects {
    struct MintEvent {
        let __typename: TypeName = .mintEvent
        let collectionAddress: [String: String]
        let originatorAddress: [String: String]
        let price: [String: Objects.PriceAtTime]
        let toAddress: [String: String]
        let tokenId: [String: String]

        enum TypeName: String, Codable {
            case mintEvent = "MintEvent"
        }
    }
}

extension Objects.MintEvent: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "originatorAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "toAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        collectionAddress = map["collectionAddress"]
        originatorAddress = map["originatorAddress"]
        price = map["price"]
        toAddress = map["toAddress"]
        tokenId = map["tokenId"]
    }
}

extension Fields where TypeLock == Objects.MintEvent {
    func tokenId() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenId[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func originatorAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "originatorAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.originatorAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func toAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "toAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.toAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func price<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "price",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.price[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias MintEvent<T> = Selection<T, Objects.MintEvent>
}

extension Objects {
    struct PriceAtTime {
        let __typename: TypeName = .priceAtTime
        let blockNumber: [String: Int]
        let chainTokenPrice: [String: Objects.CurrencyAmount]
        let nativePrice: [String: Objects.CurrencyAmount]
        let usdcPrice: [String: Objects.CurrencyAmount]

        enum TypeName: String, Codable {
            case priceAtTime = "PriceAtTime"
        }
    }
}

extension Objects.PriceAtTime: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "blockNumber":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "chainTokenPrice":
                if let value = try container.decode(Objects.CurrencyAmount?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "nativePrice":
                if let value = try container.decode(Objects.CurrencyAmount?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "usdcPrice":
                if let value = try container.decode(Objects.CurrencyAmount?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        blockNumber = map["blockNumber"]
        chainTokenPrice = map["chainTokenPrice"]
        nativePrice = map["nativePrice"]
        usdcPrice = map["usdcPrice"]
    }
}

extension Fields where TypeLock == Objects.PriceAtTime {
    func nativePrice<Type>(selection: Selection<Type, Objects.CurrencyAmount>) throws -> Type {
        let field = GraphQLField.composite(
            name: "nativePrice",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.nativePrice[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func blockNumber() throws -> Int {
        let field = GraphQLField.leaf(
            name: "blockNumber",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.blockNumber[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }

    func chainTokenPrice<Type>(selection: Selection<Type, Objects.CurrencyAmount?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "chainTokenPrice",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.chainTokenPrice[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func usdcPrice<Type>(selection: Selection<Type, Objects.CurrencyAmount?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "usdcPrice",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.usdcPrice[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias PriceAtTime<T> = Selection<T, Objects.PriceAtTime>
}

extension Objects {
    struct CurrencyAmount {
        let __typename: TypeName = .currencyAmount
        let currency: [String: Objects.Currency]
        let decimal: [String: Double]
        let raw: [String: String]

        enum TypeName: String, Codable {
            case currencyAmount = "CurrencyAmount"
        }
    }
}

extension Objects.CurrencyAmount: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "currency":
                if let value = try container.decode(Objects.Currency?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "decimal":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "raw":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        currency = map["currency"]
        decimal = map["decimal"]
        raw = map["raw"]
    }
}

extension Fields where TypeLock == Objects.CurrencyAmount {
    func currency<Type>(selection: Selection<Type, Objects.Currency>) throws -> Type {
        let field = GraphQLField.composite(
            name: "currency",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.currency[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func raw() throws -> String {
        let field = GraphQLField.leaf(
            name: "raw",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.raw[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func decimal() throws -> Double {
        let field = GraphQLField.leaf(
            name: "decimal",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.decimal[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Double.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias CurrencyAmount<T> = Selection<T, Objects.CurrencyAmount>
}

extension Objects {
    struct Currency {
        let __typename: TypeName = .currency
        let address: [String: String]
        let decimals: [String: Int]
        let name: [String: String]

        enum TypeName: String, Codable {
            case currency = "Currency"
        }
    }
}

extension Objects.Currency: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "address":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "decimals":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "name":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        address = map["address"]
        decimals = map["decimals"]
        name = map["name"]
    }
}

extension Fields where TypeLock == Objects.Currency {
    func name() throws -> String {
        let field = GraphQLField.leaf(
            name: "name",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.name[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func address() throws -> String {
        let field = GraphQLField.leaf(
            name: "address",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.address[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func decimals() throws -> Int {
        let field = GraphQLField.leaf(
            name: "decimals",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.decimals[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias Currency<T> = Selection<T, Objects.Currency>
}

extension Objects {
    struct Sale {
        let __typename: TypeName = .sale
        let buyerAddress: [String: String]
        let collectionAddress: [String: String]
        let networkInfo: [String: Objects.NetworkInfo]
        let price: [String: Objects.PriceAtTime]
        let saleContractAddress: [String: String]
        let saleType: [String: Enums.SaleType]
        let sellerAddress: [String: String]
        let tokenId: [String: String]
        let transactionInfo: [String: Objects.TransactionInfo]

        enum TypeName: String, Codable {
            case sale = "Sale"
        }
    }
}

extension Objects.Sale: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "buyerAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "networkInfo":
                if let value = try container.decode(Objects.NetworkInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "saleContractAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "saleType":
                if let value = try container.decode(Enums.SaleType?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sellerAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "transactionInfo":
                if let value = try container.decode(Objects.TransactionInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        buyerAddress = map["buyerAddress"]
        collectionAddress = map["collectionAddress"]
        networkInfo = map["networkInfo"]
        price = map["price"]
        saleContractAddress = map["saleContractAddress"]
        saleType = map["saleType"]
        sellerAddress = map["sellerAddress"]
        tokenId = map["tokenId"]
        transactionInfo = map["transactionInfo"]
    }
}

extension Fields where TypeLock == Objects.Sale {
    func saleContractAddress() throws -> String? {
        let field = GraphQLField.leaf(
            name: "saleContractAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.saleContractAddress[field.alias!]
        case .mocking:
            return nil
        }
    }

    func transactionInfo<Type>(selection: Selection<Type, Objects.TransactionInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "transactionInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.transactionInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func networkInfo<Type>(selection: Selection<Type, Objects.NetworkInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "networkInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.networkInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func buyerAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "buyerAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.buyerAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func saleType() throws -> Enums.SaleType {
        let field = GraphQLField.leaf(
            name: "saleType",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.saleType[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Enums.SaleType.allCases.first!
        }
    }

    func price<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "price",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.price[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func sellerAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "sellerAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.sellerAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func tokenId() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenId[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias Sale<T> = Selection<T, Objects.Sale>
}

extension Objects {
    struct TransferEvent {
        let __typename: TypeName = .transferEvent
        let collectionAddress: [String: String]
        let fromAddress: [String: String]
        let toAddress: [String: String]
        let tokenId: [String: String]

        enum TypeName: String, Codable {
            case transferEvent = "TransferEvent"
        }
    }
}

extension Objects.TransferEvent: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "fromAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "toAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        collectionAddress = map["collectionAddress"]
        fromAddress = map["fromAddress"]
        toAddress = map["toAddress"]
        tokenId = map["tokenId"]
    }
}

extension Fields where TypeLock == Objects.TransferEvent {
    func fromAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "fromAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.fromAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func toAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "toAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.toAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func tokenId() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenId[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias TransferEvent<T> = Selection<T, Objects.TransferEvent>
}

extension Objects {
    struct V1MarketEvent {
        let __typename: TypeName = .v1MarketEvent
        let address: [String: String]
        let collectionAddress: [String: String]
        let properties: [String: Unions.V1MarketEventProperties]
        let tokenId: [String: String]
        let v1MarketEventType: [String: Enums.V1MarketEventType]

        enum TypeName: String, Codable {
            case v1MarketEvent = "V1MarketEvent"
        }
    }
}

extension Objects.V1MarketEvent: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "address":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "properties":
                if let value = try container.decode(Unions.V1MarketEventProperties?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "v1MarketEventType":
                if let value = try container.decode(Enums.V1MarketEventType?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        address = map["address"]
        collectionAddress = map["collectionAddress"]
        properties = map["properties"]
        tokenId = map["tokenId"]
        v1MarketEventType = map["v1MarketEventType"]
    }
}

extension Fields where TypeLock == Objects.V1MarketEvent {
    func v1MarketEventType() throws -> Enums.V1MarketEventType {
        let field = GraphQLField.leaf(
            name: "v1MarketEventType",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.v1MarketEventType[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Enums.V1MarketEventType.allCases.first!
        }
    }

    func address() throws -> String {
        let field = GraphQLField.leaf(
            name: "address",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.address[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func tokenId() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenId[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func properties<Type>(selection: Selection<Type, Unions.V1MarketEventProperties>) throws -> Type {
        let field = GraphQLField.composite(
            name: "properties",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.properties[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V1MarketEvent<T> = Selection<T, Objects.V1MarketEvent>
}

extension Objects {
    struct V1MarketAskCreatedEventProperties {
        let __typename: TypeName = .v1MarketAskCreatedEventProperties
        let amount: [String: String]
        let currency: [String: String]
        let price: [String: Objects.PriceAtTime]

        enum TypeName: String, Codable {
            case v1MarketAskCreatedEventProperties = "V1MarketAskCreatedEventProperties"
        }
    }
}

extension Objects.V1MarketAskCreatedEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "amount":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "currency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        amount = map["amount"]
        currency = map["currency"]
        price = map["price"]
    }
}

extension Fields where TypeLock == Objects.V1MarketAskCreatedEventProperties {
    func amount() throws -> String {
        let field = GraphQLField.leaf(
            name: "amount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.amount[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func price<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "price",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.price[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func currency() throws -> String {
        let field = GraphQLField.leaf(
            name: "currency",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.currency[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V1MarketAskCreatedEventProperties<T> = Selection<T, Objects.V1MarketAskCreatedEventProperties>
}

extension Objects {
    struct V1MarketAskRemovedEventProperties {
        let __typename: TypeName = .v1MarketAskRemovedEventProperties
        let amount: [String: String]
        let currency: [String: String]
        let price: [String: Objects.PriceAtTime]

        enum TypeName: String, Codable {
            case v1MarketAskRemovedEventProperties = "V1MarketAskRemovedEventProperties"
        }
    }
}

extension Objects.V1MarketAskRemovedEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "amount":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "currency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        amount = map["amount"]
        currency = map["currency"]
        price = map["price"]
    }
}

extension Fields where TypeLock == Objects.V1MarketAskRemovedEventProperties {
    func amount() throws -> String {
        let field = GraphQLField.leaf(
            name: "amount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.amount[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func price<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "price",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.price[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func currency() throws -> String {
        let field = GraphQLField.leaf(
            name: "currency",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.currency[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V1MarketAskRemovedEventProperties<T> = Selection<T, Objects.V1MarketAskRemovedEventProperties>
}

extension Objects {
    struct V1MarketOfferCreatedEventProperties {
        let __typename: TypeName = .v1MarketOfferCreatedEventProperties
        let amount: [String: String]
        let bidder: [String: String]
        let currency: [String: String]
        let price: [String: Objects.PriceAtTime]
        let recipient: [String: String]
        let sellOnShare: [String: String]

        enum TypeName: String, Codable {
            case v1MarketOfferCreatedEventProperties = "V1MarketOfferCreatedEventProperties"
        }
    }
}

extension Objects.V1MarketOfferCreatedEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "amount":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "bidder":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "currency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "recipient":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sellOnShare":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        amount = map["amount"]
        bidder = map["bidder"]
        currency = map["currency"]
        price = map["price"]
        recipient = map["recipient"]
        sellOnShare = map["sellOnShare"]
    }
}

extension Fields where TypeLock == Objects.V1MarketOfferCreatedEventProperties {
    func amount() throws -> String {
        let field = GraphQLField.leaf(
            name: "amount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.amount[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func price<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "price",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.price[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func currency() throws -> String {
        let field = GraphQLField.leaf(
            name: "currency",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.currency[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func bidder() throws -> String {
        let field = GraphQLField.leaf(
            name: "bidder",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.bidder[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func recipient() throws -> String {
        let field = GraphQLField.leaf(
            name: "recipient",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.recipient[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func sellOnShare() throws -> String {
        let field = GraphQLField.leaf(
            name: "sellOnShare",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.sellOnShare[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V1MarketOfferCreatedEventProperties<T> = Selection<T, Objects.V1MarketOfferCreatedEventProperties>
}

extension Objects {
    struct V1MarketOfferFinalizedEventProperties {
        let __typename: TypeName = .v1MarketOfferFinalizedEventProperties
        let amount: [String: String]
        let bidder: [String: String]
        let currency: [String: String]
        let price: [String: Objects.PriceAtTime]
        let recipient: [String: String]
        let sellOnShare: [String: String]

        enum TypeName: String, Codable {
            case v1MarketOfferFinalizedEventProperties = "V1MarketOfferFinalizedEventProperties"
        }
    }
}

extension Objects.V1MarketOfferFinalizedEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "amount":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "bidder":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "currency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "recipient":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sellOnShare":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        amount = map["amount"]
        bidder = map["bidder"]
        currency = map["currency"]
        price = map["price"]
        recipient = map["recipient"]
        sellOnShare = map["sellOnShare"]
    }
}

extension Fields where TypeLock == Objects.V1MarketOfferFinalizedEventProperties {
    func amount() throws -> String {
        let field = GraphQLField.leaf(
            name: "amount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.amount[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func price<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "price",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.price[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func currency() throws -> String {
        let field = GraphQLField.leaf(
            name: "currency",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.currency[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func bidder() throws -> String {
        let field = GraphQLField.leaf(
            name: "bidder",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.bidder[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func recipient() throws -> String {
        let field = GraphQLField.leaf(
            name: "recipient",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.recipient[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func sellOnShare() throws -> String {
        let field = GraphQLField.leaf(
            name: "sellOnShare",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.sellOnShare[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V1MarketOfferFinalizedEventProperties<T> = Selection<T, Objects.V1MarketOfferFinalizedEventProperties>
}

extension Objects {
    struct V1MarketOfferRemovedEventProperties {
        let __typename: TypeName = .v1MarketOfferRemovedEventProperties
        let amount: [String: String]
        let bidder: [String: String]
        let currency: [String: String]
        let price: [String: Objects.PriceAtTime]
        let recipient: [String: String]
        let sellOnShare: [String: String]

        enum TypeName: String, Codable {
            case v1MarketOfferRemovedEventProperties = "V1MarketOfferRemovedEventProperties"
        }
    }
}

extension Objects.V1MarketOfferRemovedEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "amount":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "bidder":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "currency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "recipient":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sellOnShare":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        amount = map["amount"]
        bidder = map["bidder"]
        currency = map["currency"]
        price = map["price"]
        recipient = map["recipient"]
        sellOnShare = map["sellOnShare"]
    }
}

extension Fields where TypeLock == Objects.V1MarketOfferRemovedEventProperties {
    func amount() throws -> String {
        let field = GraphQLField.leaf(
            name: "amount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.amount[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func price<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "price",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.price[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func currency() throws -> String {
        let field = GraphQLField.leaf(
            name: "currency",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.currency[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func bidder() throws -> String {
        let field = GraphQLField.leaf(
            name: "bidder",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.bidder[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func recipient() throws -> String {
        let field = GraphQLField.leaf(
            name: "recipient",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.recipient[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func sellOnShare() throws -> String {
        let field = GraphQLField.leaf(
            name: "sellOnShare",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.sellOnShare[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V1MarketOfferRemovedEventProperties<T> = Selection<T, Objects.V1MarketOfferRemovedEventProperties>
}

extension Objects {
    struct V1MarketBidShareUpdatedEventProperties {
        let __typename: TypeName = .v1MarketBidShareUpdatedEventProperties
        let creator: [String: String]
        let owner: [String: String]
        let previousOwner: [String: String]

        enum TypeName: String, Codable {
            case v1MarketBidShareUpdatedEventProperties = "V1MarketBidShareUpdatedEventProperties"
        }
    }
}

extension Objects.V1MarketBidShareUpdatedEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "creator":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "owner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "previousOwner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        creator = map["creator"]
        owner = map["owner"]
        previousOwner = map["previousOwner"]
    }
}

extension Fields where TypeLock == Objects.V1MarketBidShareUpdatedEventProperties {
    func previousOwner() throws -> String {
        let field = GraphQLField.leaf(
            name: "previousOwner",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.previousOwner[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func creator() throws -> String {
        let field = GraphQLField.leaf(
            name: "creator",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.creator[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func owner() throws -> String {
        let field = GraphQLField.leaf(
            name: "owner",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.owner[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V1MarketBidShareUpdatedEventProperties<T> = Selection<T, Objects.V1MarketBidShareUpdatedEventProperties>
}

extension Objects {
    struct V2AuctionEvent {
        let __typename: TypeName = .v2AuctionEvent
        let address: [String: String]
        let auctionId: [String: Int]
        let collectionAddress: [String: String]
        let properties: [String: Unions.V2AuctionEventProperties]
        let tokenId: [String: String]
        let v2AuctionEventType: [String: Enums.V2AuctionEventType]

        enum TypeName: String, Codable {
            case v2AuctionEvent = "V2AuctionEvent"
        }
    }
}

extension Objects.V2AuctionEvent: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "address":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "auctionId":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "properties":
                if let value = try container.decode(Unions.V2AuctionEventProperties?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "v2AuctionEventType":
                if let value = try container.decode(Enums.V2AuctionEventType?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        address = map["address"]
        auctionId = map["auctionId"]
        collectionAddress = map["collectionAddress"]
        properties = map["properties"]
        tokenId = map["tokenId"]
        v2AuctionEventType = map["v2AuctionEventType"]
    }
}

extension Fields where TypeLock == Objects.V2AuctionEvent {
    func v2AuctionEventType() throws -> Enums.V2AuctionEventType {
        let field = GraphQLField.leaf(
            name: "v2AuctionEventType",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.v2AuctionEventType[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Enums.V2AuctionEventType.allCases.first!
        }
    }

    func address() throws -> String {
        let field = GraphQLField.leaf(
            name: "address",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.address[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func auctionId() throws -> Int {
        let field = GraphQLField.leaf(
            name: "auctionId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.auctionId[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }

    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func tokenId() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenId[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func properties<Type>(selection: Selection<Type, Unions.V2AuctionEventProperties>) throws -> Type {
        let field = GraphQLField.composite(
            name: "properties",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.properties[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V2AuctionEvent<T> = Selection<T, Objects.V2AuctionEvent>
}

extension Objects {
    struct V2AuctionBidEventProperties {
        let __typename: TypeName = .v2AuctionBidEventProperties
        let extended: [String: Bool]
        let firstBid: [String: Bool]
        let price: [String: Objects.PriceAtTime]
        let sender: [String: String]
        let value: [String: String]

        enum TypeName: String, Codable {
            case v2AuctionBidEventProperties = "V2AuctionBidEventProperties"
        }
    }
}

extension Objects.V2AuctionBidEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "extended":
                if let value = try container.decode(Bool?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "firstBid":
                if let value = try container.decode(Bool?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sender":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "value":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        extended = map["extended"]
        firstBid = map["firstBid"]
        price = map["price"]
        sender = map["sender"]
        value = map["value"]
    }
}

extension Fields where TypeLock == Objects.V2AuctionBidEventProperties {
    func sender() throws -> String {
        let field = GraphQLField.leaf(
            name: "sender",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.sender[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func firstBid() throws -> Bool {
        let field = GraphQLField.leaf(
            name: "firstBid",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.firstBid[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Bool.mockValue
        }
    }

    func extended() throws -> Bool {
        let field = GraphQLField.leaf(
            name: "extended",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.extended[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Bool.mockValue
        }
    }

    func value() throws -> String {
        let field = GraphQLField.leaf(
            name: "value",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.value[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func price<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "price",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.price[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V2AuctionBidEventProperties<T> = Selection<T, Objects.V2AuctionBidEventProperties>
}

extension Objects {
    struct V2AuctionCreatedEventProperties {
        let __typename: TypeName = .v2AuctionCreatedEventProperties
        let auctionCurrency: [String: String]
        let curator: [String: String]
        let curatorFeePercentage: [String: Int]
        let duration: [String: String]
        let price: [String: Objects.PriceAtTime]
        let reservePrice: [String: String]
        let tokenOwner: [String: String]

        enum TypeName: String, Codable {
            case v2AuctionCreatedEventProperties = "V2AuctionCreatedEventProperties"
        }
    }
}

extension Objects.V2AuctionCreatedEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "auctionCurrency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "curator":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "curatorFeePercentage":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "duration":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "reservePrice":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenOwner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        auctionCurrency = map["auctionCurrency"]
        curator = map["curator"]
        curatorFeePercentage = map["curatorFeePercentage"]
        duration = map["duration"]
        price = map["price"]
        reservePrice = map["reservePrice"]
        tokenOwner = map["tokenOwner"]
    }
}

extension Fields where TypeLock == Objects.V2AuctionCreatedEventProperties {
    func auctionCurrency() throws -> String {
        let field = GraphQLField.leaf(
            name: "auctionCurrency",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.auctionCurrency[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func tokenOwner() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenOwner",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenOwner[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func curator() throws -> String {
        let field = GraphQLField.leaf(
            name: "curator",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.curator[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func curatorFeePercentage() throws -> Int {
        let field = GraphQLField.leaf(
            name: "curatorFeePercentage",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.curatorFeePercentage[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }

    func duration() throws -> String {
        let field = GraphQLField.leaf(
            name: "duration",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.duration[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func reservePrice() throws -> String {
        let field = GraphQLField.leaf(
            name: "reservePrice",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.reservePrice[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func price<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "price",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.price[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V2AuctionCreatedEventProperties<T> = Selection<T, Objects.V2AuctionCreatedEventProperties>
}

extension Objects {
    struct V2AuctionCanceledEventProperties {
        let __typename: TypeName = .v2AuctionCanceledEventProperties
        let tokenOwner: [String: String]

        enum TypeName: String, Codable {
            case v2AuctionCanceledEventProperties = "V2AuctionCanceledEventProperties"
        }
    }
}

extension Objects.V2AuctionCanceledEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "tokenOwner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        tokenOwner = map["tokenOwner"]
    }
}

extension Fields where TypeLock == Objects.V2AuctionCanceledEventProperties {
    func tokenOwner() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenOwner",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenOwner[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V2AuctionCanceledEventProperties<T> = Selection<T, Objects.V2AuctionCanceledEventProperties>
}

extension Objects {
    struct V2AuctionDurationExtendedEventProperties {
        let __typename: TypeName = .v2AuctionDurationExtendedEventProperties
        let duration: [String: String]

        enum TypeName: String, Codable {
            case v2AuctionDurationExtendedEventProperties = "V2AuctionDurationExtendedEventProperties"
        }
    }
}

extension Objects.V2AuctionDurationExtendedEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "duration":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        duration = map["duration"]
    }
}

extension Fields where TypeLock == Objects.V2AuctionDurationExtendedEventProperties {
    func duration() throws -> String {
        let field = GraphQLField.leaf(
            name: "duration",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.duration[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V2AuctionDurationExtendedEventProperties<T> = Selection<T, Objects.V2AuctionDurationExtendedEventProperties>
}

extension Objects {
    struct V2AuctionEndedEventProperties {
        let __typename: TypeName = .v2AuctionEndedEventProperties
        let amount: [String: String]
        let auctionCurrency: [String: String]
        let curator: [String: String]
        let curatorFee: [String: String]
        let tokenOwner: [String: String]
        let winner: [String: String]

        enum TypeName: String, Codable {
            case v2AuctionEndedEventProperties = "V2AuctionEndedEventProperties"
        }
    }
}

extension Objects.V2AuctionEndedEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "amount":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "auctionCurrency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "curator":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "curatorFee":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenOwner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "winner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        amount = map["amount"]
        auctionCurrency = map["auctionCurrency"]
        curator = map["curator"]
        curatorFee = map["curatorFee"]
        tokenOwner = map["tokenOwner"]
        winner = map["winner"]
    }
}

extension Fields where TypeLock == Objects.V2AuctionEndedEventProperties {
    func tokenOwner() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenOwner",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenOwner[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func curator() throws -> String {
        let field = GraphQLField.leaf(
            name: "curator",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.curator[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func winner() throws -> String {
        let field = GraphQLField.leaf(
            name: "winner",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.winner[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func auctionCurrency() throws -> String {
        let field = GraphQLField.leaf(
            name: "auctionCurrency",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.auctionCurrency[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func amount() throws -> String {
        let field = GraphQLField.leaf(
            name: "amount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.amount[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func curatorFee() throws -> String {
        let field = GraphQLField.leaf(
            name: "curatorFee",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.curatorFee[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V2AuctionEndedEventProperties<T> = Selection<T, Objects.V2AuctionEndedEventProperties>
}

extension Objects {
    struct V2AuctionReservePriceUpdatedEventProperties {
        let __typename: TypeName = .v2AuctionReservePriceUpdatedEventProperties
        let price: [String: Objects.PriceAtTime]
        let reservePrice: [String: String]

        enum TypeName: String, Codable {
            case v2AuctionReservePriceUpdatedEventProperties = "V2AuctionReservePriceUpdatedEventProperties"
        }
    }
}

extension Objects.V2AuctionReservePriceUpdatedEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "reservePrice":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        price = map["price"]
        reservePrice = map["reservePrice"]
    }
}

extension Fields where TypeLock == Objects.V2AuctionReservePriceUpdatedEventProperties {
    func reservePrice() throws -> String {
        let field = GraphQLField.leaf(
            name: "reservePrice",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.reservePrice[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func price<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "price",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.price[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V2AuctionReservePriceUpdatedEventProperties<T> = Selection<T, Objects.V2AuctionReservePriceUpdatedEventProperties>
}

extension Objects {
    struct V2AuctionApprovalUpdatedEventProperties {
        let __typename: TypeName = .v2AuctionApprovalUpdatedEventProperties
        let approved: [String: Bool]

        enum TypeName: String, Codable {
            case v2AuctionApprovalUpdatedEventProperties = "V2AuctionApprovalUpdatedEventProperties"
        }
    }
}

extension Objects.V2AuctionApprovalUpdatedEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "approved":
                if let value = try container.decode(Bool?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        approved = map["approved"]
    }
}

extension Fields where TypeLock == Objects.V2AuctionApprovalUpdatedEventProperties {
    func approved() throws -> Bool {
        let field = GraphQLField.leaf(
            name: "approved",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.approved[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Bool.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V2AuctionApprovalUpdatedEventProperties<T> = Selection<T, Objects.V2AuctionApprovalUpdatedEventProperties>
}

extension Objects {
    struct V3AskEvent {
        let __typename: TypeName = .v3AskEvent
        let address: [String: String]
        let collectionAddress: [String: String]
        let properties: [String: Unions.V3AskEventProperties]
        let tokenId: [String: String]
        let v3AskEventType: [String: Enums.V3AskEventType]

        enum TypeName: String, Codable {
            case v3AskEvent = "V3AskEvent"
        }
    }
}

extension Objects.V3AskEvent: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "address":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "properties":
                if let value = try container.decode(Unions.V3AskEventProperties?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "v3AskEventType":
                if let value = try container.decode(Enums.V3AskEventType?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        address = map["address"]
        collectionAddress = map["collectionAddress"]
        properties = map["properties"]
        tokenId = map["tokenId"]
        v3AskEventType = map["v3AskEventType"]
    }
}

extension Fields where TypeLock == Objects.V3AskEvent {
    func v3AskEventType() throws -> Enums.V3AskEventType {
        let field = GraphQLField.leaf(
            name: "v3AskEventType",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.v3AskEventType[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Enums.V3AskEventType.allCases.first!
        }
    }

    func address() throws -> String {
        let field = GraphQLField.leaf(
            name: "address",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.address[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func tokenId() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenId[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func properties<Type>(selection: Selection<Type, Unions.V3AskEventProperties>) throws -> Type {
        let field = GraphQLField.composite(
            name: "properties",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.properties[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V3AskEvent<T> = Selection<T, Objects.V3AskEvent>
}

extension Objects {
    struct V3AskCreatedEventProperties {
        let __typename: TypeName = .v3AskCreatedEventProperties
        let askCurrency: [String: String]
        let askPrice: [String: String]
        let findersFeeBps: [String: Int]
        let price: [String: Objects.PriceAtTime]
        let seller: [String: String]
        let sellerFundsRecipient: [String: String]

        enum TypeName: String, Codable {
            case v3AskCreatedEventProperties = "V3AskCreatedEventProperties"
        }
    }
}

extension Objects.V3AskCreatedEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "askCurrency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "askPrice":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "findersFeeBps":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "seller":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sellerFundsRecipient":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        askCurrency = map["askCurrency"]
        askPrice = map["askPrice"]
        findersFeeBps = map["findersFeeBps"]
        price = map["price"]
        seller = map["seller"]
        sellerFundsRecipient = map["sellerFundsRecipient"]
    }
}

extension Fields where TypeLock == Objects.V3AskCreatedEventProperties {
    func seller() throws -> String {
        let field = GraphQLField.leaf(
            name: "seller",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.seller[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func sellerFundsRecipient() throws -> String {
        let field = GraphQLField.leaf(
            name: "sellerFundsRecipient",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.sellerFundsRecipient[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func askCurrency() throws -> String {
        let field = GraphQLField.leaf(
            name: "askCurrency",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.askCurrency[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func askPrice() throws -> String {
        let field = GraphQLField.leaf(
            name: "askPrice",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.askPrice[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func findersFeeBps() throws -> Int {
        let field = GraphQLField.leaf(
            name: "findersFeeBps",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.findersFeeBps[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }

    func price<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "price",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.price[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V3AskCreatedEventProperties<T> = Selection<T, Objects.V3AskCreatedEventProperties>
}

extension Objects {
    struct V3AskCanceledEventProperties {
        let __typename: TypeName = .v3AskCanceledEventProperties
        let askCurrency: [String: String]
        let askPrice: [String: String]
        let findersFeeBps: [String: Int]
        let price: [String: Objects.PriceAtTime]
        let seller: [String: String]
        let sellerFundsRecipient: [String: String]

        enum TypeName: String, Codable {
            case v3AskCanceledEventProperties = "V3AskCanceledEventProperties"
        }
    }
}

extension Objects.V3AskCanceledEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "askCurrency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "askPrice":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "findersFeeBps":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "seller":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sellerFundsRecipient":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        askCurrency = map["askCurrency"]
        askPrice = map["askPrice"]
        findersFeeBps = map["findersFeeBps"]
        price = map["price"]
        seller = map["seller"]
        sellerFundsRecipient = map["sellerFundsRecipient"]
    }
}

extension Fields where TypeLock == Objects.V3AskCanceledEventProperties {
    func seller() throws -> String {
        let field = GraphQLField.leaf(
            name: "seller",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.seller[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func sellerFundsRecipient() throws -> String {
        let field = GraphQLField.leaf(
            name: "sellerFundsRecipient",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.sellerFundsRecipient[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func askCurrency() throws -> String {
        let field = GraphQLField.leaf(
            name: "askCurrency",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.askCurrency[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func askPrice() throws -> String {
        let field = GraphQLField.leaf(
            name: "askPrice",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.askPrice[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func findersFeeBps() throws -> Int {
        let field = GraphQLField.leaf(
            name: "findersFeeBps",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.findersFeeBps[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }

    func price<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "price",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.price[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V3AskCanceledEventProperties<T> = Selection<T, Objects.V3AskCanceledEventProperties>
}

extension Objects {
    struct V3AskPriceUpdatedEventProperties {
        let __typename: TypeName = .v3AskPriceUpdatedEventProperties
        let askCurrency: [String: String]
        let askPrice: [String: String]
        let findersFeeBps: [String: Int]
        let price: [String: Objects.PriceAtTime]
        let seller: [String: String]
        let sellerFundsRecipient: [String: String]

        enum TypeName: String, Codable {
            case v3AskPriceUpdatedEventProperties = "V3AskPriceUpdatedEventProperties"
        }
    }
}

extension Objects.V3AskPriceUpdatedEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "askCurrency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "askPrice":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "findersFeeBps":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "seller":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sellerFundsRecipient":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        askCurrency = map["askCurrency"]
        askPrice = map["askPrice"]
        findersFeeBps = map["findersFeeBps"]
        price = map["price"]
        seller = map["seller"]
        sellerFundsRecipient = map["sellerFundsRecipient"]
    }
}

extension Fields where TypeLock == Objects.V3AskPriceUpdatedEventProperties {
    func seller() throws -> String {
        let field = GraphQLField.leaf(
            name: "seller",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.seller[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func sellerFundsRecipient() throws -> String {
        let field = GraphQLField.leaf(
            name: "sellerFundsRecipient",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.sellerFundsRecipient[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func askCurrency() throws -> String {
        let field = GraphQLField.leaf(
            name: "askCurrency",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.askCurrency[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func askPrice() throws -> String {
        let field = GraphQLField.leaf(
            name: "askPrice",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.askPrice[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func findersFeeBps() throws -> Int {
        let field = GraphQLField.leaf(
            name: "findersFeeBps",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.findersFeeBps[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }

    func price<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "price",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.price[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V3AskPriceUpdatedEventProperties<T> = Selection<T, Objects.V3AskPriceUpdatedEventProperties>
}

extension Objects {
    struct V3AskFilledEventProperties {
        let __typename: TypeName = .v3AskFilledEventProperties
        let askCurrency: [String: String]
        let askPrice: [String: String]
        let buyer: [String: String]
        let finder: [String: String]
        let findersFeeBps: [String: Int]
        let price: [String: Objects.PriceAtTime]
        let seller: [String: String]
        let sellerFundsRecipient: [String: String]

        enum TypeName: String, Codable {
            case v3AskFilledEventProperties = "V3AskFilledEventProperties"
        }
    }
}

extension Objects.V3AskFilledEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "askCurrency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "askPrice":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "buyer":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "finder":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "findersFeeBps":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "seller":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sellerFundsRecipient":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        askCurrency = map["askCurrency"]
        askPrice = map["askPrice"]
        buyer = map["buyer"]
        finder = map["finder"]
        findersFeeBps = map["findersFeeBps"]
        price = map["price"]
        seller = map["seller"]
        sellerFundsRecipient = map["sellerFundsRecipient"]
    }
}

extension Fields where TypeLock == Objects.V3AskFilledEventProperties {
    func seller() throws -> String {
        let field = GraphQLField.leaf(
            name: "seller",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.seller[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func sellerFundsRecipient() throws -> String {
        let field = GraphQLField.leaf(
            name: "sellerFundsRecipient",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.sellerFundsRecipient[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func askCurrency() throws -> String {
        let field = GraphQLField.leaf(
            name: "askCurrency",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.askCurrency[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func askPrice() throws -> String {
        let field = GraphQLField.leaf(
            name: "askPrice",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.askPrice[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func findersFeeBps() throws -> Int {
        let field = GraphQLField.leaf(
            name: "findersFeeBps",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.findersFeeBps[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }

    func buyer() throws -> String {
        let field = GraphQLField.leaf(
            name: "buyer",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.buyer[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func finder() throws -> String {
        let field = GraphQLField.leaf(
            name: "finder",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.finder[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func price<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "price",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.price[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V3AskFilledEventProperties<T> = Selection<T, Objects.V3AskFilledEventProperties>
}

extension Objects {
    struct MarketWithTokenConnection {
        let __typename: TypeName = .marketWithTokenConnection
        let nodes: [String: [Objects.MarketWithToken]]
        let pageInfo: [String: Objects.PageInfo]

        enum TypeName: String, Codable {
            case marketWithTokenConnection = "MarketWithTokenConnection"
        }
    }
}

extension Objects.MarketWithTokenConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "nodes":
                if let value = try container.decode([Objects.MarketWithToken]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        nodes = map["nodes"]
        pageInfo = map["pageInfo"]
    }
}

extension Fields where TypeLock == Objects.MarketWithTokenConnection {
    func nodes<Type>(selection: Selection<Type, [Objects.MarketWithToken]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "nodes",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.nodes[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias MarketWithTokenConnection<T> = Selection<T, Objects.MarketWithTokenConnection>
}

extension Objects {
    struct MarketWithToken {
        let __typename: TypeName = .marketWithToken
        let market: [String: Objects.Market]
        let token: [String: Objects.Token]

        enum TypeName: String, Codable {
            case marketWithToken = "MarketWithToken"
        }
    }
}

extension Objects.MarketWithToken: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "market":
                if let value = try container.decode(Objects.Market?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "token":
                if let value = try container.decode(Objects.Token?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        market = map["market"]
        token = map["token"]
    }
}

extension Fields where TypeLock == Objects.MarketWithToken {
    func market<Type>(selection: Selection<Type, Objects.Market>) throws -> Type {
        let field = GraphQLField.composite(
            name: "market",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.market[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func token<Type>(selection: Selection<Type, Objects.Token?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "token",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.token[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias MarketWithToken<T> = Selection<T, Objects.MarketWithToken>
}

extension Objects {
    struct Market {
        let __typename: TypeName = .market
        let collectionAddress: [String: String]
        let marketAddress: [String: String]
        let marketType: [String: Enums.MarketType]
        let networkInfo: [String: Objects.NetworkInfo]
        let price: [String: Objects.PriceAtTime]
        let properties: [String: Unions.MarketProperties]
        let status: [String: String]
        let tokenId: [String: String]
        let transactionInfo: [String: Objects.TransactionInfo]

        enum TypeName: String, Codable {
            case market = "Market"
        }
    }
}

extension Objects.Market: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "marketAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "marketType":
                if let value = try container.decode(Enums.MarketType?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "networkInfo":
                if let value = try container.decode(Objects.NetworkInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "properties":
                if let value = try container.decode(Unions.MarketProperties?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "status":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "transactionInfo":
                if let value = try container.decode(Objects.TransactionInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        collectionAddress = map["collectionAddress"]
        marketAddress = map["marketAddress"]
        marketType = map["marketType"]
        networkInfo = map["networkInfo"]
        price = map["price"]
        properties = map["properties"]
        status = map["status"]
        tokenId = map["tokenId"]
        transactionInfo = map["transactionInfo"]
    }
}

extension Fields where TypeLock == Objects.Market {
    func networkInfo<Type>(selection: Selection<Type, Objects.NetworkInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "networkInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.networkInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func transactionInfo<Type>(selection: Selection<Type, Objects.TransactionInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "transactionInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.transactionInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func status() throws -> String {
        let field = GraphQLField.leaf(
            name: "status",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.status[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func marketAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "marketAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.marketAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func tokenId() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenId[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func marketType() throws -> Enums.MarketType {
        let field = GraphQLField.leaf(
            name: "marketType",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.marketType[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Enums.MarketType.allCases.first!
        }
    }

    func properties<Type>(selection: Selection<Type, Unions.MarketProperties>) throws -> Type {
        let field = GraphQLField.composite(
            name: "properties",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.properties[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func price<Type>(selection: Selection<Type, Objects.PriceAtTime?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "price",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.price[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias Market<T> = Selection<T, Objects.Market>
}

extension Objects {
    struct V1Ask {
        let __typename: TypeName = .v1Ask
        let amount: [String: Objects.PriceAtTime]
        let collectionAddress: [String: String]
        let currency: [String: String]
        let tokenId: [String: String]
        let v1AskStatus: [String: Enums.V1MarketEntityStatus]

        enum TypeName: String, Codable {
            case v1Ask = "V1Ask"
        }
    }
}

extension Objects.V1Ask: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "amount":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "currency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "v1AskStatus":
                if let value = try container.decode(Enums.V1MarketEntityStatus?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        amount = map["amount"]
        collectionAddress = map["collectionAddress"]
        currency = map["currency"]
        tokenId = map["tokenId"]
        v1AskStatus = map["v1AskStatus"]
    }
}

extension Fields where TypeLock == Objects.V1Ask {
    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func tokenId() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenId[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func amount<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "amount",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.amount[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func currency() throws -> String {
        let field = GraphQLField.leaf(
            name: "currency",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.currency[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func v1AskStatus() throws -> Enums.V1MarketEntityStatus {
        let field = GraphQLField.leaf(
            name: "v1AskStatus",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.v1AskStatus[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Enums.V1MarketEntityStatus.allCases.first!
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V1Ask<T> = Selection<T, Objects.V1Ask>
}

extension Objects {
    struct V1Offer {
        let __typename: TypeName = .v1Offer
        let amount: [String: Objects.PriceAtTime]
        let bidder: [String: String]
        let collectionAddress: [String: String]
        let currency: [String: String]
        let recipient: [String: String]
        let sellOnShare: [String: String]
        let tokenId: [String: String]
        let v1OfferStatus: [String: Enums.V1MarketEntityStatus]

        enum TypeName: String, Codable {
            case v1Offer = "V1Offer"
        }
    }
}

extension Objects.V1Offer: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "amount":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "bidder":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "currency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "recipient":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sellOnShare":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "v1OfferStatus":
                if let value = try container.decode(Enums.V1MarketEntityStatus?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        amount = map["amount"]
        bidder = map["bidder"]
        collectionAddress = map["collectionAddress"]
        currency = map["currency"]
        recipient = map["recipient"]
        sellOnShare = map["sellOnShare"]
        tokenId = map["tokenId"]
        v1OfferStatus = map["v1OfferStatus"]
    }
}

extension Fields where TypeLock == Objects.V1Offer {
    func amount<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "amount",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.amount[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func currency() throws -> String {
        let field = GraphQLField.leaf(
            name: "currency",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.currency[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func bidder() throws -> String {
        let field = GraphQLField.leaf(
            name: "bidder",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.bidder[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func recipient() throws -> String {
        let field = GraphQLField.leaf(
            name: "recipient",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.recipient[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func sellOnShare() throws -> String {
        let field = GraphQLField.leaf(
            name: "sellOnShare",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.sellOnShare[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func tokenId() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenId[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func v1OfferStatus() throws -> Enums.V1MarketEntityStatus {
        let field = GraphQLField.leaf(
            name: "v1OfferStatus",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.v1OfferStatus[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Enums.V1MarketEntityStatus.allCases.first!
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V1Offer<T> = Selection<T, Objects.V1Offer>
}

extension Objects {
    struct V1BidShare {
        let __typename: TypeName = .v1BidShare
        let collectionAddress: [String: String]
        let creator: [String: String]
        let owner: [String: String]
        let previousOwner: [String: String]
        let tokenId: [String: String]
        let v1BidShareStatus: [String: Enums.V1MarketEntityStatus]

        enum TypeName: String, Codable {
            case v1BidShare = "V1BidShare"
        }
    }
}

extension Objects.V1BidShare: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "creator":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "owner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "previousOwner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "v1BidShareStatus":
                if let value = try container.decode(Enums.V1MarketEntityStatus?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        collectionAddress = map["collectionAddress"]
        creator = map["creator"]
        owner = map["owner"]
        previousOwner = map["previousOwner"]
        tokenId = map["tokenId"]
        v1BidShareStatus = map["v1BidShareStatus"]
    }
}

extension Fields where TypeLock == Objects.V1BidShare {
    func tokenId() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenId[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func previousOwner() throws -> String {
        let field = GraphQLField.leaf(
            name: "previousOwner",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.previousOwner[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func creator() throws -> String {
        let field = GraphQLField.leaf(
            name: "creator",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.creator[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func owner() throws -> String {
        let field = GraphQLField.leaf(
            name: "owner",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.owner[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func v1BidShareStatus() throws -> Enums.V1MarketEntityStatus {
        let field = GraphQLField.leaf(
            name: "v1BidShareStatus",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.v1BidShareStatus[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Enums.V1MarketEntityStatus.allCases.first!
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V1BidShare<T> = Selection<T, Objects.V1BidShare>
}

extension Objects {
    struct V2Auction {
        let __typename: TypeName = .v2Auction
        let address: [String: String]
        let amountCuratorReceived: [String: Objects.PriceAtTime]
        let amountTokenOwnerReceived: [String: Objects.PriceAtTime]
        let approved: [String: Bool]
        let auctionCurrency: [String: String]
        let auctionId: [String: String]
        let collectionAddress: [String: String]
        let curator: [String: String]
        let curatorFeePercentage: [String: Int]
        let duration: [String: String]
        let estimatedExpirationTime: [String: DateTime]
        let firstBidTime: [String: DateTime]
        let highestBidPrice: [String: Objects.PriceAtTime]
        let highestBidder: [String: String]
        let reservePrice: [String: Objects.PriceAtTime]
        let tokenId: [String: String]
        let tokenOwner: [String: String]
        let v2AuctionStatus: [String: Enums.V2AuctionStatus]

        enum TypeName: String, Codable {
            case v2Auction = "V2Auction"
        }
    }
}

extension Objects.V2Auction: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "address":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "amountCuratorReceived":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "amountTokenOwnerReceived":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "approved":
                if let value = try container.decode(Bool?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "auctionCurrency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "auctionId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "curator":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "curatorFeePercentage":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "duration":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "estimatedExpirationTime":
                if let value = try container.decode(DateTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "firstBidTime":
                if let value = try container.decode(DateTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "highestBidPrice":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "highestBidder":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "reservePrice":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenOwner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "v2AuctionStatus":
                if let value = try container.decode(Enums.V2AuctionStatus?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        address = map["address"]
        amountCuratorReceived = map["amountCuratorReceived"]
        amountTokenOwnerReceived = map["amountTokenOwnerReceived"]
        approved = map["approved"]
        auctionCurrency = map["auctionCurrency"]
        auctionId = map["auctionId"]
        collectionAddress = map["collectionAddress"]
        curator = map["curator"]
        curatorFeePercentage = map["curatorFeePercentage"]
        duration = map["duration"]
        estimatedExpirationTime = map["estimatedExpirationTime"]
        firstBidTime = map["firstBidTime"]
        highestBidPrice = map["highestBidPrice"]
        highestBidder = map["highestBidder"]
        reservePrice = map["reservePrice"]
        tokenId = map["tokenId"]
        tokenOwner = map["tokenOwner"]
        v2AuctionStatus = map["v2AuctionStatus"]
    }
}

extension Fields where TypeLock == Objects.V2Auction {
    func address() throws -> String {
        let field = GraphQLField.leaf(
            name: "address",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.address[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func tokenId() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenId[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func auctionId() throws -> String {
        let field = GraphQLField.leaf(
            name: "auctionId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.auctionId[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func v2AuctionStatus() throws -> Enums.V2AuctionStatus {
        let field = GraphQLField.leaf(
            name: "v2AuctionStatus",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.v2AuctionStatus[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Enums.V2AuctionStatus.allCases.first!
        }
    }

    func approved() throws -> Bool {
        let field = GraphQLField.leaf(
            name: "approved",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.approved[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Bool.mockValue
        }
    }

    func auctionCurrency() throws -> String {
        let field = GraphQLField.leaf(
            name: "auctionCurrency",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.auctionCurrency[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func highestBidPrice<Type>(selection: Selection<Type, Objects.PriceAtTime?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "highestBidPrice",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.highestBidPrice[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func duration() throws -> String {
        let field = GraphQLField.leaf(
            name: "duration",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.duration[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func firstBidTime() throws -> DateTime? {
        let field = GraphQLField.leaf(
            name: "firstBidTime",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.firstBidTime[field.alias!]
        case .mocking:
            return nil
        }
    }

    func reservePrice<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "reservePrice",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.reservePrice[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func curatorFeePercentage() throws -> Int {
        let field = GraphQLField.leaf(
            name: "curatorFeePercentage",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.curatorFeePercentage[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }

    func tokenOwner() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenOwner",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenOwner[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func highestBidder() throws -> String? {
        let field = GraphQLField.leaf(
            name: "highestBidder",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.highestBidder[field.alias!]
        case .mocking:
            return nil
        }
    }

    func curator() throws -> String {
        let field = GraphQLField.leaf(
            name: "curator",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.curator[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func estimatedExpirationTime() throws -> DateTime? {
        let field = GraphQLField.leaf(
            name: "estimatedExpirationTime",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.estimatedExpirationTime[field.alias!]
        case .mocking:
            return nil
        }
    }

    func amountCuratorReceived<Type>(selection: Selection<Type, Objects.PriceAtTime?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "amountCuratorReceived",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.amountCuratorReceived[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func amountTokenOwnerReceived<Type>(selection: Selection<Type, Objects.PriceAtTime?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "amountTokenOwnerReceived",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.amountTokenOwnerReceived[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V2Auction<T> = Selection<T, Objects.V2Auction>
}

extension Objects {
    struct V3Ask {
        let __typename: TypeName = .v3Ask
        let address: [String: String]
        let askCurrency: [String: String]
        let askPrice: [String: Objects.PriceAtTime]
        let buyer: [String: String]
        let collectionAddress: [String: String]
        let finder: [String: String]
        let findersFeeBps: [String: Int]
        let seller: [String: String]
        let sellerFundsRecipient: [String: String]
        let tokenId: [String: String]
        let v3AskStatus: [String: Enums.V3AskStatus]

        enum TypeName: String, Codable {
            case v3Ask = "V3Ask"
        }
    }
}

extension Objects.V3Ask: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "address":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "askCurrency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "askPrice":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "buyer":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "finder":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "findersFeeBps":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "seller":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sellerFundsRecipient":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "v3AskStatus":
                if let value = try container.decode(Enums.V3AskStatus?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        address = map["address"]
        askCurrency = map["askCurrency"]
        askPrice = map["askPrice"]
        buyer = map["buyer"]
        collectionAddress = map["collectionAddress"]
        finder = map["finder"]
        findersFeeBps = map["findersFeeBps"]
        seller = map["seller"]
        sellerFundsRecipient = map["sellerFundsRecipient"]
        tokenId = map["tokenId"]
        v3AskStatus = map["v3AskStatus"]
    }
}

extension Fields where TypeLock == Objects.V3Ask {
    func v3AskStatus() throws -> Enums.V3AskStatus {
        let field = GraphQLField.leaf(
            name: "v3AskStatus",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.v3AskStatus[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Enums.V3AskStatus.allCases.first!
        }
    }

    func address() throws -> String {
        let field = GraphQLField.leaf(
            name: "address",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.address[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func tokenId() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenId[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func seller() throws -> String {
        let field = GraphQLField.leaf(
            name: "seller",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.seller[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func sellerFundsRecipient() throws -> String {
        let field = GraphQLField.leaf(
            name: "sellerFundsRecipient",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.sellerFundsRecipient[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func askCurrency() throws -> String {
        let field = GraphQLField.leaf(
            name: "askCurrency",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.askCurrency[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func askPrice<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "askPrice",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.askPrice[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func findersFeeBps() throws -> Int {
        let field = GraphQLField.leaf(
            name: "findersFeeBps",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.findersFeeBps[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }

    func buyer() throws -> String? {
        let field = GraphQLField.leaf(
            name: "buyer",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.buyer[field.alias!]
        case .mocking:
            return nil
        }
    }

    func finder() throws -> String? {
        let field = GraphQLField.leaf(
            name: "finder",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.finder[field.alias!]
        case .mocking:
            return nil
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V3Ask<T> = Selection<T, Objects.V3Ask>
}

extension Objects {
    struct Token {
        let __typename: TypeName = .token
        let attributes: [String: [Objects.TokenAttribute]]
        let collectionAddress: [String: String]
        let collectionName: [String: String]
        let content: [String: Objects.TokenContentMedia]
        let description: [String: String]
        let image: [String: Objects.TokenContentMedia]
        let lastRefreshTime: [String: DateTime]
        let metadata: [String: GenericScalar]
        let mintInfo: [String: Objects.MintInfo]
        let name: [String: String]
        let networkInfo: [String: Objects.NetworkInfo]
        let owner: [String: String]
        let tokenContract: [String: Objects.TokenContract]
        let tokenId: [String: String]
        let tokenUrl: [String: String]
        let tokenUrlMimeType: [String: String]

        enum TypeName: String, Codable {
            case token = "Token"
        }
    }
}

extension Objects.Token: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "attributes":
                if let value = try container.decode([Objects.TokenAttribute]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "collectionName":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "content":
                if let value = try container.decode(Objects.TokenContentMedia?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "description":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "image":
                if let value = try container.decode(Objects.TokenContentMedia?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "lastRefreshTime":
                if let value = try container.decode(DateTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "metadata":
                if let value = try container.decode(GenericScalar?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "mintInfo":
                if let value = try container.decode(Objects.MintInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "name":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "networkInfo":
                if let value = try container.decode(Objects.NetworkInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "owner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenContract":
                if let value = try container.decode(Objects.TokenContract?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenUrl":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenUrlMimeType":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        attributes = map["attributes"]
        collectionAddress = map["collectionAddress"]
        collectionName = map["collectionName"]
        content = map["content"]
        description = map["description"]
        image = map["image"]
        lastRefreshTime = map["lastRefreshTime"]
        metadata = map["metadata"]
        mintInfo = map["mintInfo"]
        name = map["name"]
        networkInfo = map["networkInfo"]
        owner = map["owner"]
        tokenContract = map["tokenContract"]
        tokenId = map["tokenId"]
        tokenUrl = map["tokenUrl"]
        tokenUrlMimeType = map["tokenUrlMimeType"]
    }
}

extension Fields where TypeLock == Objects.Token {
    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func tokenId() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenId[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func collectionName() throws -> String? {
        let field = GraphQLField.leaf(
            name: "collectionName",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.collectionName[field.alias!]
        case .mocking:
            return nil
        }
    }

    func mintInfo<Type>(selection: Selection<Type, Objects.MintInfo?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "mintInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.mintInfo[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func networkInfo<Type>(selection: Selection<Type, Objects.NetworkInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "networkInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.networkInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func tokenUrl() throws -> String? {
        let field = GraphQLField.leaf(
            name: "tokenUrl",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.tokenUrl[field.alias!]
        case .mocking:
            return nil
        }
    }

    func tokenUrlMimeType() throws -> String? {
        let field = GraphQLField.leaf(
            name: "tokenUrlMimeType",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.tokenUrlMimeType[field.alias!]
        case .mocking:
            return nil
        }
    }

    func content<Type>(selection: Selection<Type, Objects.TokenContentMedia?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "content",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.content[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func image<Type>(selection: Selection<Type, Objects.TokenContentMedia?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "image",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.image[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func owner() throws -> String? {
        let field = GraphQLField.leaf(
            name: "owner",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.owner[field.alias!]
        case .mocking:
            return nil
        }
    }

    func tokenContract<Type>(selection: Selection<Type, Objects.TokenContract?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "tokenContract",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.tokenContract[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func name() throws -> String? {
        let field = GraphQLField.leaf(
            name: "name",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.name[field.alias!]
        case .mocking:
            return nil
        }
    }

    func description() throws -> String? {
        let field = GraphQLField.leaf(
            name: "description",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.description[field.alias!]
        case .mocking:
            return nil
        }
    }

    func metadata() throws -> GenericScalar? {
        let field = GraphQLField.leaf(
            name: "metadata",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.metadata[field.alias!]
        case .mocking:
            return nil
        }
    }

    func attributes<Type>(selection: Selection<Type, [Objects.TokenAttribute]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "attributes",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.attributes[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func lastRefreshTime() throws -> DateTime? {
        let field = GraphQLField.leaf(
            name: "lastRefreshTime",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.lastRefreshTime[field.alias!]
        case .mocking:
            return nil
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias Token<T> = Selection<T, Objects.Token>
}

extension Objects {
    struct MintInfo {
        let __typename: TypeName = .mintInfo
        let mintContext: [String: Objects.TransactionInfo]
        let originatorAddress: [String: String]
        let price: [String: Objects.PriceAtTime]
        let toAddress: [String: String]

        enum TypeName: String, Codable {
            case mintInfo = "MintInfo"
        }
    }
}

extension Objects.MintInfo: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "mintContext":
                if let value = try container.decode(Objects.TransactionInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "originatorAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "toAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        mintContext = map["mintContext"]
        originatorAddress = map["originatorAddress"]
        price = map["price"]
        toAddress = map["toAddress"]
    }
}

extension Fields where TypeLock == Objects.MintInfo {
    func mintContext<Type>(selection: Selection<Type, Objects.TransactionInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "mintContext",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.mintContext[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func originatorAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "originatorAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.originatorAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func toAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "toAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.toAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func price<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "price",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.price[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias MintInfo<T> = Selection<T, Objects.MintInfo>
}

extension Objects {
    struct TokenContentMedia {
        let __typename: TypeName = .tokenContentMedia
        let mediaEncoding: [String: Unions.ImageEncodingTypesVideoEncodingTypesAudioEncodingTypesUnsupportedEncodingTypes]
        let mimeType: [String: String]
        let size: [String: String]
        let url: [String: String]

        enum TypeName: String, Codable {
            case tokenContentMedia = "TokenContentMedia"
        }
    }
}

extension Objects.TokenContentMedia: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "mediaEncoding":
                if let value = try container.decode(Unions.ImageEncodingTypesVideoEncodingTypesAudioEncodingTypesUnsupportedEncodingTypes?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "mimeType":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "size":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "url":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        mediaEncoding = map["mediaEncoding"]
        mimeType = map["mimeType"]
        size = map["size"]
        url = map["url"]
    }
}

extension Fields where TypeLock == Objects.TokenContentMedia {
    func url() throws -> String? {
        let field = GraphQLField.leaf(
            name: "url",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.url[field.alias!]
        case .mocking:
            return nil
        }
    }

    func mimeType() throws -> String? {
        let field = GraphQLField.leaf(
            name: "mimeType",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.mimeType[field.alias!]
        case .mocking:
            return nil
        }
    }

    func size() throws -> String? {
        let field = GraphQLField.leaf(
            name: "size",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.size[field.alias!]
        case .mocking:
            return nil
        }
    }

    func mediaEncoding<Type>(selection: Selection<Type, Unions.ImageEncodingTypesVideoEncodingTypesAudioEncodingTypesUnsupportedEncodingTypes?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "mediaEncoding",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.mediaEncoding[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias TokenContentMedia<T> = Selection<T, Objects.TokenContentMedia>
}

extension Objects {
    struct ImageEncodingTypes {
        let __typename: TypeName = .imageEncodingTypes
        let large: [String: String]
        let original: [String: String]
        let poster: [String: String]
        let thumbnail: [String: String]

        enum TypeName: String, Codable {
            case imageEncodingTypes = "ImageEncodingTypes"
        }
    }
}

extension Objects.ImageEncodingTypes: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "large":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "original":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "poster":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "thumbnail":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        large = map["large"]
        original = map["original"]
        poster = map["poster"]
        thumbnail = map["thumbnail"]
    }
}

extension Fields where TypeLock == Objects.ImageEncodingTypes {
    func original() throws -> String {
        let field = GraphQLField.leaf(
            name: "original",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.original[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func large() throws -> String? {
        let field = GraphQLField.leaf(
            name: "large",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.large[field.alias!]
        case .mocking:
            return nil
        }
    }

    func poster() throws -> String? {
        let field = GraphQLField.leaf(
            name: "poster",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.poster[field.alias!]
        case .mocking:
            return nil
        }
    }

    func thumbnail() throws -> String? {
        let field = GraphQLField.leaf(
            name: "thumbnail",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.thumbnail[field.alias!]
        case .mocking:
            return nil
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias ImageEncodingTypes<T> = Selection<T, Objects.ImageEncodingTypes>
}

extension Objects {
    struct VideoEncodingTypes {
        let __typename: TypeName = .videoEncodingTypes
        let large: [String: String]
        let original: [String: String]
        let poster: [String: String]
        let preview: [String: String]
        let thumbnail: [String: String]

        enum TypeName: String, Codable {
            case videoEncodingTypes = "VideoEncodingTypes"
        }
    }
}

extension Objects.VideoEncodingTypes: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "large":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "original":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "poster":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "preview":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "thumbnail":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        large = map["large"]
        original = map["original"]
        poster = map["poster"]
        preview = map["preview"]
        thumbnail = map["thumbnail"]
    }
}

extension Fields where TypeLock == Objects.VideoEncodingTypes {
    func original() throws -> String {
        let field = GraphQLField.leaf(
            name: "original",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.original[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func large() throws -> String? {
        let field = GraphQLField.leaf(
            name: "large",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.large[field.alias!]
        case .mocking:
            return nil
        }
    }

    func poster() throws -> String? {
        let field = GraphQLField.leaf(
            name: "poster",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.poster[field.alias!]
        case .mocking:
            return nil
        }
    }

    func preview() throws -> String? {
        let field = GraphQLField.leaf(
            name: "preview",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.preview[field.alias!]
        case .mocking:
            return nil
        }
    }

    func thumbnail() throws -> String? {
        let field = GraphQLField.leaf(
            name: "thumbnail",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.thumbnail[field.alias!]
        case .mocking:
            return nil
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias VideoEncodingTypes<T> = Selection<T, Objects.VideoEncodingTypes>
}

extension Objects {
    struct AudioEncodingTypes {
        let __typename: TypeName = .audioEncodingTypes
        let large: [String: String]
        let original: [String: String]

        enum TypeName: String, Codable {
            case audioEncodingTypes = "AudioEncodingTypes"
        }
    }
}

extension Objects.AudioEncodingTypes: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "large":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "original":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        large = map["large"]
        original = map["original"]
    }
}

extension Fields where TypeLock == Objects.AudioEncodingTypes {
    func original() throws -> String {
        let field = GraphQLField.leaf(
            name: "original",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.original[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func large() throws -> String? {
        let field = GraphQLField.leaf(
            name: "large",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.large[field.alias!]
        case .mocking:
            return nil
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias AudioEncodingTypes<T> = Selection<T, Objects.AudioEncodingTypes>
}

extension Objects {
    struct UnsupportedEncodingTypes {
        let __typename: TypeName = .unsupportedEncodingTypes
        let original: [String: String]

        enum TypeName: String, Codable {
            case unsupportedEncodingTypes = "UnsupportedEncodingTypes"
        }
    }
}

extension Objects.UnsupportedEncodingTypes: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "original":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        original = map["original"]
    }
}

extension Fields where TypeLock == Objects.UnsupportedEncodingTypes {
    func original() throws -> String {
        let field = GraphQLField.leaf(
            name: "original",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.original[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias UnsupportedEncodingTypes<T> = Selection<T, Objects.UnsupportedEncodingTypes>
}

extension Objects {
    struct TokenContract {
        let __typename: TypeName = .tokenContract
        let chain: [String: Int]
        let collectionAddress: [String: String]
        let description: [String: String]
        let name: [String: String]
        let network: [String: String]
        let symbol: [String: String]
        let totalSupply: [String: Int]

        enum TypeName: String, Codable {
            case tokenContract = "TokenContract"
        }
    }
}

extension Objects.TokenContract: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "chain":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "description":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "name":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "network":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "symbol":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalSupply":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        chain = map["chain"]
        collectionAddress = map["collectionAddress"]
        description = map["description"]
        name = map["name"]
        network = map["network"]
        symbol = map["symbol"]
        totalSupply = map["totalSupply"]
    }
}

extension Fields where TypeLock == Objects.TokenContract {
    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func chain() throws -> Int {
        let field = GraphQLField.leaf(
            name: "chain",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.chain[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Int.mockValue
        }
    }

    func name() throws -> String? {
        let field = GraphQLField.leaf(
            name: "name",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.name[field.alias!]
        case .mocking:
            return nil
        }
    }

    func symbol() throws -> String? {
        let field = GraphQLField.leaf(
            name: "symbol",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.symbol[field.alias!]
        case .mocking:
            return nil
        }
    }

    func totalSupply() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalSupply",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalSupply[field.alias!]
        case .mocking:
            return nil
        }
    }

    func description() throws -> String? {
        let field = GraphQLField.leaf(
            name: "description",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.description[field.alias!]
        case .mocking:
            return nil
        }
    }

    func network() throws -> String {
        let field = GraphQLField.leaf(
            name: "network",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.network[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias TokenContract<T> = Selection<T, Objects.TokenContract>
}

extension Objects {
    struct TokenAttribute {
        let __typename: TypeName = .tokenAttribute
        let displayType: [String: String]
        let traitType: [String: String]
        let value: [String: String]

        enum TypeName: String, Codable {
            case tokenAttribute = "TokenAttribute"
        }
    }
}

extension Objects.TokenAttribute: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "displayType":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "traitType":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "value":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        displayType = map["displayType"]
        traitType = map["traitType"]
        value = map["value"]
    }
}

extension Fields where TypeLock == Objects.TokenAttribute {
    func traitType() throws -> String? {
        let field = GraphQLField.leaf(
            name: "traitType",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.traitType[field.alias!]
        case .mocking:
            return nil
        }
    }

    func value() throws -> String? {
        let field = GraphQLField.leaf(
            name: "value",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.value[field.alias!]
        case .mocking:
            return nil
        }
    }

    func displayType() throws -> String? {
        let field = GraphQLField.leaf(
            name: "displayType",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.displayType[field.alias!]
        case .mocking:
            return nil
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias TokenAttribute<T> = Selection<T, Objects.TokenAttribute>
}

extension Objects {
    struct MintWithTokenAndMarketsConnection {
        let __typename: TypeName = .mintWithTokenAndMarketsConnection
        let nodes: [String: [Objects.MintWithTokenAndMarkets]]
        let pageInfo: [String: Objects.PageInfo]

        enum TypeName: String, Codable {
            case mintWithTokenAndMarketsConnection = "MintWithTokenAndMarketsConnection"
        }
    }
}

extension Objects.MintWithTokenAndMarketsConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "nodes":
                if let value = try container.decode([Objects.MintWithTokenAndMarkets]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        nodes = map["nodes"]
        pageInfo = map["pageInfo"]
    }
}

extension Fields where TypeLock == Objects.MintWithTokenAndMarketsConnection {
    func nodes<Type>(selection: Selection<Type, [Objects.MintWithTokenAndMarkets]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "nodes",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.nodes[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias MintWithTokenAndMarketsConnection<T> = Selection<T, Objects.MintWithTokenAndMarketsConnection>
}

extension Objects {
    struct MintWithTokenAndMarkets {
        let __typename: TypeName = .mintWithTokenAndMarkets
        let markets: [String: [Objects.Market]]
        let mint: [String: Objects.Mint]
        let token: [String: Objects.Token]

        enum TypeName: String, Codable {
            case mintWithTokenAndMarkets = "MintWithTokenAndMarkets"
        }
    }
}

extension Objects.MintWithTokenAndMarkets: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "markets":
                if let value = try container.decode([Objects.Market]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "mint":
                if let value = try container.decode(Objects.Mint?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "token":
                if let value = try container.decode(Objects.Token?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        markets = map["markets"]
        mint = map["mint"]
        token = map["token"]
    }
}

extension Fields where TypeLock == Objects.MintWithTokenAndMarkets {
    func mint<Type>(selection: Selection<Type, Objects.Mint>) throws -> Type {
        let field = GraphQLField.composite(
            name: "mint",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.mint[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func token<Type>(selection: Selection<Type, Objects.Token?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "token",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.token[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func markets<Type>(pagination: OptionalArgument<InputObjects.PaginationInput> = .absent(), sort: OptionalArgument<InputObjects.MarketSortKeySortInput> = .absent(), filter: OptionalArgument<InputObjects.MarketsQueryFilter> = .absent(), selection: Selection<Type, [Objects.Market]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "markets",
            arguments: [Argument(name: "pagination", type: "PaginationInput", value: pagination), Argument(name: "sort", type: "MarketSortKeySortInput", value: sort), Argument(name: "filter", type: "MarketsQueryFilter", value: filter)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.markets[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias MintWithTokenAndMarkets<T> = Selection<T, Objects.MintWithTokenAndMarkets>
}

extension Objects {
    struct Mint {
        let __typename: TypeName = .mint
        let collectionAddress: [String: String]
        let networkInfo: [String: Objects.NetworkInfo]
        let originatorAddress: [String: String]
        let price: [String: Objects.PriceAtTime]
        let toAddress: [String: String]
        let tokenId: [String: String]
        let transactionInfo: [String: Objects.TransactionInfo]

        enum TypeName: String, Codable {
            case mint = "Mint"
        }
    }
}

extension Objects.Mint: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "networkInfo":
                if let value = try container.decode(Objects.NetworkInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "originatorAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "toAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "transactionInfo":
                if let value = try container.decode(Objects.TransactionInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        collectionAddress = map["collectionAddress"]
        networkInfo = map["networkInfo"]
        originatorAddress = map["originatorAddress"]
        price = map["price"]
        toAddress = map["toAddress"]
        tokenId = map["tokenId"]
        transactionInfo = map["transactionInfo"]
    }
}

extension Fields where TypeLock == Objects.Mint {
    func tokenId() throws -> String {
        let field = GraphQLField.leaf(
            name: "tokenId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.tokenId[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func originatorAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "originatorAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.originatorAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func toAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "toAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.toAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func price<Type>(selection: Selection<Type, Objects.PriceAtTime>) throws -> Type {
        let field = GraphQLField.composite(
            name: "price",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.price[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func transactionInfo<Type>(selection: Selection<Type, Objects.TransactionInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "transactionInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.transactionInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func networkInfo<Type>(selection: Selection<Type, Objects.NetworkInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "networkInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.networkInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias Mint<T> = Selection<T, Objects.Mint>
}

extension Objects {
    struct SaleWithTokenConnection {
        let __typename: TypeName = .saleWithTokenConnection
        let nodes: [String: [Objects.SaleWithToken]]
        let pageInfo: [String: Objects.PageInfo]

        enum TypeName: String, Codable {
            case saleWithTokenConnection = "SaleWithTokenConnection"
        }
    }
}

extension Objects.SaleWithTokenConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "nodes":
                if let value = try container.decode([Objects.SaleWithToken]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        nodes = map["nodes"]
        pageInfo = map["pageInfo"]
    }
}

extension Fields where TypeLock == Objects.SaleWithTokenConnection {
    func nodes<Type>(selection: Selection<Type, [Objects.SaleWithToken]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "nodes",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.nodes[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias SaleWithTokenConnection<T> = Selection<T, Objects.SaleWithTokenConnection>
}

extension Objects {
    struct SaleWithToken {
        let __typename: TypeName = .saleWithToken
        let sale: [String: Objects.Sale]
        let token: [String: Objects.Token]

        enum TypeName: String, Codable {
            case saleWithToken = "SaleWithToken"
        }
    }
}

extension Objects.SaleWithToken: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "sale":
                if let value = try container.decode(Objects.Sale?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "token":
                if let value = try container.decode(Objects.Token?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        sale = map["sale"]
        token = map["token"]
    }
}

extension Fields where TypeLock == Objects.SaleWithToken {
    func sale<Type>(selection: Selection<Type, Objects.Sale>) throws -> Type {
        let field = GraphQLField.composite(
            name: "sale",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.sale[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func token<Type>(selection: Selection<Type, Objects.Token?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "token",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.token[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias SaleWithToken<T> = Selection<T, Objects.SaleWithToken>
}

extension Objects {
    struct TokenWithMarketsSummaryConnection {
        let __typename: TypeName = .tokenWithMarketsSummaryConnection
        let nodes: [String: [Objects.TokenWithMarketsSummary]]
        let pageInfo: [String: Objects.PageInfo]

        enum TypeName: String, Codable {
            case tokenWithMarketsSummaryConnection = "TokenWithMarketsSummaryConnection"
        }
    }
}

extension Objects.TokenWithMarketsSummaryConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "nodes":
                if let value = try container.decode([Objects.TokenWithMarketsSummary]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        nodes = map["nodes"]
        pageInfo = map["pageInfo"]
    }
}

extension Fields where TypeLock == Objects.TokenWithMarketsSummaryConnection {
    func nodes<Type>(selection: Selection<Type, [Objects.TokenWithMarketsSummary]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "nodes",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.nodes[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias TokenWithMarketsSummaryConnection<T> = Selection<T, Objects.TokenWithMarketsSummaryConnection>
}

extension Objects {
    struct TokenWithMarketsSummary {
        let __typename: TypeName = .tokenWithMarketsSummary
        let events: [String: [Objects.Event]]
        let marketsSummary: [String: [Objects.Market]]
        let sales: [String: [Objects.Sale]]
        let token: [String: Objects.Token]

        enum TypeName: String, Codable {
            case tokenWithMarketsSummary = "TokenWithMarketsSummary"
        }
    }
}

extension Objects.TokenWithMarketsSummary: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "events":
                if let value = try container.decode([Objects.Event]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "marketsSummary":
                if let value = try container.decode([Objects.Market]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sales":
                if let value = try container.decode([Objects.Sale]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "token":
                if let value = try container.decode(Objects.Token?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        events = map["events"]
        marketsSummary = map["marketsSummary"]
        sales = map["sales"]
        token = map["token"]
    }
}

extension Fields where TypeLock == Objects.TokenWithMarketsSummary {
    func token<Type>(selection: Selection<Type, Objects.Token>) throws -> Type {
        let field = GraphQLField.composite(
            name: "token",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.token[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func marketsSummary<Type>(selection: Selection<Type, [Objects.Market]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "marketsSummary",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.marketsSummary[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func events<Type>(pagination: OptionalArgument<InputObjects.PaginationInput> = .absent(), sort: OptionalArgument<InputObjects.EventSortKeySortInput> = .absent(), filter: OptionalArgument<InputObjects.EventsQueryFilter> = .absent(), selection: Selection<Type, [Objects.Event]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "events",
            arguments: [Argument(name: "pagination", type: "PaginationInput", value: pagination), Argument(name: "sort", type: "EventSortKeySortInput", value: sort), Argument(name: "filter", type: "EventsQueryFilter", value: filter)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.events[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func sales<Type>(pagination: OptionalArgument<InputObjects.PaginationInput> = .absent(), sort: OptionalArgument<InputObjects.SaleSortKeySortInput> = .absent(), filter: OptionalArgument<InputObjects.SalesQueryFilter> = .absent(), selection: Selection<Type, [Objects.Sale]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "sales",
            arguments: [Argument(name: "pagination", type: "PaginationInput", value: pagination), Argument(name: "sort", type: "SaleSortKeySortInput", value: sort), Argument(name: "filter", type: "SalesQueryFilter", value: filter)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.sales[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias TokenWithMarketsSummary<T> = Selection<T, Objects.TokenWithMarketsSummary>
}

extension Objects {
    struct TokenWithFullMarketHistory {
        let __typename: TypeName = .tokenWithFullMarketHistory
        let events: [String: [Objects.Event]]
        let markets: [String: [Objects.Market]]
        let sales: [String: [Objects.Sale]]
        let token: [String: Objects.Token]

        enum TypeName: String, Codable {
            case tokenWithFullMarketHistory = "TokenWithFullMarketHistory"
        }
    }
}

extension Objects.TokenWithFullMarketHistory: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "events":
                if let value = try container.decode([Objects.Event]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "markets":
                if let value = try container.decode([Objects.Market]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sales":
                if let value = try container.decode([Objects.Sale]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "token":
                if let value = try container.decode(Objects.Token?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        events = map["events"]
        markets = map["markets"]
        sales = map["sales"]
        token = map["token"]
    }
}

extension Fields where TypeLock == Objects.TokenWithFullMarketHistory {
    func token<Type>(selection: Selection<Type, Objects.Token>) throws -> Type {
        let field = GraphQLField.composite(
            name: "token",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.token[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func markets<Type>(pagination: OptionalArgument<InputObjects.PaginationInput> = .absent(), sort: OptionalArgument<InputObjects.MarketSortKeySortInput> = .absent(), filter: OptionalArgument<InputObjects.MarketsQueryFilter> = .absent(), selection: Selection<Type, [Objects.Market]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "markets",
            arguments: [Argument(name: "pagination", type: "PaginationInput", value: pagination), Argument(name: "sort", type: "MarketSortKeySortInput", value: sort), Argument(name: "filter", type: "MarketsQueryFilter", value: filter)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.markets[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func events<Type>(pagination: OptionalArgument<InputObjects.PaginationInput> = .absent(), sort: OptionalArgument<InputObjects.EventSortKeySortInput> = .absent(), filter: OptionalArgument<InputObjects.EventsQueryFilter> = .absent(), selection: Selection<Type, [Objects.Event]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "events",
            arguments: [Argument(name: "pagination", type: "PaginationInput", value: pagination), Argument(name: "sort", type: "EventSortKeySortInput", value: sort), Argument(name: "filter", type: "EventsQueryFilter", value: filter)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.events[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func sales<Type>(pagination: OptionalArgument<InputObjects.PaginationInput> = .absent(), sort: OptionalArgument<InputObjects.SaleSortKeySortInput> = .absent(), filter: OptionalArgument<InputObjects.SalesQueryFilter> = .absent(), selection: Selection<Type, [Objects.Sale]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "sales",
            arguments: [Argument(name: "pagination", type: "PaginationInput", value: pagination), Argument(name: "sort", type: "SaleSortKeySortInput", value: sort), Argument(name: "filter", type: "SalesQueryFilter", value: filter)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.sales[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias TokenWithFullMarketHistory<T> = Selection<T, Objects.TokenWithFullMarketHistory>
}

extension Objects {
    struct SearchResultConnection {
        let __typename: TypeName = .searchResultConnection
        let nodes: [String: [Objects.SearchResult]]
        let pageInfo: [String: Objects.PageInfo]

        enum TypeName: String, Codable {
            case searchResultConnection = "SearchResultConnection"
        }
    }
}

extension Objects.SearchResultConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "nodes":
                if let value = try container.decode([Objects.SearchResult]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        nodes = map["nodes"]
        pageInfo = map["pageInfo"]
    }
}

extension Fields where TypeLock == Objects.SearchResultConnection {
    func nodes<Type>(selection: Selection<Type, [Objects.SearchResult]>) throws -> Type {
        let field = GraphQLField.composite(
            name: "nodes",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.nodes[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias SearchResultConnection<T> = Selection<T, Objects.SearchResultConnection>
}

extension Objects {
    struct SearchResult {
        let __typename: TypeName = .searchResult
        let collectionAddress: [String: String]
        let description: [String: String]
        let entity: [String: Unions.TokenCollection]
        let entityType: [String: String]
        let name: [String: String]
        let networkInfo: [String: Objects.NetworkInfo]
        let tokenId: [String: String]

        enum TypeName: String, Codable {
            case searchResult = "SearchResult"
        }
    }
}

extension Objects.SearchResult: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "description":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "entity":
                if let value = try container.decode(Unions.TokenCollection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "entityType":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "name":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "networkInfo":
                if let value = try container.decode(Objects.NetworkInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        collectionAddress = map["collectionAddress"]
        description = map["description"]
        entity = map["entity"]
        entityType = map["entityType"]
        name = map["name"]
        networkInfo = map["networkInfo"]
        tokenId = map["tokenId"]
    }
}

extension Fields where TypeLock == Objects.SearchResult {
    func name() throws -> String? {
        let field = GraphQLField.leaf(
            name: "name",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.name[field.alias!]
        case .mocking:
            return nil
        }
    }

    func description() throws -> String? {
        let field = GraphQLField.leaf(
            name: "description",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.description[field.alias!]
        case .mocking:
            return nil
        }
    }

    func entityType() throws -> String {
        let field = GraphQLField.leaf(
            name: "entityType",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.entityType[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func collectionAddress() throws -> String {
        let field = GraphQLField.leaf(
            name: "collectionAddress",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.collectionAddress[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }

    func networkInfo<Type>(selection: Selection<Type, Objects.NetworkInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "networkInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.networkInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    func entity<Type>(selection: Selection<Type, Unions.TokenCollection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "entity",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.entity[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func tokenId() throws -> String? {
        let field = GraphQLField.leaf(
            name: "tokenId",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.tokenId[field.alias!]
        case .mocking:
            return nil
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias SearchResult<T> = Selection<T, Objects.SearchResult>
}

// MARK: - Interfaces

enum Interfaces {}

// MARK: - Unions

enum Unions {}
extension Unions {
    struct EventProperties {
        let __typename: TypeName
        let address: [String: String]
        let approvalEventType: [String: Enums.ApprovalEventType]
        let approved: [String: Bool]
        let approvedAddress: [String: String]
        let auctionId: [String: Int]
        let buyerAddress: [String: String]
        let collectionAddress: [String: String]
        let fromAddress: [String: String]
        let networkInfo: [String: Objects.NetworkInfo]
        let originatorAddress: [String: String]
        let ownerAddress: [String: String]
        let price: [String: Objects.PriceAtTime]
        let properties: [String: Unions.V3AskEventProperties]
        let saleContractAddress: [String: String]
        let saleType: [String: Enums.SaleType]
        let sellerAddress: [String: String]
        let toAddress: [String: String]
        let tokenId: [String: String]
        let transactionInfo: [String: Objects.TransactionInfo]
        let v1MarketEventType: [String: Enums.V1MarketEventType]
        let v2AuctionEventType: [String: Enums.V2AuctionEventType]
        let v3AskEventType: [String: Enums.V3AskEventType]

        enum TypeName: String, Codable {
            case approvalEvent = "ApprovalEvent"
            case mintEvent = "MintEvent"
            case sale = "Sale"
            case transferEvent = "TransferEvent"
            case v1MarketEvent = "V1MarketEvent"
            case v2AuctionEvent = "V2AuctionEvent"
            case v3AskEvent = "V3AskEvent"
        }
    }
}

extension Unions.EventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "address":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "approvalEventType":
                if let value = try container.decode(Enums.ApprovalEventType?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "approved":
                if let value = try container.decode(Bool?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "approvedAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "auctionId":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "buyerAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "fromAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "networkInfo":
                if let value = try container.decode(Objects.NetworkInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "originatorAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "ownerAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "properties":
                if let value = try container.decode(Unions.V3AskEventProperties?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "saleContractAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "saleType":
                if let value = try container.decode(Enums.SaleType?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sellerAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "toAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "transactionInfo":
                if let value = try container.decode(Objects.TransactionInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "v1MarketEventType":
                if let value = try container.decode(Enums.V1MarketEventType?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "v2AuctionEventType":
                if let value = try container.decode(Enums.V2AuctionEventType?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "v3AskEventType":
                if let value = try container.decode(Enums.V3AskEventType?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        __typename = try container.decode(TypeName.self, forKey: DynamicCodingKeys(stringValue: "__typename")!)

        address = map["address"]
        approvalEventType = map["approvalEventType"]
        approved = map["approved"]
        approvedAddress = map["approvedAddress"]
        auctionId = map["auctionId"]
        buyerAddress = map["buyerAddress"]
        collectionAddress = map["collectionAddress"]
        fromAddress = map["fromAddress"]
        networkInfo = map["networkInfo"]
        originatorAddress = map["originatorAddress"]
        ownerAddress = map["ownerAddress"]
        price = map["price"]
        properties = map["properties"]
        saleContractAddress = map["saleContractAddress"]
        saleType = map["saleType"]
        sellerAddress = map["sellerAddress"]
        toAddress = map["toAddress"]
        tokenId = map["tokenId"]
        transactionInfo = map["transactionInfo"]
        v1MarketEventType = map["v1MarketEventType"]
        v2AuctionEventType = map["v2AuctionEventType"]
        v3AskEventType = map["v3AskEventType"]
    }
}

extension Fields where TypeLock == Unions.EventProperties {
    func on<Type>(approvalEvent: Selection<Type, Objects.ApprovalEvent>, mintEvent: Selection<Type, Objects.MintEvent>, sale: Selection<Type, Objects.Sale>, transferEvent: Selection<Type, Objects.TransferEvent>, v1MarketEvent: Selection<Type, Objects.V1MarketEvent>, v2AuctionEvent: Selection<Type, Objects.V2AuctionEvent>, v3AskEvent: Selection<Type, Objects.V3AskEvent>) throws -> Type {
        select([GraphQLField.fragment(type: "ApprovalEvent", selection: approvalEvent.selection), GraphQLField.fragment(type: "MintEvent", selection: mintEvent.selection), GraphQLField.fragment(type: "Sale", selection: sale.selection), GraphQLField.fragment(type: "TransferEvent", selection: transferEvent.selection), GraphQLField.fragment(type: "V1MarketEvent", selection: v1MarketEvent.selection), GraphQLField.fragment(type: "V2AuctionEvent", selection: v2AuctionEvent.selection), GraphQLField.fragment(type: "V3AskEvent", selection: v3AskEvent.selection)])

        switch response {
        case let .decoding(data):
            switch data.__typename {
            case .approvalEvent:
                let data = Objects.ApprovalEvent(approvalEventType: data.approvalEventType, approved: data.approved, approvedAddress: data.approvedAddress, collectionAddress: data.collectionAddress, ownerAddress: data.ownerAddress, tokenId: data.tokenId)
                return try approvalEvent.decode(data: data)
            case .mintEvent:
                let data = Objects.MintEvent(collectionAddress: data.collectionAddress, originatorAddress: data.originatorAddress, price: data.price, toAddress: data.toAddress, tokenId: data.tokenId)
                return try mintEvent.decode(data: data)
            case .sale:
                let data = Objects.Sale(buyerAddress: data.buyerAddress, collectionAddress: data.collectionAddress, networkInfo: data.networkInfo, price: data.price, saleContractAddress: data.saleContractAddress, saleType: data.saleType, sellerAddress: data.sellerAddress, tokenId: data.tokenId, transactionInfo: data.transactionInfo)
                return try sale.decode(data: data)
            case .transferEvent:
                let data = Objects.TransferEvent(collectionAddress: data.collectionAddress, fromAddress: data.fromAddress, toAddress: data.toAddress, tokenId: data.tokenId)
                return try transferEvent.decode(data: data)
            case .v1MarketEvent:
                let data = Objects.V1MarketEvent(address: data.address, collectionAddress: data.collectionAddress, properties: data.properties, tokenId: data.tokenId, v1MarketEventType: data.v1MarketEventType)
                return try v1MarketEvent.decode(data: data)
            case .v2AuctionEvent:
                let data = Objects.V2AuctionEvent(address: data.address, auctionId: data.auctionId, collectionAddress: data.collectionAddress, properties: data.properties, tokenId: data.tokenId, v2AuctionEventType: data.v2AuctionEventType)
                return try v2AuctionEvent.decode(data: data)
            case .v3AskEvent:
                let data = Objects.V3AskEvent(address: data.address, collectionAddress: data.collectionAddress, properties: data.properties, tokenId: data.tokenId, v3AskEventType: data.v3AskEventType)
                return try v3AskEvent.decode(data: data)
            }
        case .mocking:
            return approvalEvent.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias EventProperties<T> = Selection<T, Unions.EventProperties>
}

extension Unions {
    struct V1MarketEventProperties {
        let __typename: TypeName
        let amount: [String: String]
        let bidder: [String: String]
        let creator: [String: String]
        let currency: [String: String]
        let owner: [String: String]
        let previousOwner: [String: String]
        let price: [String: Objects.PriceAtTime]
        let recipient: [String: String]
        let sellOnShare: [String: String]

        enum TypeName: String, Codable {
            case v1MarketAskCreatedEventProperties = "V1MarketAskCreatedEventProperties"
            case v1MarketAskRemovedEventProperties = "V1MarketAskRemovedEventProperties"
            case v1MarketOfferCreatedEventProperties = "V1MarketOfferCreatedEventProperties"
            case v1MarketOfferFinalizedEventProperties = "V1MarketOfferFinalizedEventProperties"
            case v1MarketOfferRemovedEventProperties = "V1MarketOfferRemovedEventProperties"
            case v1MarketBidShareUpdatedEventProperties = "V1MarketBidShareUpdatedEventProperties"
        }
    }
}

extension Unions.V1MarketEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "amount":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "bidder":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "creator":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "currency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "owner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "previousOwner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "recipient":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sellOnShare":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        __typename = try container.decode(TypeName.self, forKey: DynamicCodingKeys(stringValue: "__typename")!)

        amount = map["amount"]
        bidder = map["bidder"]
        creator = map["creator"]
        currency = map["currency"]
        owner = map["owner"]
        previousOwner = map["previousOwner"]
        price = map["price"]
        recipient = map["recipient"]
        sellOnShare = map["sellOnShare"]
    }
}

extension Fields where TypeLock == Unions.V1MarketEventProperties {
    func on<Type>(v1MarketAskCreatedEventProperties: Selection<Type, Objects.V1MarketAskCreatedEventProperties>, v1MarketAskRemovedEventProperties: Selection<Type, Objects.V1MarketAskRemovedEventProperties>, v1MarketOfferCreatedEventProperties: Selection<Type, Objects.V1MarketOfferCreatedEventProperties>, v1MarketOfferFinalizedEventProperties: Selection<Type, Objects.V1MarketOfferFinalizedEventProperties>, v1MarketOfferRemovedEventProperties: Selection<Type, Objects.V1MarketOfferRemovedEventProperties>, v1MarketBidShareUpdatedEventProperties: Selection<Type, Objects.V1MarketBidShareUpdatedEventProperties>) throws -> Type {
        select([GraphQLField.fragment(type: "V1MarketAskCreatedEventProperties", selection: v1MarketAskCreatedEventProperties.selection), GraphQLField.fragment(type: "V1MarketAskRemovedEventProperties", selection: v1MarketAskRemovedEventProperties.selection), GraphQLField.fragment(type: "V1MarketOfferCreatedEventProperties", selection: v1MarketOfferCreatedEventProperties.selection), GraphQLField.fragment(type: "V1MarketOfferFinalizedEventProperties", selection: v1MarketOfferFinalizedEventProperties.selection), GraphQLField.fragment(type: "V1MarketOfferRemovedEventProperties", selection: v1MarketOfferRemovedEventProperties.selection), GraphQLField.fragment(type: "V1MarketBidShareUpdatedEventProperties", selection: v1MarketBidShareUpdatedEventProperties.selection)])

        switch response {
        case let .decoding(data):
            switch data.__typename {
            case .v1MarketAskCreatedEventProperties:
                let data = Objects.V1MarketAskCreatedEventProperties(amount: data.amount, currency: data.currency, price: data.price)
                return try v1MarketAskCreatedEventProperties.decode(data: data)
            case .v1MarketAskRemovedEventProperties:
                let data = Objects.V1MarketAskRemovedEventProperties(amount: data.amount, currency: data.currency, price: data.price)
                return try v1MarketAskRemovedEventProperties.decode(data: data)
            case .v1MarketOfferCreatedEventProperties:
                let data = Objects.V1MarketOfferCreatedEventProperties(amount: data.amount, bidder: data.bidder, currency: data.currency, price: data.price, recipient: data.recipient, sellOnShare: data.sellOnShare)
                return try v1MarketOfferCreatedEventProperties.decode(data: data)
            case .v1MarketOfferFinalizedEventProperties:
                let data = Objects.V1MarketOfferFinalizedEventProperties(amount: data.amount, bidder: data.bidder, currency: data.currency, price: data.price, recipient: data.recipient, sellOnShare: data.sellOnShare)
                return try v1MarketOfferFinalizedEventProperties.decode(data: data)
            case .v1MarketOfferRemovedEventProperties:
                let data = Objects.V1MarketOfferRemovedEventProperties(amount: data.amount, bidder: data.bidder, currency: data.currency, price: data.price, recipient: data.recipient, sellOnShare: data.sellOnShare)
                return try v1MarketOfferRemovedEventProperties.decode(data: data)
            case .v1MarketBidShareUpdatedEventProperties:
                let data = Objects.V1MarketBidShareUpdatedEventProperties(creator: data.creator, owner: data.owner, previousOwner: data.previousOwner)
                return try v1MarketBidShareUpdatedEventProperties.decode(data: data)
            }
        case .mocking:
            return v1MarketAskCreatedEventProperties.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V1MarketEventProperties<T> = Selection<T, Unions.V1MarketEventProperties>
}

extension Unions {
    struct V2AuctionEventProperties {
        let __typename: TypeName
        let amount: [String: String]
        let approved: [String: Bool]
        let auctionCurrency: [String: String]
        let curator: [String: String]
        let curatorFee: [String: String]
        let curatorFeePercentage: [String: Int]
        let duration: [String: String]
        let extended: [String: Bool]
        let firstBid: [String: Bool]
        let price: [String: Objects.PriceAtTime]
        let reservePrice: [String: String]
        let sender: [String: String]
        let tokenOwner: [String: String]
        let value: [String: String]
        let winner: [String: String]

        enum TypeName: String, Codable {
            case v2AuctionBidEventProperties = "V2AuctionBidEventProperties"
            case v2AuctionCreatedEventProperties = "V2AuctionCreatedEventProperties"
            case v2AuctionCanceledEventProperties = "V2AuctionCanceledEventProperties"
            case v2AuctionDurationExtendedEventProperties = "V2AuctionDurationExtendedEventProperties"
            case v2AuctionEndedEventProperties = "V2AuctionEndedEventProperties"
            case v2AuctionReservePriceUpdatedEventProperties = "V2AuctionReservePriceUpdatedEventProperties"
            case v2AuctionApprovalUpdatedEventProperties = "V2AuctionApprovalUpdatedEventProperties"
        }
    }
}

extension Unions.V2AuctionEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "amount":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "approved":
                if let value = try container.decode(Bool?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "auctionCurrency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "curator":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "curatorFee":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "curatorFeePercentage":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "duration":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "extended":
                if let value = try container.decode(Bool?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "firstBid":
                if let value = try container.decode(Bool?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "reservePrice":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sender":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenOwner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "value":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "winner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        __typename = try container.decode(TypeName.self, forKey: DynamicCodingKeys(stringValue: "__typename")!)

        amount = map["amount"]
        approved = map["approved"]
        auctionCurrency = map["auctionCurrency"]
        curator = map["curator"]
        curatorFee = map["curatorFee"]
        curatorFeePercentage = map["curatorFeePercentage"]
        duration = map["duration"]
        extended = map["extended"]
        firstBid = map["firstBid"]
        price = map["price"]
        reservePrice = map["reservePrice"]
        sender = map["sender"]
        tokenOwner = map["tokenOwner"]
        value = map["value"]
        winner = map["winner"]
    }
}

extension Fields where TypeLock == Unions.V2AuctionEventProperties {
    func on<Type>(v2AuctionBidEventProperties: Selection<Type, Objects.V2AuctionBidEventProperties>, v2AuctionCreatedEventProperties: Selection<Type, Objects.V2AuctionCreatedEventProperties>, v2AuctionCanceledEventProperties: Selection<Type, Objects.V2AuctionCanceledEventProperties>, v2AuctionDurationExtendedEventProperties: Selection<Type, Objects.V2AuctionDurationExtendedEventProperties>, v2AuctionEndedEventProperties: Selection<Type, Objects.V2AuctionEndedEventProperties>, v2AuctionReservePriceUpdatedEventProperties: Selection<Type, Objects.V2AuctionReservePriceUpdatedEventProperties>, v2AuctionApprovalUpdatedEventProperties: Selection<Type, Objects.V2AuctionApprovalUpdatedEventProperties>) throws -> Type {
        select([GraphQLField.fragment(type: "V2AuctionBidEventProperties", selection: v2AuctionBidEventProperties.selection), GraphQLField.fragment(type: "V2AuctionCreatedEventProperties", selection: v2AuctionCreatedEventProperties.selection), GraphQLField.fragment(type: "V2AuctionCanceledEventProperties", selection: v2AuctionCanceledEventProperties.selection), GraphQLField.fragment(type: "V2AuctionDurationExtendedEventProperties", selection: v2AuctionDurationExtendedEventProperties.selection), GraphQLField.fragment(type: "V2AuctionEndedEventProperties", selection: v2AuctionEndedEventProperties.selection), GraphQLField.fragment(type: "V2AuctionReservePriceUpdatedEventProperties", selection: v2AuctionReservePriceUpdatedEventProperties.selection), GraphQLField.fragment(type: "V2AuctionApprovalUpdatedEventProperties", selection: v2AuctionApprovalUpdatedEventProperties.selection)])

        switch response {
        case let .decoding(data):
            switch data.__typename {
            case .v2AuctionBidEventProperties:
                let data = Objects.V2AuctionBidEventProperties(extended: data.extended, firstBid: data.firstBid, price: data.price, sender: data.sender, value: data.value)
                return try v2AuctionBidEventProperties.decode(data: data)
            case .v2AuctionCreatedEventProperties:
                let data = Objects.V2AuctionCreatedEventProperties(auctionCurrency: data.auctionCurrency, curator: data.curator, curatorFeePercentage: data.curatorFeePercentage, duration: data.duration, price: data.price, reservePrice: data.reservePrice, tokenOwner: data.tokenOwner)
                return try v2AuctionCreatedEventProperties.decode(data: data)
            case .v2AuctionCanceledEventProperties:
                let data = Objects.V2AuctionCanceledEventProperties(tokenOwner: data.tokenOwner)
                return try v2AuctionCanceledEventProperties.decode(data: data)
            case .v2AuctionDurationExtendedEventProperties:
                let data = Objects.V2AuctionDurationExtendedEventProperties(duration: data.duration)
                return try v2AuctionDurationExtendedEventProperties.decode(data: data)
            case .v2AuctionEndedEventProperties:
                let data = Objects.V2AuctionEndedEventProperties(amount: data.amount, auctionCurrency: data.auctionCurrency, curator: data.curator, curatorFee: data.curatorFee, tokenOwner: data.tokenOwner, winner: data.winner)
                return try v2AuctionEndedEventProperties.decode(data: data)
            case .v2AuctionReservePriceUpdatedEventProperties:
                let data = Objects.V2AuctionReservePriceUpdatedEventProperties(price: data.price, reservePrice: data.reservePrice)
                return try v2AuctionReservePriceUpdatedEventProperties.decode(data: data)
            case .v2AuctionApprovalUpdatedEventProperties:
                let data = Objects.V2AuctionApprovalUpdatedEventProperties(approved: data.approved)
                return try v2AuctionApprovalUpdatedEventProperties.decode(data: data)
            }
        case .mocking:
            return v2AuctionBidEventProperties.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V2AuctionEventProperties<T> = Selection<T, Unions.V2AuctionEventProperties>
}

extension Unions {
    struct V3AskEventProperties {
        let __typename: TypeName
        let askCurrency: [String: String]
        let askPrice: [String: String]
        let buyer: [String: String]
        let finder: [String: String]
        let findersFeeBps: [String: Int]
        let price: [String: Objects.PriceAtTime]
        let seller: [String: String]
        let sellerFundsRecipient: [String: String]

        enum TypeName: String, Codable {
            case v3AskCreatedEventProperties = "V3AskCreatedEventProperties"
            case v3AskCanceledEventProperties = "V3AskCanceledEventProperties"
            case v3AskPriceUpdatedEventProperties = "V3AskPriceUpdatedEventProperties"
            case v3AskFilledEventProperties = "V3AskFilledEventProperties"
        }
    }
}

extension Unions.V3AskEventProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "askCurrency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "askPrice":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "buyer":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "finder":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "findersFeeBps":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "price":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "seller":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sellerFundsRecipient":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        __typename = try container.decode(TypeName.self, forKey: DynamicCodingKeys(stringValue: "__typename")!)

        askCurrency = map["askCurrency"]
        askPrice = map["askPrice"]
        buyer = map["buyer"]
        finder = map["finder"]
        findersFeeBps = map["findersFeeBps"]
        price = map["price"]
        seller = map["seller"]
        sellerFundsRecipient = map["sellerFundsRecipient"]
    }
}

extension Fields where TypeLock == Unions.V3AskEventProperties {
    func on<Type>(v3AskCreatedEventProperties: Selection<Type, Objects.V3AskCreatedEventProperties>, v3AskCanceledEventProperties: Selection<Type, Objects.V3AskCanceledEventProperties>, v3AskPriceUpdatedEventProperties: Selection<Type, Objects.V3AskPriceUpdatedEventProperties>, v3AskFilledEventProperties: Selection<Type, Objects.V3AskFilledEventProperties>) throws -> Type {
        select([GraphQLField.fragment(type: "V3AskCreatedEventProperties", selection: v3AskCreatedEventProperties.selection), GraphQLField.fragment(type: "V3AskCanceledEventProperties", selection: v3AskCanceledEventProperties.selection), GraphQLField.fragment(type: "V3AskPriceUpdatedEventProperties", selection: v3AskPriceUpdatedEventProperties.selection), GraphQLField.fragment(type: "V3AskFilledEventProperties", selection: v3AskFilledEventProperties.selection)])

        switch response {
        case let .decoding(data):
            switch data.__typename {
            case .v3AskCreatedEventProperties:
                let data = Objects.V3AskCreatedEventProperties(askCurrency: data.askCurrency, askPrice: data.askPrice, findersFeeBps: data.findersFeeBps, price: data.price, seller: data.seller, sellerFundsRecipient: data.sellerFundsRecipient)
                return try v3AskCreatedEventProperties.decode(data: data)
            case .v3AskCanceledEventProperties:
                let data = Objects.V3AskCanceledEventProperties(askCurrency: data.askCurrency, askPrice: data.askPrice, findersFeeBps: data.findersFeeBps, price: data.price, seller: data.seller, sellerFundsRecipient: data.sellerFundsRecipient)
                return try v3AskCanceledEventProperties.decode(data: data)
            case .v3AskPriceUpdatedEventProperties:
                let data = Objects.V3AskPriceUpdatedEventProperties(askCurrency: data.askCurrency, askPrice: data.askPrice, findersFeeBps: data.findersFeeBps, price: data.price, seller: data.seller, sellerFundsRecipient: data.sellerFundsRecipient)
                return try v3AskPriceUpdatedEventProperties.decode(data: data)
            case .v3AskFilledEventProperties:
                let data = Objects.V3AskFilledEventProperties(askCurrency: data.askCurrency, askPrice: data.askPrice, buyer: data.buyer, finder: data.finder, findersFeeBps: data.findersFeeBps, price: data.price, seller: data.seller, sellerFundsRecipient: data.sellerFundsRecipient)
                return try v3AskFilledEventProperties.decode(data: data)
            }
        case .mocking:
            return v3AskCreatedEventProperties.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias V3AskEventProperties<T> = Selection<T, Unions.V3AskEventProperties>
}

extension Unions {
    struct MarketProperties {
        let __typename: TypeName
        let address: [String: String]
        let amount: [String: Objects.PriceAtTime]
        let amountCuratorReceived: [String: Objects.PriceAtTime]
        let amountTokenOwnerReceived: [String: Objects.PriceAtTime]
        let approved: [String: Bool]
        let askCurrency: [String: String]
        let askPrice: [String: Objects.PriceAtTime]
        let auctionCurrency: [String: String]
        let auctionId: [String: String]
        let bidder: [String: String]
        let buyer: [String: String]
        let collectionAddress: [String: String]
        let creator: [String: String]
        let curator: [String: String]
        let curatorFeePercentage: [String: Int]
        let currency: [String: String]
        let duration: [String: String]
        let estimatedExpirationTime: [String: DateTime]
        let finder: [String: String]
        let findersFeeBps: [String: Int]
        let firstBidTime: [String: DateTime]
        let highestBidPrice: [String: Objects.PriceAtTime]
        let highestBidder: [String: String]
        let owner: [String: String]
        let previousOwner: [String: String]
        let recipient: [String: String]
        let reservePrice: [String: Objects.PriceAtTime]
        let sellOnShare: [String: String]
        let seller: [String: String]
        let sellerFundsRecipient: [String: String]
        let tokenId: [String: String]
        let tokenOwner: [String: String]
        let v1AskStatus: [String: Enums.V1MarketEntityStatus]
        let v1BidShareStatus: [String: Enums.V1MarketEntityStatus]
        let v1OfferStatus: [String: Enums.V1MarketEntityStatus]
        let v2AuctionStatus: [String: Enums.V2AuctionStatus]
        let v3AskStatus: [String: Enums.V3AskStatus]

        enum TypeName: String, Codable {
            case v1Ask = "V1Ask"
            case v1Offer = "V1Offer"
            case v1BidShare = "V1BidShare"
            case v2Auction = "V2Auction"
            case v3Ask = "V3Ask"
        }
    }
}

extension Unions.MarketProperties: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "address":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "amount":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "amountCuratorReceived":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "amountTokenOwnerReceived":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "approved":
                if let value = try container.decode(Bool?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "askCurrency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "askPrice":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "auctionCurrency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "auctionId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "bidder":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "buyer":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "creator":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "curator":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "curatorFeePercentage":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "currency":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "duration":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "estimatedExpirationTime":
                if let value = try container.decode(DateTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "finder":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "findersFeeBps":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "firstBidTime":
                if let value = try container.decode(DateTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "highestBidPrice":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "highestBidder":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "owner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "previousOwner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "recipient":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "reservePrice":
                if let value = try container.decode(Objects.PriceAtTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sellOnShare":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "seller":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "sellerFundsRecipient":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenOwner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "v1AskStatus":
                if let value = try container.decode(Enums.V1MarketEntityStatus?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "v1BidShareStatus":
                if let value = try container.decode(Enums.V1MarketEntityStatus?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "v1OfferStatus":
                if let value = try container.decode(Enums.V1MarketEntityStatus?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "v2AuctionStatus":
                if let value = try container.decode(Enums.V2AuctionStatus?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "v3AskStatus":
                if let value = try container.decode(Enums.V3AskStatus?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        __typename = try container.decode(TypeName.self, forKey: DynamicCodingKeys(stringValue: "__typename")!)

        address = map["address"]
        amount = map["amount"]
        amountCuratorReceived = map["amountCuratorReceived"]
        amountTokenOwnerReceived = map["amountTokenOwnerReceived"]
        approved = map["approved"]
        askCurrency = map["askCurrency"]
        askPrice = map["askPrice"]
        auctionCurrency = map["auctionCurrency"]
        auctionId = map["auctionId"]
        bidder = map["bidder"]
        buyer = map["buyer"]
        collectionAddress = map["collectionAddress"]
        creator = map["creator"]
        curator = map["curator"]
        curatorFeePercentage = map["curatorFeePercentage"]
        currency = map["currency"]
        duration = map["duration"]
        estimatedExpirationTime = map["estimatedExpirationTime"]
        finder = map["finder"]
        findersFeeBps = map["findersFeeBps"]
        firstBidTime = map["firstBidTime"]
        highestBidPrice = map["highestBidPrice"]
        highestBidder = map["highestBidder"]
        owner = map["owner"]
        previousOwner = map["previousOwner"]
        recipient = map["recipient"]
        reservePrice = map["reservePrice"]
        sellOnShare = map["sellOnShare"]
        seller = map["seller"]
        sellerFundsRecipient = map["sellerFundsRecipient"]
        tokenId = map["tokenId"]
        tokenOwner = map["tokenOwner"]
        v1AskStatus = map["v1AskStatus"]
        v1BidShareStatus = map["v1BidShareStatus"]
        v1OfferStatus = map["v1OfferStatus"]
        v2AuctionStatus = map["v2AuctionStatus"]
        v3AskStatus = map["v3AskStatus"]
    }
}

extension Fields where TypeLock == Unions.MarketProperties {
    func on<Type>(v1Ask: Selection<Type, Objects.V1Ask>, v1Offer: Selection<Type, Objects.V1Offer>, v1BidShare: Selection<Type, Objects.V1BidShare>, v2Auction: Selection<Type, Objects.V2Auction>, v3Ask: Selection<Type, Objects.V3Ask>) throws -> Type {
        select([GraphQLField.fragment(type: "V1Ask", selection: v1Ask.selection), GraphQLField.fragment(type: "V1Offer", selection: v1Offer.selection), GraphQLField.fragment(type: "V1BidShare", selection: v1BidShare.selection), GraphQLField.fragment(type: "V2Auction", selection: v2Auction.selection), GraphQLField.fragment(type: "V3Ask", selection: v3Ask.selection)])

        switch response {
        case let .decoding(data):
            switch data.__typename {
            case .v1Ask:
                let data = Objects.V1Ask(amount: data.amount, collectionAddress: data.collectionAddress, currency: data.currency, tokenId: data.tokenId, v1AskStatus: data.v1AskStatus)
                return try v1Ask.decode(data: data)
            case .v1Offer:
                let data = Objects.V1Offer(amount: data.amount, bidder: data.bidder, collectionAddress: data.collectionAddress, currency: data.currency, recipient: data.recipient, sellOnShare: data.sellOnShare, tokenId: data.tokenId, v1OfferStatus: data.v1OfferStatus)
                return try v1Offer.decode(data: data)
            case .v1BidShare:
                let data = Objects.V1BidShare(collectionAddress: data.collectionAddress, creator: data.creator, owner: data.owner, previousOwner: data.previousOwner, tokenId: data.tokenId, v1BidShareStatus: data.v1BidShareStatus)
                return try v1BidShare.decode(data: data)
            case .v2Auction:
                let data = Objects.V2Auction(address: data.address, amountCuratorReceived: data.amountCuratorReceived, amountTokenOwnerReceived: data.amountTokenOwnerReceived, approved: data.approved, auctionCurrency: data.auctionCurrency, auctionId: data.auctionId, collectionAddress: data.collectionAddress, curator: data.curator, curatorFeePercentage: data.curatorFeePercentage, duration: data.duration, estimatedExpirationTime: data.estimatedExpirationTime, firstBidTime: data.firstBidTime, highestBidPrice: data.highestBidPrice, highestBidder: data.highestBidder, reservePrice: data.reservePrice, tokenId: data.tokenId, tokenOwner: data.tokenOwner, v2AuctionStatus: data.v2AuctionStatus)
                return try v2Auction.decode(data: data)
            case .v3Ask:
                let data = Objects.V3Ask(address: data.address, askCurrency: data.askCurrency, askPrice: data.askPrice, buyer: data.buyer, collectionAddress: data.collectionAddress, finder: data.finder, findersFeeBps: data.findersFeeBps, seller: data.seller, sellerFundsRecipient: data.sellerFundsRecipient, tokenId: data.tokenId, v3AskStatus: data.v3AskStatus)
                return try v3Ask.decode(data: data)
            }
        case .mocking:
            return v1Ask.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias MarketProperties<T> = Selection<T, Unions.MarketProperties>
}

extension Unions {
    struct ImageEncodingTypesVideoEncodingTypesAudioEncodingTypesUnsupportedEncodingTypes {
        let __typename: TypeName
        let large: [String: String]
        let original: [String: String]
        let poster: [String: String]
        let preview: [String: String]
        let thumbnail: [String: String]

        enum TypeName: String, Codable {
            case imageEncodingTypes = "ImageEncodingTypes"
            case videoEncodingTypes = "VideoEncodingTypes"
            case audioEncodingTypes = "AudioEncodingTypes"
            case unsupportedEncodingTypes = "UnsupportedEncodingTypes"
        }
    }
}

extension Unions.ImageEncodingTypesVideoEncodingTypesAudioEncodingTypesUnsupportedEncodingTypes: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "large":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "original":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "poster":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "preview":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "thumbnail":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        __typename = try container.decode(TypeName.self, forKey: DynamicCodingKeys(stringValue: "__typename")!)

        large = map["large"]
        original = map["original"]
        poster = map["poster"]
        preview = map["preview"]
        thumbnail = map["thumbnail"]
    }
}

extension Fields where TypeLock == Unions.ImageEncodingTypesVideoEncodingTypesAudioEncodingTypesUnsupportedEncodingTypes {
    func on<Type>(imageEncodingTypes: Selection<Type, Objects.ImageEncodingTypes>, videoEncodingTypes: Selection<Type, Objects.VideoEncodingTypes>, audioEncodingTypes: Selection<Type, Objects.AudioEncodingTypes>, unsupportedEncodingTypes: Selection<Type, Objects.UnsupportedEncodingTypes>) throws -> Type {
        select([GraphQLField.fragment(type: "ImageEncodingTypes", selection: imageEncodingTypes.selection), GraphQLField.fragment(type: "VideoEncodingTypes", selection: videoEncodingTypes.selection), GraphQLField.fragment(type: "AudioEncodingTypes", selection: audioEncodingTypes.selection), GraphQLField.fragment(type: "UnsupportedEncodingTypes", selection: unsupportedEncodingTypes.selection)])

        switch response {
        case let .decoding(data):
            switch data.__typename {
            case .imageEncodingTypes:
                let data = Objects.ImageEncodingTypes(large: data.large, original: data.original, poster: data.poster, thumbnail: data.thumbnail)
                return try imageEncodingTypes.decode(data: data)
            case .videoEncodingTypes:
                let data = Objects.VideoEncodingTypes(large: data.large, original: data.original, poster: data.poster, preview: data.preview, thumbnail: data.thumbnail)
                return try videoEncodingTypes.decode(data: data)
            case .audioEncodingTypes:
                let data = Objects.AudioEncodingTypes(large: data.large, original: data.original)
                return try audioEncodingTypes.decode(data: data)
            case .unsupportedEncodingTypes:
                let data = Objects.UnsupportedEncodingTypes(original: data.original)
                return try unsupportedEncodingTypes.decode(data: data)
            }
        case .mocking:
            return imageEncodingTypes.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias ImageEncodingTypesVideoEncodingTypesAudioEncodingTypesUnsupportedEncodingTypes<T> = Selection<T, Unions.ImageEncodingTypesVideoEncodingTypesAudioEncodingTypesUnsupportedEncodingTypes>
}

extension Unions {
    struct TokenCollection {
        let __typename: TypeName
        let address: [String: String]
        let attributes: [String: [Objects.TokenAttribute]]
        let collectionAddress: [String: String]
        let collectionName: [String: String]
        let content: [String: Objects.TokenContentMedia]
        let description: [String: String]
        let image: [String: Objects.TokenContentMedia]
        let lastRefreshTime: [String: DateTime]
        let metadata: [String: GenericScalar]
        let mintInfo: [String: Objects.MintInfo]
        let name: [String: String]
        let networkInfo: [String: Objects.NetworkInfo]
        let owner: [String: String]
        let symbol: [String: String]
        let tokenContract: [String: Objects.TokenContract]
        let tokenId: [String: String]
        let tokenUrl: [String: String]
        let tokenUrlMimeType: [String: String]
        let totalSupply: [String: Int]

        enum TypeName: String, Codable {
            case token = "Token"
            case collection = "Collection"
        }
    }
}

extension Unions.TokenCollection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "address":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "attributes":
                if let value = try container.decode([Objects.TokenAttribute]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "collectionAddress":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "collectionName":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "content":
                if let value = try container.decode(Objects.TokenContentMedia?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "description":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "image":
                if let value = try container.decode(Objects.TokenContentMedia?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "lastRefreshTime":
                if let value = try container.decode(DateTime?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "metadata":
                if let value = try container.decode(GenericScalar?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "mintInfo":
                if let value = try container.decode(Objects.MintInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "name":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "networkInfo":
                if let value = try container.decode(Objects.NetworkInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "owner":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "symbol":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenContract":
                if let value = try container.decode(Objects.TokenContract?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenId":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenUrl":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "tokenUrlMimeType":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalSupply":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        __typename = try container.decode(TypeName.self, forKey: DynamicCodingKeys(stringValue: "__typename")!)

        address = map["address"]
        attributes = map["attributes"]
        collectionAddress = map["collectionAddress"]
        collectionName = map["collectionName"]
        content = map["content"]
        description = map["description"]
        image = map["image"]
        lastRefreshTime = map["lastRefreshTime"]
        metadata = map["metadata"]
        mintInfo = map["mintInfo"]
        name = map["name"]
        networkInfo = map["networkInfo"]
        owner = map["owner"]
        symbol = map["symbol"]
        tokenContract = map["tokenContract"]
        tokenId = map["tokenId"]
        tokenUrl = map["tokenUrl"]
        tokenUrlMimeType = map["tokenUrlMimeType"]
        totalSupply = map["totalSupply"]
    }
}

extension Fields where TypeLock == Unions.TokenCollection {
    func on<Type>(token: Selection<Type, Objects.Token>, collection: Selection<Type, Objects.Collection>) throws -> Type {
        select([GraphQLField.fragment(type: "Token", selection: token.selection), GraphQLField.fragment(type: "Collection", selection: collection.selection)])

        switch response {
        case let .decoding(data):
            switch data.__typename {
            case .token:
                let data = Objects.Token(attributes: data.attributes, collectionAddress: data.collectionAddress, collectionName: data.collectionName, content: data.content, description: data.description, image: data.image, lastRefreshTime: data.lastRefreshTime, metadata: data.metadata, mintInfo: data.mintInfo, name: data.name, networkInfo: data.networkInfo, owner: data.owner, tokenContract: data.tokenContract, tokenId: data.tokenId, tokenUrl: data.tokenUrl, tokenUrlMimeType: data.tokenUrlMimeType)
                return try token.decode(data: data)
            case .collection:
                let data = Objects.Collection(address: data.address, attributes: data.attributes, description: data.description, name: data.name, networkInfo: data.networkInfo, symbol: data.symbol, totalSupply: data.totalSupply)
                return try collection.decode(data: data)
            }
        case .mocking:
            return token.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias TokenCollection<T> = Selection<T, Unions.TokenCollection>
}

// MARK: - Enums

enum Enums {}
extension Enums {
    /// Network
    enum Network: String, CaseIterable, Codable {
        case ethereum = "ETHEREUM"
    }
}

extension Enums {
    /// Chain
    enum Chain: String, CaseIterable, Codable {
        case mainnet = "MAINNET"
    }
}

extension Enums {
    /// CollectionSortKey
    enum CollectionSortKey: String, CaseIterable, Codable {
        case none = "NONE"

        case name = "NAME"

        case created = "CREATED"
    }
}

extension Enums {
    /// SortDirection
    enum SortDirection: String, CaseIterable, Codable {
        case asc = "ASC"

        case desc = "DESC"
    }
}

extension Enums {
    /// EventType
    enum EventType: String, CaseIterable, Codable {
        case approvalEvent = "APPROVAL_EVENT"

        case saleEvent = "SALE_EVENT"

        case mintEvent = "MINT_EVENT"

        case transferEvent = "TRANSFER_EVENT"

        case v1MarketEvent = "V1_MARKET_EVENT"

        case v2AuctionEvent = "V2_AUCTION_EVENT"

        case v3AskEvent = "V3_ASK_EVENT"
    }
}

extension Enums {
    /// ApprovalEventType
    enum ApprovalEventType: String, CaseIterable, Codable {
        case approval = "APPROVAL"

        case approvalForAll = "APPROVAL_FOR_ALL"
    }
}

extension Enums {
    /// SaleType
    enum SaleType: String, CaseIterable, Codable {
        case foundationSale = "FOUNDATION_SALE"

        case nounsAuctionSale = "NOUNS_AUCTION_SALE"

        case cryptopunksSale = "CRYPTOPUNKS_SALE"

        case looksRareSale = "LOOKS_RARE_SALE"

        case openseaSingleSale = "OPENSEA_SINGLE_SALE"

        case openseaBundleSale = "OPENSEA_BUNDLE_SALE"

        case raribleSale = "RARIBLE_SALE"

        case superrareSale = "SUPERRARE_SALE"

        case zeroxSale = "ZEROX_SALE"

        case zoraV2AuctionSale = "ZORA_V2_AUCTION_SALE"

        case zoraV3AskSale = "ZORA_V3_ASK_SALE"
    }
}

extension Enums {
    /// V1MarketEventType
    enum V1MarketEventType: String, CaseIterable, Codable {
        case v1MarketBidCreated = "V1_MARKET_BID_CREATED"

        case v1MarketBidRemoved = "V1_MARKET_BID_REMOVED"

        case v1MarketBidFinalized = "V1_MARKET_BID_FINALIZED"

        case v1MarketAskCreated = "V1_MARKET_ASK_CREATED"

        case v1MarketAskRemoved = "V1_MARKET_ASK_REMOVED"

        case v1MarketBidShareUpdated = "V1_MARKET_BID_SHARE_UPDATED"
    }
}

extension Enums {
    /// V2AuctionEventType
    enum V2AuctionEventType: String, CaseIterable, Codable {
        case v2AuctionCreated = "V2_AUCTION_CREATED"

        case v2AuctionCanceled = "V2_AUCTION_CANCELED"

        case v2AuctionReservePriceUpdated = "V2_AUCTION_RESERVE_PRICE_UPDATED"

        case v2AuctionBid = "V2_AUCTION_BID"

        case v2AuctionDurationExtended = "V2_AUCTION_DURATION_EXTENDED"

        case v2AuctionApprovalUpdated = "V2_AUCTION_APPROVAL_UPDATED"

        case v2AuctionEnded = "V2_AUCTION_ENDED"
    }
}

extension Enums {
    /// V3AskEventType
    enum V3AskEventType: String, CaseIterable, Codable {
        case v3AskCreated = "V3_ASK_CREATED"

        case v3AskCanceled = "V3_ASK_CANCELED"

        case v3AskPriceUpdated = "V3_ASK_PRICE_UPDATED"

        case v3AskFilled = "V3_ASK_FILLED"
    }
}

extension Enums {
    /// EventSortKey
    enum EventSortKey: String, CaseIterable, Codable {
        case created = "CREATED"
    }
}

extension Enums {
    /// MarketType
    enum MarketType: String, CaseIterable, Codable {
        case v1Ask = "V1_ASK"

        case v1BidShare = "V1_BID_SHARE"

        case v1Offer = "V1_OFFER"

        case v2Auction = "V2_AUCTION"

        case v3Ask = "V3_ASK"
    }
}

extension Enums {
    /// V1MarketEntityStatus
    enum V1MarketEntityStatus: String, CaseIterable, Codable {
        case active = "ACTIVE"

        case canceled = "CANCELED"

        case completed = "COMPLETED"
    }
}

extension Enums {
    /// V2AuctionStatus
    enum V2AuctionStatus: String, CaseIterable, Codable {
        case active = "ACTIVE"

        case canceled = "CANCELED"

        case completed = "COMPLETED"

        case expired = "EXPIRED"
    }
}

extension Enums {
    /// V3AskStatus
    enum V3AskStatus: String, CaseIterable, Codable {
        case active = "ACTIVE"

        case canceled = "CANCELED"

        case completed = "COMPLETED"
    }
}

extension Enums {
    /// MarketSortKey
    enum MarketSortKey: String, CaseIterable, Codable {
        case none = "NONE"

        case created = "CREATED"

        case chainTokenPrice = "CHAIN_TOKEN_PRICE"

        case nativePrice = "NATIVE_PRICE"

        case timedSaleEnding = "TIMED_SALE_ENDING"
    }
}

extension Enums {
    /// MarketStatus
    enum MarketStatus: String, CaseIterable, Codable {
        case active = "ACTIVE"

        case canceled = "CANCELED"

        case completed = "COMPLETED"
    }
}

extension Enums {
    /// MintSortKey
    enum MintSortKey: String, CaseIterable, Codable {
        case none = "NONE"

        case time = "TIME"

        case tokenId = "TOKEN_ID"

        case price = "PRICE"
    }
}

extension Enums {
    /// SaleSortKey
    enum SaleSortKey: String, CaseIterable, Codable {
        case none = "NONE"

        case chainTokenPrice = "CHAIN_TOKEN_PRICE"

        case nativePrice = "NATIVE_PRICE"

        case time = "TIME"
    }
}

extension Enums {
    /// TokenSortKey
    enum TokenSortKey: String, CaseIterable, Codable {
        case none = "NONE"

        case minted = "MINTED"

        case tokenId = "TOKEN_ID"

        case transferred = "TRANSFERRED"

        case chainTokenPrice = "CHAIN_TOKEN_PRICE"

        case nativePrice = "NATIVE_PRICE"

        case timedSaleEnding = "TIMED_SALE_ENDING"
    }
}

extension Enums {
    /// MarketCategory
    enum MarketCategory: String, CaseIterable, Codable {
        case ask = "ASK"

        case offer = "OFFER"

        case auction = "AUCTION"
    }
}

extension Enums {
    /// MediaType
    enum MediaType: String, CaseIterable, Codable {
        case image = "IMAGE"

        case gif = "GIF"

        case video = "VIDEO"

        case audio = "AUDIO"

        case text = "TEXT"

        case html = "HTML"
    }
}

extension Enums {
    /// SearchableEntity
    enum SearchableEntity: String, CaseIterable, Codable {
        case token = "TOKEN"

        case collection = "COLLECTION"
    }
}

// MARK: - Input Objects

enum InputObjects {}
extension InputObjects {
    struct CollectionAddressAndAttributesInput: Encodable, Hashable {
        var collectionAddresses: OptionalArgument<[String]> = .absent()

        var attributes: OptionalArgument<[InputObjects.AttributeFilter]> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if collectionAddresses.hasValue { try container.encode(collectionAddresses, forKey: .collectionAddresses) }
            if attributes.hasValue { try container.encode(attributes, forKey: .attributes) }
        }

        enum CodingKeys: String, CodingKey {
            case collectionAddresses
            case attributes
        }
    }
}

extension InputObjects {
    struct AttributeFilter: Encodable, Hashable {
        var traitType: String

        var value: OptionalArgument<String> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(traitType, forKey: .traitType)
            if value.hasValue { try container.encode(value, forKey: .value) }
        }

        enum CodingKeys: String, CodingKey {
            case traitType
            case value
        }
    }
}

extension InputObjects {
    struct NetworkInput: Encodable, Hashable {
        var network: Enums.Network

        var chain: Enums.Chain

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(network, forKey: .network)
            try container.encode(chain, forKey: .chain)
        }

        enum CodingKeys: String, CodingKey {
            case network
            case chain
        }
    }
}

extension InputObjects {
    struct CollectionAddressOwnerAddressAttributesInput: Encodable, Hashable {
        var collectionAddresses: OptionalArgument<[String]> = .absent()

        var ownerAddresses: OptionalArgument<[String]> = .absent()

        var attributes: OptionalArgument<[InputObjects.AttributeFilter]> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if collectionAddresses.hasValue { try container.encode(collectionAddresses, forKey: .collectionAddresses) }
            if ownerAddresses.hasValue { try container.encode(ownerAddresses, forKey: .ownerAddresses) }
            if attributes.hasValue { try container.encode(attributes, forKey: .attributes) }
        }

        enum CodingKeys: String, CodingKey {
            case collectionAddresses
            case ownerAddresses
            case attributes
        }
    }
}

extension InputObjects {
    struct PaginationInput: Encodable, Hashable {
        var limit: Int

        var after: OptionalArgument<String> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(limit, forKey: .limit)
            if after.hasValue { try container.encode(after, forKey: .after) }
        }

        enum CodingKeys: String, CodingKey {
            case limit
            case after
        }
    }
}

extension InputObjects {
    struct TimeFilter: Encodable, Hashable {
        var startDate: OptionalArgument<String> = .absent()

        var endDate: OptionalArgument<String> = .absent()

        var lookbackHours: OptionalArgument<Int> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if startDate.hasValue { try container.encode(startDate, forKey: .startDate) }
            if endDate.hasValue { try container.encode(endDate, forKey: .endDate) }
            if lookbackHours.hasValue { try container.encode(lookbackHours, forKey: .lookbackHours) }
        }

        enum CodingKeys: String, CodingKey {
            case startDate
            case endDate
            case lookbackHours
        }
    }
}

extension InputObjects {
    struct AggregateAttributesQueryInput: Encodable, Hashable {
        var collectionAddresses: OptionalArgument<[String]> = .absent()

        var ownerAddresses: OptionalArgument<[String]> = .absent()

        var tokens: OptionalArgument<[InputObjects.TokenInput]> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if collectionAddresses.hasValue { try container.encode(collectionAddresses, forKey: .collectionAddresses) }
            if ownerAddresses.hasValue { try container.encode(ownerAddresses, forKey: .ownerAddresses) }
            if tokens.hasValue { try container.encode(tokens, forKey: .tokens) }
        }

        enum CodingKeys: String, CodingKey {
            case collectionAddresses
            case ownerAddresses
            case tokens
        }
    }
}

extension InputObjects {
    struct TokenInput: Encodable, Hashable {
        var address: String

        var tokenId: String

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(address, forKey: .address)
            try container.encode(tokenId, forKey: .tokenId)
        }

        enum CodingKeys: String, CodingKey {
            case address
            case tokenId
        }
    }
}

extension InputObjects {
    struct CollectionsQueryInput: Encodable, Hashable {
        var collectionAddresses: [String]

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(collectionAddresses, forKey: .collectionAddresses)
        }

        enum CodingKeys: String, CodingKey {
            case collectionAddresses
        }
    }
}

extension InputObjects {
    struct CollectionSortKeySortInput: Encodable, Hashable {
        var sortKey: Enums.CollectionSortKey

        var sortDirection: Enums.SortDirection

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(sortKey, forKey: .sortKey)
            try container.encode(sortDirection, forKey: .sortDirection)
        }

        enum CodingKeys: String, CodingKey {
            case sortKey
            case sortDirection
        }
    }
}

extension InputObjects {
    struct EventsQueryInput: Encodable, Hashable {
        var tokens: OptionalArgument<[InputObjects.TokenInput]> = .absent()

        var collectionAddresses: OptionalArgument<[String]> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if tokens.hasValue { try container.encode(tokens, forKey: .tokens) }
            if collectionAddresses.hasValue { try container.encode(collectionAddresses, forKey: .collectionAddresses) }
        }

        enum CodingKeys: String, CodingKey {
            case tokens
            case collectionAddresses
        }
    }
}

extension InputObjects {
    struct EventSortKeySortInput: Encodable, Hashable {
        var sortKey: Enums.EventSortKey

        var sortDirection: Enums.SortDirection

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(sortKey, forKey: .sortKey)
            try container.encode(sortDirection, forKey: .sortDirection)
        }

        enum CodingKeys: String, CodingKey {
            case sortKey
            case sortDirection
        }
    }
}

extension InputObjects {
    struct EventsQueryFilter: Encodable, Hashable {
        var eventTypes: OptionalArgument<[Enums.EventType]> = .absent()

        var senderAddresses: OptionalArgument<[String]> = .absent()

        var recipientAddresses: OptionalArgument<[String]> = .absent()

        var sellerAddresses: OptionalArgument<[String]> = .absent()

        var bidderAddresses: OptionalArgument<[String]> = .absent()

        var timeFilter: OptionalArgument<InputObjects.TimeFilter> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if eventTypes.hasValue { try container.encode(eventTypes, forKey: .eventTypes) }
            if senderAddresses.hasValue { try container.encode(senderAddresses, forKey: .senderAddresses) }
            if recipientAddresses.hasValue { try container.encode(recipientAddresses, forKey: .recipientAddresses) }
            if sellerAddresses.hasValue { try container.encode(sellerAddresses, forKey: .sellerAddresses) }
            if bidderAddresses.hasValue { try container.encode(bidderAddresses, forKey: .bidderAddresses) }
            if timeFilter.hasValue { try container.encode(timeFilter, forKey: .timeFilter) }
        }

        enum CodingKeys: String, CodingKey {
            case eventTypes
            case senderAddresses
            case recipientAddresses
            case sellerAddresses
            case bidderAddresses
            case timeFilter
        }
    }
}

extension InputObjects {
    struct MarketSortKeySortInput: Encodable, Hashable {
        var sortKey: Enums.MarketSortKey

        var sortDirection: Enums.SortDirection

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(sortKey, forKey: .sortKey)
            try container.encode(sortDirection, forKey: .sortDirection)
        }

        enum CodingKeys: String, CodingKey {
            case sortKey
            case sortDirection
        }
    }
}

extension InputObjects {
    struct MarketsQueryFilter: Encodable, Hashable {
        var marketFilters: OptionalArgument<[InputObjects.MarketTypeFilter]> = .absent()

        var priceFilter: OptionalArgument<InputObjects.PriceFilter> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if marketFilters.hasValue { try container.encode(marketFilters, forKey: .marketFilters) }
            if priceFilter.hasValue { try container.encode(priceFilter, forKey: .priceFilter) }
        }

        enum CodingKeys: String, CodingKey {
            case marketFilters
            case priceFilter
        }
    }
}

extension InputObjects {
    struct MarketTypeFilter: Encodable, Hashable {
        var marketType: Enums.MarketType

        var statuses: OptionalArgument<[Enums.MarketStatus]> = .absent()

        var bidderAddresses: OptionalArgument<[String]> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(marketType, forKey: .marketType)
            if statuses.hasValue { try container.encode(statuses, forKey: .statuses) }
            if bidderAddresses.hasValue { try container.encode(bidderAddresses, forKey: .bidderAddresses) }
        }

        enum CodingKeys: String, CodingKey {
            case marketType
            case statuses
            case bidderAddresses
        }
    }
}

extension InputObjects {
    struct PriceFilter: Encodable, Hashable {
        var currencyAddress: OptionalArgument<String> = .absent()

        var minimumChainTokenPrice: OptionalArgument<String> = .absent()

        var maximumChainTokenPrice: OptionalArgument<String> = .absent()

        var minimumNativePrice: OptionalArgument<String> = .absent()

        var maximumNativePrice: OptionalArgument<String> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if currencyAddress.hasValue { try container.encode(currencyAddress, forKey: .currencyAddress) }
            if minimumChainTokenPrice.hasValue { try container.encode(minimumChainTokenPrice, forKey: .minimumChainTokenPrice) }
            if maximumChainTokenPrice.hasValue { try container.encode(maximumChainTokenPrice, forKey: .maximumChainTokenPrice) }
            if minimumNativePrice.hasValue { try container.encode(minimumNativePrice, forKey: .minimumNativePrice) }
            if maximumNativePrice.hasValue { try container.encode(maximumNativePrice, forKey: .maximumNativePrice) }
        }

        enum CodingKeys: String, CodingKey {
            case currencyAddress
            case minimumChainTokenPrice
            case maximumChainTokenPrice
            case minimumNativePrice
            case maximumNativePrice
        }
    }
}

extension InputObjects {
    struct MarketsQueryInput: Encodable, Hashable {
        var tokens: OptionalArgument<[InputObjects.TokenInput]> = .absent()

        var collectionAddresses: OptionalArgument<[String]> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if tokens.hasValue { try container.encode(tokens, forKey: .tokens) }
            if collectionAddresses.hasValue { try container.encode(collectionAddresses, forKey: .collectionAddresses) }
        }

        enum CodingKeys: String, CodingKey {
            case tokens
            case collectionAddresses
        }
    }
}

extension InputObjects {
    struct MintSortKeySortInput: Encodable, Hashable {
        var sortKey: Enums.MintSortKey

        var sortDirection: Enums.SortDirection

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(sortKey, forKey: .sortKey)
            try container.encode(sortDirection, forKey: .sortDirection)
        }

        enum CodingKeys: String, CodingKey {
            case sortKey
            case sortDirection
        }
    }
}

extension InputObjects {
    struct MintsQueryFilter: Encodable, Hashable {
        var priceFilter: OptionalArgument<InputObjects.PriceFilter> = .absent()

        var timeFilter: OptionalArgument<InputObjects.TimeFilter> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if priceFilter.hasValue { try container.encode(priceFilter, forKey: .priceFilter) }
            if timeFilter.hasValue { try container.encode(timeFilter, forKey: .timeFilter) }
        }

        enum CodingKeys: String, CodingKey {
            case priceFilter
            case timeFilter
        }
    }
}

extension InputObjects {
    struct MintsQueryInput: Encodable, Hashable {
        var minterAddresses: OptionalArgument<[String]> = .absent()

        var recipientAddresses: OptionalArgument<[String]> = .absent()

        var collectionAddresses: OptionalArgument<[String]> = .absent()

        var tokens: OptionalArgument<[InputObjects.TokenInput]> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if minterAddresses.hasValue { try container.encode(minterAddresses, forKey: .minterAddresses) }
            if recipientAddresses.hasValue { try container.encode(recipientAddresses, forKey: .recipientAddresses) }
            if collectionAddresses.hasValue { try container.encode(collectionAddresses, forKey: .collectionAddresses) }
            if tokens.hasValue { try container.encode(tokens, forKey: .tokens) }
        }

        enum CodingKeys: String, CodingKey {
            case minterAddresses
            case recipientAddresses
            case collectionAddresses
            case tokens
        }
    }
}

extension InputObjects {
    struct SalesQueryInput: Encodable, Hashable {
        var collectionAddresses: OptionalArgument<[String]> = .absent()

        var sellerAddresses: OptionalArgument<[String]> = .absent()

        var buyerAddresses: OptionalArgument<[String]> = .absent()

        var tokens: OptionalArgument<[InputObjects.TokenInput]> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if collectionAddresses.hasValue { try container.encode(collectionAddresses, forKey: .collectionAddresses) }
            if sellerAddresses.hasValue { try container.encode(sellerAddresses, forKey: .sellerAddresses) }
            if buyerAddresses.hasValue { try container.encode(buyerAddresses, forKey: .buyerAddresses) }
            if tokens.hasValue { try container.encode(tokens, forKey: .tokens) }
        }

        enum CodingKeys: String, CodingKey {
            case collectionAddresses
            case sellerAddresses
            case buyerAddresses
            case tokens
        }
    }
}

extension InputObjects {
    struct SaleSortKeySortInput: Encodable, Hashable {
        var sortKey: Enums.SaleSortKey

        var sortDirection: Enums.SortDirection

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(sortKey, forKey: .sortKey)
            try container.encode(sortDirection, forKey: .sortDirection)
        }

        enum CodingKeys: String, CodingKey {
            case sortKey
            case sortDirection
        }
    }
}

extension InputObjects {
    struct SalesQueryFilter: Encodable, Hashable {
        var saleTypes: OptionalArgument<[Enums.SaleType]> = .absent()

        var priceFilter: OptionalArgument<InputObjects.PriceFilter> = .absent()

        var timeFilter: OptionalArgument<InputObjects.TimeFilter> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if saleTypes.hasValue { try container.encode(saleTypes, forKey: .saleTypes) }
            if priceFilter.hasValue { try container.encode(priceFilter, forKey: .priceFilter) }
            if timeFilter.hasValue { try container.encode(timeFilter, forKey: .timeFilter) }
        }

        enum CodingKeys: String, CodingKey {
            case saleTypes
            case priceFilter
            case timeFilter
        }
    }
}

extension InputObjects {
    struct TokenSortInput: Encodable, Hashable {
        var sortKey: Enums.TokenSortKey

        var sortDirection: Enums.SortDirection

        var sortAxis: OptionalArgument<Enums.MarketCategory> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(sortKey, forKey: .sortKey)
            try container.encode(sortDirection, forKey: .sortDirection)
            if sortAxis.hasValue { try container.encode(sortAxis, forKey: .sortAxis) }
        }

        enum CodingKeys: String, CodingKey {
            case sortKey
            case sortDirection
            case sortAxis
        }
    }
}

extension InputObjects {
    struct TokensQueryInput: Encodable, Hashable {
        var collectionAddresses: OptionalArgument<[String]> = .absent()

        var ownerAddresses: OptionalArgument<[String]> = .absent()

        var tokens: OptionalArgument<[InputObjects.TokenInput]> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if collectionAddresses.hasValue { try container.encode(collectionAddresses, forKey: .collectionAddresses) }
            if ownerAddresses.hasValue { try container.encode(ownerAddresses, forKey: .ownerAddresses) }
            if tokens.hasValue { try container.encode(tokens, forKey: .tokens) }
        }

        enum CodingKeys: String, CodingKey {
            case collectionAddresses
            case ownerAddresses
            case tokens
        }
    }
}

extension InputObjects {
    struct TokensQueryFilter: Encodable, Hashable {
        var attributeFilters: OptionalArgument<[InputObjects.AttributeFilter]> = .absent()

        var mediaType: OptionalArgument<Enums.MediaType> = .absent()

        var marketFilters: OptionalArgument<[InputObjects.MarketTypeFilter]> = .absent()

        var priceFilter: OptionalArgument<InputObjects.PriceFilter> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if attributeFilters.hasValue { try container.encode(attributeFilters, forKey: .attributeFilters) }
            if mediaType.hasValue { try container.encode(mediaType, forKey: .mediaType) }
            if marketFilters.hasValue { try container.encode(marketFilters, forKey: .marketFilters) }
            if priceFilter.hasValue { try container.encode(priceFilter, forKey: .priceFilter) }
        }

        enum CodingKeys: String, CodingKey {
            case attributeFilters
            case mediaType
            case marketFilters
            case priceFilter
        }
    }
}

extension InputObjects {
    struct SearchQueryInput: Encodable, Hashable {
        var text: String

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(text, forKey: .text)
        }

        enum CodingKeys: String, CodingKey {
            case text
        }
    }
}

extension InputObjects {
    struct SearchPaginationInput: Encodable, Hashable {
        var limit: Int

        var after: OptionalArgument<String> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(limit, forKey: .limit)
            if after.hasValue { try container.encode(after, forKey: .after) }
        }

        enum CodingKeys: String, CodingKey {
            case limit
            case after
        }
    }
}

extension InputObjects {
    struct SearchFilter: Encodable, Hashable {
        var collectionAddresses: OptionalArgument<[String]> = .absent()

        var entityType: OptionalArgument<Enums.SearchableEntity> = .absent()

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if collectionAddresses.hasValue { try container.encode(collectionAddresses, forKey: .collectionAddresses) }
            if entityType.hasValue { try container.encode(entityType, forKey: .entityType) }
        }

        enum CodingKeys: String, CodingKey {
            case collectionAddresses
            case entityType
        }
    }
}
