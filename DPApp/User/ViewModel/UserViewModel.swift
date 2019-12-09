class UserViewModel {


    @Dependency(provider.register)
    private var userService: UserService
    @Dependency(provider.register)
    private var accountService: AccountService
    @Dependency(provider.register)
    private var friendService: FriendService


    func userDetails() -> String {
        var details: String = ""
        details.append(nameFormatted())
        details.append(ageFormatted())
        details.append(balanceFormatted())
        details.append(friendsFormatted())
        return details
    }

    private func nameFormatted() -> String {
        if userService.name() != "" {
            return "name: \(userService.name())\n"
        }
        return ""
    }

    private func ageFormatted() -> String {
        if userService.age() > 0 {
            return "age: \(userService.age())\n"
        }
        return ""
    }

    private func balanceFormatted() -> String {
        if accountService.balance() > 0 {
            return "account: \(accountService.balance())\n"
        }
        return ""
    }

    private func friendsFormatted() -> String {
        if !friendService.findAllFriends().isEmpty {
            let friends: String = String(friendService.findAllFriends()
                .compactMap { $0 + " "}
                .reduce("", + )
                .dropLast())
            return "friends: \(friends)"
        }
        return ""
    }

}
