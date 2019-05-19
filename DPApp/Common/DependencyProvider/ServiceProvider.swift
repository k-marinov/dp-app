
class ServiceProvider {

    private var instances = [String: Service]()

    func register<SERVICE: Service>(provider: DependencyProviding) -> SERVICE {
        let key: String = "\(SERVICE.self)"
        guard let service = instances[key] as? SERVICE else {
            return instance(key: key, provider: provider)
        }
        return service
    }

    private func instance<SERVICE: Service>(key: String, provider: DependencyProviding) -> SERVICE {
        let service = SERVICE(provider: provider)
        instances[key] = SERVICE(provider: provider)
        print("number of instances", instances.count)
        return service
    }

}
