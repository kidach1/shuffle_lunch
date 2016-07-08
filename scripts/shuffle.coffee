members = []
module.exports = (robot) ->
  robot.hear /set/i, (result) ->
    members = [ "谷口", "村上さん", "岡田さん", "かなPさん", "ざっきーさん", "ばびーさん", "まいまい", "塩田さん", "あきさん", "かささん", "てるいさん", "田中さん(eng)", "けいぽんさん", "たずさん", "あっきーさん", "遠藤さん", "清山さん", "佐竹さん", "能登さん", "小野寺さん", "ぽりさん", "三好さん", "中村さん", "田中(苑)さん", "石山くん", "倉田さん", "松本さん", "畑谷さん" ]
    robot.brain.set("members", members)


module.exports = (robot) ->
  robot.hear /腹減った|ハラ減った|はらへった|はら減った|腹へった|おなか減った|お腹減った|おなかへった|お腹へった|お腹すいた|おなかすいた|お腹空いた|おなか空いた/i, (result) ->
    members = [ "谷口", "村上さん", "岡田さん", "かなPさん", "ざっきーさん", "ばびーさん", "まいまい", "塩田さん", "あきさん", "かささん", "てるいさん", "田中さん(eng)", "けいぽんさん", "たずさん", "あっきーさん", "遠藤さん", "清山さん", "佐竹さん", "能登さん", "小野寺さん", "ぽりさん", "三好さん", "中村さん", "田中(苑)さん", "石山くん", "倉田さん", "松本さん", "畑谷さん" ]
    robot.brain.set("members", members)
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
    members = robot.brain.get("members")
    console.log(members)
    shuffled = _.shuffle(members)
    lunchGroup = []
    i = 1
    res = "===== 本日のdawnシャッフルランチ =====\n"
    while shuffled.length >= MIN_LUNCH_MEMBER_NUM
      lunchGroup[i] = shuffled.splice(0, MIN_LUNCH_MEMBER_NUM)
      i++
    j = 1
    while shuffled.length > 0
      lunchGroup[j].push shuffled.splice(0, 1)[0]
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
