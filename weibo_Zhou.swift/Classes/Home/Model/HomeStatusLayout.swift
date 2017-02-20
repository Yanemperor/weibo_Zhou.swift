//
//  HomeStatusLayout.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/2/15.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit
import YYCategories

public let kWBCellTopMargin: CGFloat = 8.0                 //cell 顶部灰色空白
public let kWBCellTitleHeight: CGFloat = 0.0              // cell 标题高度 (例如"仅自己可见") 36
public let kWBCellPadding: CGFloat = 12.0                  // cell 内边距
public let kWBCellPaddingText: CGFloat = 10.0              // cell 文本与其他元素间留白
public let kWBCellPaddingPic: CGFloat = 4.0                // cell 多张图片中间留白
public let kWBCellProfileHeight: CGFloat = 56.0            // cell 名片高度
public let kWBCellCardHeight: CGFloat = 70.0               // cell card 视图高度
public let kWBCellNamePaddingLeft: CGFloat = 14.0          // cell 名字和 avatar 之间留白
public let kWBCellContentWidth = kScreenWidth - 2 * CGFloat(kWBCellPadding)  // cell 内容宽度
public let kWBCellNameWidth = kScreenWidth - 110 // cell 名字最宽限制

public let kWBCellTagPadding = 8         // tag 上下留白
public let kWBCellTagNormalHeight = 16   // 一般 tag 高度
public let kWBCellTagPlaceHeight = 24    // 地理位置 tag 高度

public let kWBCellToolbarHeight = 35     // cell 下方工具栏高度
public let kWBCellToolbarBottomMargin = 2 // cell 下方灰色留白

// 字体 应该做成动态的，这里只是 Demo，临时写死了。
public let kWBCellNameFontSize = 16      // 名字字体大小
public let kWBCellSourceFontSize = 12    // 来源字体大小
public let kWBCellTextFontSize = 17      // 文本字体大小
public let kWBCellTextFontRetweetSize = 16 // 转发字体大小
public let kWBCellCardTitleFontSize = 16 // 卡片标题文本字体大小
public let kWBCellCardDescFontSize = 12 // 卡片描述文本字体大小
public let kWBCellTitlebarFontSize = 14 // 标题栏字体大小
public let kWBCellToolbarFontSize = 14 // 工具栏字体大小

// 颜色
public let kWBCellNameNormalColor = UIColor(hexString: "333333") // 名字颜色
public let kWBCellNameOrangeColor = UIColor(hexString: "f26220")  // 橙名颜色 (VIP)
public let kWBCellTimeNormalColor = UIColor(hexString: "828282")  // 时间颜色
public let kWBCellTimeOrangeColor = UIColor(hexString: "f28824")  // 橙色时间 (最新刷出)

public let kWBCellTextNormalColor = UIColor(hexString: "333333")  // 一般文本色
public let kWBCellTextSubTitleColor = UIColor(hexString: "5d5d5d")  // 次要文本色
public let kWBCellTextHighlightColor = UIColor(hexString: "527ead")  // Link 文本色
public let kWBCellTextHighlightBackgroundColor = UIColor(hexString: "bfdffe")  // Link 点击背景色
public let kWBCellToolbarTitleColor = UIColor(hexString: "929292") // 工具栏文本色
public let kWBCellToolbarTitleHighlightColor = UIColor(hexString: "df422d")  // 工具栏文本高亮色

public let kWBCellBackgroundColor = UIColor(hexString: "f2f2f2")     // Cell背景灰色
public let kWBCellHighlightColor = UIColor(hexString: "f0f0f0")      // Cell高亮时灰色
public let kWBCellInnerViewColor = UIColor(hexString: "f7f7f7")    // Cell内部卡片灰色
public let kWBCellInnerViewHighlightColor = UIColor(hexString: "f0f0f0")  // Cell内部卡片高亮时灰色
public let kWBCellLineColor = UIColor(white: 0.000, alpha: 0.09) //线条颜色

public let kWBLinkHrefName = "href" //NSString
public let kWBLinkURLName = "url" //WBURL
public let kWBLinkTagName = "tag" //WBTag
public let kWBLinkTopicName = "topic" //WBTopic
public let kWBLinkAtName = "at" //NSString

/// 风格
enum WBLayoutStyle {
    case WBLayoutStyleTimeline  ///< 时间线 (目前只支持这一种)
    case WBLayoutStyleDetail    ///< 详情页
}

/// 认证方式
enum WBUserVerifyType {
    case WBUserVerifyTypeNone     ///< 没有认证
    case WBUserVerifyTypeStandard    ///< 个人认证，黄V
    case WBUserVerifyTypeOrganization ///< 官方认证，蓝V
    case WBUserVerifyTypeClub         ///< 达人认证，红星
}

