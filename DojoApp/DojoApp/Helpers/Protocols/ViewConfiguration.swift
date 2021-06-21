import Foundation

protocol ViewConfiguration {
    func buildViewHierarchy()
    func setupConstraints()
    func additionalConfigurations()
    func buildLayout()
}

extension ViewConfiguration {
    func buildLayout() {
        buildViewHierarchy()
        setupConstraints()
        additionalConfigurations()
    }
    
    func additionalConfigurations() {}
}
