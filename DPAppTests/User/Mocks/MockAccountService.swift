@testable import DPApp

class MockAccountService: AccountService {

    var mockBalance: Int = 0

    override func balance() -> Int {
        return mockBalance
    }

}