/// 卡片类型 (这里随便写的，只适配了微博中常见的类型)
enum WBStatusCardType {
    case WBStatusCardTypeNone   ///< 没卡片
    case WBStatusCardTypeNormal ///< 一般卡片布局
    case WBStatusCardTypeVideo  ///< 视频
}

/// 最下方Tag类型，也是随便写的，微博可能有更多类型同时存在等情况
enum WBStatusTagType {
    case WBStatusTagTypeNone     ///< 没Tag
    case WBStatusTagTypeNormal   ///< 文本
    case WBStatusTagTypePlace    ///< 地点
}

class HomeStatusLayout: NSObject {
    //数据
    var homeModel: HomeModel? {
        didSet {
            if homeModel?.user?.cardid != nil {
                vipBackgroundImageURL = "http://img.t.sinajs.cn/t6/skin/public/feed_cover/" + (homeModel?.user?.cardid)! + "_os7.png?version=2015080302"
                //判断是不是vip
                let range = vipBackgroundImageURL?.range(of: "vip")
                if range != nil{
                    isVIP = true
                }else{
                    isVIP = false
                }
            }
            if homeModel?.user?.avatar_hd != nil {
                headViewURL = URL(string: (homeModel?.user?.avatar_hd)!)
                titleHeight += (40 + 15)
            }
            
            let verified: Int = (homeModel?.user?.verified_type)!
            
            
            switch verified {
            case 220:
                userVerifyType = WBUserVerifyType.WBUserVerifyTypeClub
            case 1:
                userVerifyType = WBUserVerifyType.WBUserVerifyTypeStandard
            case 3:
                userVerifyType = WBUserVerifyType.WBUserVerifyTypeOrganization
            default:
                userVerifyType = WBUserVerifyType.WBUserVerifyTypeNone
            }
            
            
            nameTextLayout = (homeModel?.user?.name)!
            
            mbrank = (homeModel?.user?.mbrank)!
            
            if homeModel?.created_at != nil {
                let dateTools: ZhouDateTools = ZhouDateTools.init(en_USTimeStamp: (homeModel?.created_at)!)
                let temp: String = dateTools.weiboTime()
                sourceTextLayout = temp
            }
            
            if homeModel?.source != nil {
                let temp1: Array = (homeModel?.source?.components(separatedBy: ">"))!
                if temp1.count >= 2 {
                    let tempStr = temp1[1]
                    if !tempStr.isEmpty {
                        let temp2: Array = temp1[1].components(separatedBy: "<")
                        sourceTextLayout = sourceTextLayout + " 来自于" + temp2[0]
                    }
                }
            }
        }
    }
    
    // MARK: - 布局结果
    //顶部留白
    var marginTop = kWBCellTopMargin        //顶部灰色留白
    
    //标签栏
    var titleHeight = kWBCellTitleHeight    //标题栏高度, 0为没标题栏
    var titleTextLayout = ""                //标题栏
    var vipBackgroundImageURL: String?
    var isVIP: Bool = false
    
    //个人资料
    var profileHeight: CGFloat?             //个人资料高度(包括留白)
    var nameTextLayout = ""                 //名字
    var sourceTextLayout = ""               //时间/来源
    var headViewURL: URL?
    var mbrank: Int = 0                     //会员等级
    var userVerifyType: WBUserVerifyType?   //认证方式
    
    //文本
    var textHeight: CGFloat?                //文本高度(包括下方留白)
    var textLayoout = ""                    //文本
    
    //图片
    var picHeight: CGFloat?                 //图片高度, 0为没图片
    var picSize: CGSize?
    
    //转发
    var retweetHeight: CGFloat?             //转发高度, 0为没转发
    var retweetTextHeight: CGFloat?         //转发文本高度
    var retweetTextLayout = ""              //被转发文本
    var retweetPicHeight: CGFloat?
    var retweetPicSize: CGSize?
    var retweetCardHeight: CGFloat?
    var retweetCardType: WBStatusCardType?
    var retweetCardTextLayout = ""          //被转发文本
    var retweetCardTextRect: CGRect?
    
    //卡片
    var cardHeight: CGFloat?                //卡片高度, 0为没卡片
    var cardType: WBStatusCardType?
    var cardTextLayout = ""                 //卡片文本
    var cardTextRect: CGRect?
    
    //Tag
    var tagHeight: CGFloat?                 //tap高度, 0为没tap
    var tagType: WBStatusTagType?
    var tagTextLayout = ""                  //最下方tag
    
    //工具栏(转发, 评论, 赞)
    var toolbarHeight: CGFloat?
    var toolbarRepostTextLayout = ""
    var toolbarCommentTextLayout = ""
    var toolbarLikeTextLayout = ""
    var toolbarRepostTextWidth: CGFloat?
    var toolbarCommentTextWidth: CGFloat?
    var toolbarLikeTextWidth: CGFloat?
    
    //下边留白
    var marginBottom: CGFloat?
    
    //总高度
    var height: CGFloat {
        return self.marginTop + titleHeight
    }
    
}




