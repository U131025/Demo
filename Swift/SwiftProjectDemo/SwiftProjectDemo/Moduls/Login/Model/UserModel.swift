//
//Created by ESJsonFormatForMac on 18/03/12.
//

import Foundation
import HandyJSON

struct UserModel : HandyJSON {

    var ID: Int = 0

    var realName: String?

    var phone: String?

    var tg: Bool = false

    var bankCount: Int = 0

    var idcardVerified: Bool = false

    var safeLevel: Int = 0

    var emailVerified: Bool = false

    var idCard: String?

    var userResults: String?

    var accountName: String?

    var usrCustId: String?

    var letterCount: Int = 0

    var isPasswordExpired: Bool = false

    var mobileVerified: Bool = false

    var email: String?

    var withdrawPsw: Bool = false

}
