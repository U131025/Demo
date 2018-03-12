//
//Created by ESJsonFormatForMac on 18/03/12.
//

import Foundation
import HandyJSON

struct ResponseModel<T> : HandyJSON {

    var description: String?

    var data: T?

    var code: String?

}

