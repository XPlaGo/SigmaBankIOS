import UIKit

class DSStack: UIView {
    
    private var viewModel: DSStackViewModel?
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func configure(viewModel: DSStackViewModel) {
        self.viewModel = viewModel
        
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        stackView.axis = viewModel.axis == .horizontal ? .horizontal : .vertical
        stackView.spacing = viewModel.spacing ?? DSSpacings.Stack.itemSpacing(for: viewModel.size)
        
        switch viewModel.alignment {
        case .fill: stackView.alignment = .fill
        case .leading: stackView.alignment = .leading
        case .center: stackView.alignment = .center
        case .trailing: stackView.alignment = .trailing
        }
        
        switch viewModel.distribution {
        case .fill: stackView.distribution = .fill
        case .fillEqually: stackView.distribution = .fillEqually
        case .fillProportionally: stackView.distribution = .fillProportionally
        case .equalSpacing: stackView.distribution = .equalSpacing
        }
        
        viewModel.items.forEach { item in
            stackView.addArrangedSubview(item)
        }
    }
    
    func addArrangeSubview(_ view: UIView) {
        stackView.addArrangedSubview(view)
    }
    
}

extension DSStack {
    
    func setup() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
