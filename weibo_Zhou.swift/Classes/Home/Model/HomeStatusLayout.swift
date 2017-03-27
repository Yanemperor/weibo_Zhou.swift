//
//  HomeStatusLayout.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/2/15.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit
import YYText
import YYCategories

public let kWBCellTopMargin: CGFloat = 8.0                 //cell 顶部灰色空白
public let kWBCellTitleHeight: CGFloat = 55.0              // cell 标题高度 (例如"仅自己可见") 36
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

/// 微博类型, 这里我分4种类型
enum WBStatusCellType {
    case WBStatusCellNomal       ///< 有文字
    case WBStatusCellPic         ///< 有文字有图片
    case WBStatusCellRetweet     ///< 有文字有转发文字
    case WBStatusCellRetweetPic  ///< 有文字有转发文字有图片
}

class HomeStatusLayout: NSObject {
    //数据
    var homeModel: HomeModel? {
        didSet {
            if (homeModel?.retweeted_status != nil) {
                if (homeModel?.retweeted_status?.pic_urls?.count)! > 0 {
                    statusCellType = WBStatusCellType.WBStatusCellRetweetPic
                }else{
                    statusCellType = WBStatusCellType.WBStatusCellRetweet
                }
            }else{
                if (homeModel?.pic_urls?.count)! > 0 {
                    statusCellType = WBStatusCellType.WBStatusCellPic
                }else{
                    statusCellType = WBStatusCellType.WBStatusCellNomal
                }
            }
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
            
            //文本处理
            let text: String = (homeModel?.text)!
            
            /// 先处理全文
            textLayout = self.dealText(textString: text)
            
            /// 处理图片 微博图片规则, 一张图片
            picArray.removeAllObjects()
            if homeModel?.pic_urls != nil {
                for item in (homeModel?.pic_urls)! {
                    picArray.add(item["thumbnail_pic"]!)
                }
            }
            if picArray.count > 0 {
                isHavePic = true
                showPic = homeModel?.original_pic!
                let smallPicWidth: CGFloat = (kScreenWidth - 2 * (kWBCellPaddingPic + kWBCellPadding)) / 3.0
                let smallPicHeight: CGFloat = smallPicWidth
                
                switch picArray.count {
                case 1:
                    picSize = CGSize(width: (kScreenWidth - 2 * kWBCellPadding) * 2 / 3, height: (kScreenWidth - 2 * kWBCellPadding) * 2 / 3)
                    picHeight = (picSize?.height)!
                case 2,3:
                    picSize = CGSize(width: kScreenWidth, height: smallPicHeight + kWBCellPaddingText)
                    picHeight = (picSize?.height)!
                case 4,5,6:
                    picSize = CGSize(width: kScreenWidth, height: smallPicHeight * 2 + kWBCellPaddingText + kWBCellPaddingPic)
                    picHeight = (picSize?.height)!
                case 7,8,9:
                    picSize = CGSize(width: kScreenWidth, height: smallPicHeight * 3 + kWBCellPaddingText + kWBCellPaddingPic * 2)
                    picHeight = (picSize?.height)!
                default:
                    return
                }
            }else{
                isHavePic = false
            }
            updateRowHeight()
 
        }
    }
    
    //计算cell高度
    func updateRowHeight() {
        var height = marginTop + titleHeight + kWBCellPaddingText
        let textSize: CGSize = CGSize(width: kScreenWidth - 12 * 2, height: CGFloat(MAXFLOAT))
        if let text = textLayout {
            height += text.boundingRect(with: textSize, options: [.usesLineFragmentOrigin], context: nil).height + 10
        }
        if self.picArray.count > 0 {
            height += picHeight
        }
        self.height = height
    }
    
