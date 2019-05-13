class AccountService: Service {

    required init(provider: DependencyProviding) { }

    func balance() -> Int {
        return 333
    }

}
