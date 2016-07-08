members = []
module.exports = (robot) ->

  robot.respond /test (.*)/i, (msg) ->
    msg.send robot.brain.get("members")

  robot.respond /メンバーは(.*)/i, (msg) ->
    robot.brain.set("members", msg.match[1])
    msg.send "OK, #{msg.message.user.name}！ メンバーは【#{msg.match[1]}】だね！"

  robot.hear /腹減った|ハラ減った|はらへった|はら減った|腹へった|おなか減った|お腹減った|おなかへった|お腹へった|お腹すいた|おなかすいた|お腹空いた|おなか空いた/i, (result) ->
    MIN_LUNCH_MEMBER_NUM = undefined
    _ = undefined
    i = undefined
    j = undefined
    k = undefined
    lunchGroup = undefined
    recommend = undefined
    res = undefined
    shuffled = undefined
    _ = require("lodash")
    MIN_LUNCH_MEMBER_NUM = 5
    members_str = robot.brain.get("members")
    members_arr = members_str.split(",")
    console.log(members_arr)
    shuffled = _.shuffle(members_arr)
    lunchGroup = []
    i = 1
    res = "===== 本日のLXシャッフルランチ =====\n"
    while shuffled.length >= MIN_LUNCH_MEMBER_NUM
      lunchGroup[i] = shuffled.splice(0, MIN_LUNCH_MEMBER_NUM)
      i++

    console.log(shuffled)
    j = 1
    while shuffled.length > 0
      console.log(j)
      console.log(lunchGroup[j])
      groupIndex = ((shuffled.length)%(lunchGroup.length)+1)
      lunchGroup[groupIndex].push shuffled.splice(0, 1)[0]
      j++
    k = 1
    while k < lunchGroup.length
      res += "チーム" + k + ": " + lunchGroup[k].toString() + "\n"
      k++
    res += "\n"
    res += "※ 来れない人もいると思うので、適当にマージしたり柔軟に対応してくれ\n"
    recommend = [ "お寿司", "バナナ", "TKG", "ステーキ", "納豆", "カスピ海ヨーグルト", "しめじ", "なめこ", "白米", "にんじん", "野菜", "豆腐", "種なし梅（岡田さんセレクト）" ]
    res += "\n今日のおすすめメニューは" + _.sample(recommend) + "だよ！"
    res += "\nhave fun！"
    result.send res
