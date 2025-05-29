import Foundation

struct BDViewModel: Decodable {
    let type: String
    let content: [String: Any]
    
    enum CodingKeys: String, CodingKey {
        case type, content
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)
        
        let contentContainer = try container.nestedContainer(
            keyedBy: GenericCodingKeys.self,
            forKey: .content)
        var contentMap: [String: Any] = [:]
        
        for key in contentContainer.allKeys {
            
            if let stringValue = try? contentContainer.decode(String.self, forKey: key) {
               contentMap[key.stringValue] = stringValue
            } else if let boolValue = try? contentContainer.decode(Bool.self, forKey: key) {
                contentMap[key.stringValue] = boolValue
            } else if let numberValue = try? contentContainer.decode(Float.self, forKey: key) {
                contentMap[key.stringValue] = numberValue
            } else if let viewModelValue = try? contentContainer.decode(BDViewModel.self, forKey: key) {
                contentMap[key.stringValue] = viewModelValue
            } else if let viewModelsValue = try? contentContainer.decode([BDViewModel].self, forKey: key) {
                contentMap[key.stringValue] = viewModelsValue
            } else if let actionValue = try? contentContainer.decode(Action.self, forKey: key) {
                contentMap[key.stringValue] = actionValue
            }
        }
        content = contentMap
    }
    
    private struct GenericCodingKeys: CodingKey {

        var stringValue: String

        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        var intValue: Int? { nil }
        
        init?(intValue: Int) { nil }
    }
    
    struct Action: Decodable {
        let type: String
        let context: [String: Any]
        
        enum CondingKeys: String, CodingKey {
            case type, context
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: Action.CondingKeys.self)
            type = try container.decode(String.self, forKey: .type)
            let contextContainer = try container.nestedContainer(keyedBy: GenericCodingKeys.self, forKey: .context)
            var contextMap: [String: Any] = [:]
            for key in contextContainer.allKeys {
                if let stringValue = try? contextContainer.decode(String.self, forKey: key) {
                    contextMap[key.stringValue] = stringValue
                } else if let numberValue = try? contextContainer.decode(CGFloat.self, forKey: key) {
                    contextMap[key.stringValue] = numberValue
                }
            }
            context = contextMap
        }
    }
}
