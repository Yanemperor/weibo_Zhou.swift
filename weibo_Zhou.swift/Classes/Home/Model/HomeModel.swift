//
//  HomeModel.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/2/14.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit
class UserModel: NSObject {
    var cover_image_phone: String?
    var id: Int = 0
    var bi_followers_count: Int = 0
    var urank: Int = 0
    var profile_image_url: String?
    var classs: String?
    var verified_contact_email: String?
    var province: String?
    var verified: Bool = false
    var url: String?
    var statuses_count: Int = 0
    var geo_enabled: Bool = false
    var follow_me: Bool = false
//    var description: String?
    var followers_count: Int = 0
    var verified_contact_mobile: String?
    var location: String?
    var mbrank: Int = 0                     //会员等级
    var avatar_large: String?
    var star: Int = 0
    var verified_trade: String?
    var profile_url: String?
    var cover_image: String?
    var weihao: String?
    var online_status: Int = 0
    var verified_contact_name: String?
    var screen_name: String?
    var verified_source_url: String?
    var pagefriends_count: Int = 0
    var name: String?
    var verified_reason: String?
    var friends_count: Int = 0
    var insecurity: Array<Any>?
    var mbtype: Int = 0
    var block_app: Int = 0
    var avatar_hd: String?
    var credit_score: Int = 0
    var remark: String?
    var created_at: String?
    var block_word: Int = 0
    var allow_all_act_msg: Bool = false
    var verified_state: Int = 0
    var dianping: String?
    var verified_reason_modified: String?
    var allow_all_comment: Bool = false
    var verified_level: Int = 0
    var verified_reason_url: String?
    var gender: String?
    var favourites_count: Int = 0
    var idstr: String?
    var verified_type: Int = 0
    var city: String?
    var verified_source: String?
    var verified_type_ext: Int = 0
    var user_ability: Int = 0
    var lang: String?
    var ptype: Int = 0
    var following: Bool = false
    var domain: String?
    var cardid: String?
}

class HomeModel: NSObject {
    var favorited: Bool = false                //受欢迎的
    var created_at: String?
    var id: Int = 0
    var truncated: Bool = false                //截断
    var in_reply_to_screen_name: String?
    var isLongText: Bool = false
    var is_show_bulletin: Int = 0
    var pic_urls: Array<Any>?
    var text: String?
    var idstr:String?
    var gif_ids: String?
    var textLength: Int = 0
    var source_type: Int = 0
    var hasActionTypeCard: Int = 0
    var geo: String?
    var hot_weibo_tags: Array<Any>?
    var text_tag_tips: Array<Any>?
    var comments_count: Int = 0
    var thumbnail_pic: String?
    var source: String?
    var source_allowclick: Int = 0
    var biz_feature: Int = 0
    var positive_recom_flag: Int = 0
    var bmiddle_pic: String?
    var visible: Array<Any>?
    var in_reply_to_status_id: String?
    var mid: String?
    var reposts_count: Int = 0
    var mlevel: Int = 0
    var attitudes_count: Int = 0
    var darwin_tags: Array<Any>?
    var rid: String?
    var userType: Int = 0
    var in_reply_to_user_id: String?
    var original_pic: String?
    var annotations: Array<Any>?
    var user: UserModel?
}
