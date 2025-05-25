import UIKit

protocol BDMapper {
    
    func map(model: BDViewModel) -> UIView
    
}

class DefaultBDMapper: BDMapper {
    
    private let viewTypes: [String: BDComponent.Type] = [
        "button": BDButton.self,
        "card": BDCard.self,
        "label": BDLabel.self,
        "list": BDList.self,
        "input": BDInput.self,
        "stack": BDStack.self,
        "spacer": BDSpacer.self,
        "icon": BDIcon.self,
    ]
    
    func map(model: BDViewModel) -> UIView {
        
        if let viewType = viewTypes[model.type] {
            
            let content: [String: Any] = model.content.mapValues { value in
                if let viewModel = value as? BDViewModel {
                    return map(model: viewModel) as Any
                } else if let viewModels = value as? [BDViewModel] {
                    return viewModels.map({ map(model: $0) as UIView }) as Any
                }
                else {
                    return value
                }
            }
            
            let view = viewType.init()
            view.configure(with: content)
            
            return view.getView()
        }
        
        return UIView()
    }
    
}
