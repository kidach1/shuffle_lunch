members = []
module.exports = (robot) ->

  robot.respond /test (.*)/i, (msg) ->
    msg.send robot.brain.get("members")

#  robot.respond /メンバーは(.*)/i, (msg) ->
#    robot.brain.redis_hash.client.set("members", msg.match[1])
#    msg.send "OK, #{msg.message.user.name}！ メンバーは【#{msg.match[1]}】だね！"

  robot.hear /みんなでご飯いこー！メンバーは(.*)/i, (result) ->
    _ = undefined
    _ = require("lodash")
    MIN_LUNCH_MEMBER_NUM = undefined
    i = 0
    j = 0
    k = 0
    lunchGroup = undefined
    recommend = undefined
    res = undefined
    shuffled = undefined
    MIN_LUNCH_MEMBER_NUM = 5
    members_arr = result.match[1].split("、")
    console.log(members_arr)
    shuffled = _.shuffle(members_arr)
    lunchGroup = []

    res = "===== 本日のシャッフルランチ =====\n"
    while shuffled.length >= MIN_LUNCH_MEMBER_NUM
      lunchGroup[i] = shuffled.splice(0, MIN_LUNCH_MEMBER_NUM)
      i++

    while shuffled.length > 0
      groupIndex = ((shuffled.length)%(lunchGroup.length))
      lunchGroup[groupIndex].push shuffled.splice(0, 1)[0]
      j++

    while k < lunchGroup.length
      res += "チーム" + (k+1) + ": " + lunchGroup[k].toString() + "\n"
      k++

    res += "\n"
    res += "※ 来れない人もいると思うので、適当にマージしたり柔軟に対応してくれ\n"
    recommend = [ "お寿司", "バナナ", "TKG", "カスピ海ヨーグルト", "なめこ", "白米", "にんじん", "野菜", "豆腐", "バーニャカウダ", "白い恋人", "酵素" ]
    res += "\n今日のおすすめメニューは" + _.sample(recommend) + "だよ！"
    res += "\nhave fun！"
    result.send res
