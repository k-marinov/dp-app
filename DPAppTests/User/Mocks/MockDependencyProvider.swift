@testable import DPApp

class MockDependencyProvider: DependencyProviding {

    private let serviceMocks: [String: Service.Type] = [
        "\(UserService.self)": MockUserService.self,
        "\(AccountService.self)": MockAccountService.self,
        "\(FriendService.self)": MockFriendService.self]

    private(set) var mocks: [String: Any] = [String: Any]()

    func addMock(key: String, value: Any) {
        if mocks[key] == nil {
            mocks[key] = value
        }
    }

    func find<Mock>(_ type: Mock.Type) -> Mock {
        return mocks["\(type.self)"] as! Mock
    }

    func register<SERVICE>(provider: DependencyProviding) -> SERVICE where SERVICE : Service {
        let realClassKey: String = "\(SERVICE.self)"
        let mockType = mockServiceType(with: provider, realClassKey: realClassKey)
        addMock(key: "\(mockType)", value: mockType.init(provider: provider))
        return mocks["\(mockType)"] as! SERVICE
    }

    func register(provider: DependencyProviding) -> AnalyticsTracker {
        let key: String = "\(MockAnalyticsTracker.self)"
        addMock(key: key, value: MockAnalyticsTracker(provider: provider))
        return mocks[key] as! AnalyticsTracker
    }

    func register() -> HttpClient {
        let key: String = "\(MockHttpClient.self)"
        addMock(key: key, value: MockHttpClient())
        return mocks[key] as! HttpClient
    }

    private func mockServiceType(with provider: DependencyProviding, realClassKey: String) -> Service.Type {
        let mockServiceType: Service.Type? = serviceMocks[realClassKey]
        if mockServiceType == nil {
            fatalError("Service class \(realClassKey) is not mapped to mock service class"
                + "please add your mock class type to serviceMocks")
        }
        print("mock service type \(mockServiceType!) found")
        return mockServiceType!
    }

}
