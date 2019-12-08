import XCTest

@testable import DPApp

var mockProvider: MockDependencyProvider = MockDependencyProvider()

class UserViewModelTests: XCTestCase {

    var mockProvider: MockDependencyProvider = MockDependencyProvider()
    var userViewModel: UserViewModel!


    override func setUp() {
        super.setUp()
        DPApp.provider = mockProvider
        userViewModel = UserViewModel()
    }

    func testUserDetails_whenHasName_appendsName() {
        mockProvider.find(MockUserService.self).mockName = "Neo"
        XCTAssertEqual(userViewModel.userDetails(), "name: Neo\n")
    }

    func testUserDetails_whenHasEmptyName_doesNotAppend() {
        mockProvider.find(MockUserService.self).mockName = ""
        XCTAssertEqual(userViewModel.userDetails(), "")
    }

    func testUserDetails_whenAgeHigherThanZero_appendsAge() {
        mockProvider.find(MockUserService.self).mockAge = 69
        XCTAssertEqual(userViewModel.userDetails(), "age: 69\n")
    }

    func testUserDetails_whenAgeEqualsZero_doesNotAppend() {
        mockProvider.find(MockUserService.self).mockAge = 0
        XCTAssertEqual(userViewModel.userDetails(), "")
    }

    func testUserDetails_whenHasNameAndAge_appendsNameAndAge() {
        mockProvider.find(MockUserService.self).mockName = "Neo"
        mockProvider.find(MockUserService.self).mockAge = 69
        XCTAssertEqual(userViewModel.userDetails(), "name: Neo\nage: 69\n")
    }

    func testUserDetails_whenBalanceHigherThanZero_appendsBalance() {
        mockProvider.find(MockAccountService.self).mockBalance = 400
        XCTAssertEqual(userViewModel.userDetails(), "account: 400\n")
    }

    func testUserDetails_whenBalanceEqualsToZero_doesNotAppend() {
        mockProvider.find(MockAccountService.self).mockBalance = 0
        XCTAssertEqual(userViewModel.userDetails(), "")
    }

    func testUserDetails_whenHasFriends_appendsFriends() {
        mockProvider.find(MockFriendService.self).mockFriends = ["Friend1", "Friend2"]
        XCTAssertEqual(userViewModel.userDetails(), "friends: Friend1 Friend2")
    }

    func testUserDetails_whenDoesNotHaveFriends_doesNotAppend() {
        mockProvider.find(MockFriendService.self).mockFriends = []
        XCTAssertEqual(userViewModel.userDetails(), "")
    }

    func testUserDetails_whenAllValid_returnsAllUserDetails() {
        mockProvider.find(MockUserService.self).mockName = "Neo"
        mockProvider.find(MockUserService.self).mockAge = 69
        mockProvider.find(MockAccountService.self).mockBalance = 400
        mockProvider.find(MockFriendService.self).mockFriends = ["Friend1", "Friend2"]
        XCTAssertEqual(userViewModel.userDetails(), "name: Neo\n" + "age: 69\n" + "account: 400\n" + "friends: Friend1 Friend2")
    }

    func testUserDetails_whenAllInvalid_returnsEmpty() {
        mockProvider.find(MockUserService.self).mockName = ""
        mockProvider.find(MockUserService.self).mockAge = 0
        mockProvider.find(MockAccountService.self).mockBalance = -1
        mockProvider.find(MockFriendService.self).mockFriends = []
        XCTAssertEqual(userViewModel.userDetails(), "")
    }

    // demonstrates adding mock class manually when has a convenience constructor
    func testConfiguration() {
        let creator = MockDependencyProvider()
        creator.addMock(key: "\(MockUserService.self)", value: MockUserService(configuration: "MockConfiguration"))
        userViewModel = UserViewModel()

        XCTAssertEqual(creator.find(MockUserService.self).configuration, "MockConfiguration")
    }

}

