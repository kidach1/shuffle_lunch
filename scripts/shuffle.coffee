members = []
module.exports = (robot) ->

  robot.respond /test (.*)/i, (msg) ->
    msg.send robot.brain.get("members")

#  robot.respond /メンバーは(.*)/i, (msg) ->
##    robot.brain.redis_hash.client.set("members", msg.match[1])
#    msg.send "OK, #{msg.message.user.name}！ メンバーは【#{msg.match[1]}】だね！"

  robot.hear /しゃっふるしゃっふる/i, (msg) ->
    msg.send "ご、めんな・・嘘・・・な、んだ。。"

#  robot.hear /腹減った|ハラ減った|はらへった|はら減った|腹へった|おなか減った|お腹減った|おなかへった|お腹へった|お腹すいた|おなかすいた|お腹空いた|おなか空いた|おなかぺこぺこ|背中とお腹もくっついちゃう|お腹と背中がくっついちゃう|みんなでご飯いこー！/i, (result) ->
  robot.respond /メンバーは(.*)/i, (msg) ->
    _ = undefined
    _ = require("lodash")
    if (result.message.user.name == "kanako.tsutsumi")
      MIN_LUNCH_MEMBER_NUM = undefined
      i = 0
      j = 0
      k = 0
      lunchGroup = undefined
      recommend = undefined
      res = undefined
      shuffled = undefined
      MIN_LUNCH_MEMBER_NUM = 5
#      members_str = robot.brain.get("members")
      members_arr = msg.match[1].split("、")
      console.log(members_arr)
      shuffled = _.shuffle(members_arr)
      lunchGroup = []

      res = "===== 本日のLXシャッフルランチ =====\n"
      while shuffled.length >= MIN_LUNCH_MEMBER_NUM
        lunchGroup[i] = shuffled.splice(0, MIN_LUNCH_MEMBER_NUM)
        i++

      console.log(shuffled)

      while shuffled.length > 0
        console.log(j)
        console.log(lunchGroup[j])
        console.log("shuffled.length", shuffled.length)
        console.log("lunchGroup.length", lunchGroup.length)
        groupIndex = ((shuffled.length)%(lunchGroup.length))
        lunchGroup[groupIndex].push shuffled.splice(0, 1)[0]
        j++

      while k < lunchGroup.length
        res += "チーム" + (k+1) + ": " + lunchGroup[k].toString() + "\n"
        k++

      res += "\n"
      res += "※ 来れない人もいると思うので、適当にマージしたり柔軟に対応してくれ\n"
      recommend = [ "お寿司", "バナナ", "TKG", "ステーキ", "納豆", "カスピ海ヨーグルト", "しめじ", "なめこ", "白米", "にんじん", "野菜", "豆腐", "種なし梅（岡田さんセレクト）" ]
      res += "\n今日のおすすめメニューは" + _.sample(recommend) + "だよ！"
      res += "\nhave fun！"
      result.send res
    else
      msg = [ "なんだ、つっつんじゃないのか", "耐えろ", "合言葉変わったんだよね -> しゃっふるしゃっふる" ]
      result.send _.sample(msg)
