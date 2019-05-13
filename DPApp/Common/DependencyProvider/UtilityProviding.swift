protocol UtilityProviding {

    func register(provider: DependencyProviding) -> AnalyticsTracker

    func register() -> HttpClient

}