    // MARK: - 布局结果
    //cell类型
    var statusCellType: WBStatusCellType?   //cell类型
    
    
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
    var textHeight: CGFloat = 0             //文本高度(包括下方留白)
    var textSize: CGSize = CGSize.zero
    var textLayout: NSMutableAttributedString?         //文本
    var statusHeight: CGFloat {
        return textHeight
    }
    var textURLString: String = ""

    
    //图片
    var picHeight: CGFloat = 0                 //图片高度, 0为没图片
    var picSize: CGSize?
    lazy var picArray: NSMutableArray = {
        let temp: NSMutableArray = NSMutableArray()
        return temp
    }()
    var isHavePic: Bool = false
    var showPic: String?
    
    
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
    var height: CGFloat?
    
    
    
    
    
    
    func dealText(textString: String) -> NSMutableAttributedString {
        var text: String = textString
        var isFullText: Bool = false
        if text.contains("全文") {
            let textTemp1: Array = text.components(separatedBy: "全文")
            text = textTemp1[0]
            let textTemp2: Array = textTemp1[1].components(separatedBy: " ")
            if textTemp2.count > 1 {
                self.textURLString = textTemp2[1]
            }
            isFullText = true
        }
        
        /// #话题#, URL链接, @
        //    NSString *user = [str firstMatch:RX(@"@[-_a-zA-Z0-9\u4E00-\u9FA5]+")];      //@用户
        //    NSString *http = [str firstMatch:RX(@"http(s)?://([A-Za-z0-9._-]+(/)?)*")]; //http
        //    NSString *topic = [str firstMatch:RX(@"#[^@#]+?#")];                           //话题
        //    NSString *emotions = [str firstMatch:RX(@"\\[[^ \\[\\]]+?\\]")];
        
        let regularExpressions = ZhouRegularExpressionsTools()
        let httpArray: NSArray = regularExpressions.matchingHTTP(text: text)
        if httpArray.count > 0 {
            var tempText: NSString = NSString.init(string: text)
            for item in httpArray.reversed() {
                tempText = tempText.replacingCharacters(in: item as! NSRange, with: "网页链接") as NSString
            }
            text = tempText as String
        }
        let attachment: NSMutableAttributedString = NSMutableAttributedString(string: text)
        let font: UIFont = UIFont.systemFont(ofSize: CGFloat(kWBCellTextFontSize))
        attachment.addAttribute(NSFontAttributeName, value: font, range: NSMakeRange(0, attachment.length))
        let color: UIColor = kWBCellTextNormalColor!
        attachment.addAttribute(NSForegroundColorAttributeName, value: color, range: NSMakeRange(0, attachment.length))
        if isFullText {
            let fullText: NSAttributedString = NSAttributedString(string: "全文", attributes: [NSForegroundColorAttributeName : kWBCellTextHighlightColor!, NSFontAttributeName : UIFont.boldSystemFont(ofSize: CGFloat(kWBCellTextFontSize))])
            attachment.append(fullText)
        }
        let userNameArray: NSArray = regularExpressions.matchingUserName(text: text)
        if userNameArray.count > 0{
            for item in userNameArray {
                attachment.addAttribute(NSForegroundColorAttributeName, value: kWBCellTextHighlightColor!, range: item as! NSRange)
            }
        }
        let topicArray: NSArray = regularExpressions.matchingTopic(text: text)
        if topicArray.count > 0 {
            for item in topicArray {
                attachment.addAttribute(NSForegroundColorAttributeName, value: kWBCellTextHighlightColor!, range: item as! NSRange)
            }
        }
        if httpArray.count > 0 {
            for _ in httpArray {
                let temp: NSRange = NSString.init(string: text) .range(of: "网页链接")
                attachment.addAttribute(NSForegroundColorAttributeName, value: kWBCellTextHighlightColor!, range: temp)
            }
        }
        
        let emoticon: EmoticonTools = EmoticonTools.sharedInstance
        emoticon.getEmoticon()
        // 匹配表情
        //创建匹配正则表达式的类型描述模板
        let pattern: String = "\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]"
        //创建匹配对象
        let regulareExpression: NSRegularExpression = try! NSRegularExpression.init(pattern: pattern, options: .caseInsensitive)
        let matches: NSArray = regulareExpression.matches(in: text, options: .reportCompletion, range: NSMakeRange(0, text.characters.count)) as NSArray
        let textStr: NSString = NSString.init(string: text)
        if matches.count > 0 {
            for item in matches.reversed() {
                let match: NSTextCheckingResult = item as! NSTextCheckingResult
                let range: NSRange = match.range
                let mStr: String = textStr.substring(with: NSMakeRange(range.location + 1, range.length - 2))
                let key: String = "/" + mStr
                let value: String? = emoticon.dataDic.object(forKey: key) as! String?
                if value != nil {
                    let image: UIImage = UIImage.init(contentsOfFile: (emoticon.imagePath! + "/" + value! + "@2x.png"))!
//                    let imgAttributedStr: NSMutableAttributedString = NSMutableAttributedString.yy_attachmentString(withEmojiImage: image, fontSize: 18)!
                    let imgAttributedStr = NSTextAttachment()
                    imgAttributedStr.image = image
                    imgAttributedStr.bounds = CGRect(x: 0, y: -3, width: 18, height: 18)
                    let imageStr = NSAttributedString(attachment: imgAttributedStr)
                    attachment.replaceCharacters(in: range, with: imageStr)
                }
            }
        }
        return attachment
    }
    
    lazy var textLabel: UILabel = {
        let temp: UILabel = UILabel()
        temp.numberOfLines = 0
        return temp
    }()
    
}


extension String {
    //    constrainedToSize 如果一行，用CGSizeZero，否则用CGSizeMake(你想要的宽度, CGFloat(MAXFLOAT)
    func textSizeWithFont(font: UIFont, constrainedToSize size:CGSize) -> CGSize {
        var textSize:CGSize!
        if size.equalTo(CGSize.zero) {
            let attributes = NSDictionary(object: font, forKey: NSFontAttributeName as NSCopying)
            textSize = self.size(attributes: attributes as? [String : AnyObject])
        } else {
            let option = NSStringDrawingOptions.usesLineFragmentOrigin
            let attributes = NSDictionary(object: font, forKey: NSFontAttributeName as NSCopying)
            let stringRect = self.boundingRect(with: size, options: option, attributes: attributes as? [String : AnyObject], context: nil)
            textSize = stringRect.size
        }
        return textSize
    }
}

