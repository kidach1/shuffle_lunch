module.exports = (robot) ->

  robot.hear /腹減った|ハラ減った|はらへった|はら減った|腹へった|おなか減った|お腹減った|おなかへった|お腹へった|お腹すいた|おなかすいた|お腹空いた|おなか空いた/i, (result) ->
    _ = require('lodash')
    DEFAULT_LUNCH_MEMBER_NUM = 5
    MIN_LUNCH_MEMBER_NUM = 5
    members = [
      'かなPさん'
      '谷口'
      '村上さん'
      '岡田さん'
      'ざっきーさん'
      'ばびーさん'
      'まいまい'
      '塩田さん'
      'あきさん'
      'かささん'
      'てるいさん'
      '田中さん'
      'たずさん'
      'あっきーさん'
      'ぽにょさん'
      '勝又さん'
      '遠藤さん'
      '島崎さん'
      '佐竹さん'
      '能登さん'
      '小野寺さん'
    ]
    shuffled = _.shuffle(members)
    i = 1
    res = '===== 本日のdawnシャッフルランチ =====\n'
    while shuffled.length >= DEFAULT_LUNCH_MEMBER_NUM + MIN_LUNCH_MEMBER_NUM
      lunchMembers = shuffled.splice(0, DEFAULT_LUNCH_MEMBER_NUM)
      res += 'チーム' + i + ': ' + lunchMembers.toString() + '\n'
      i++
    res += 'チーム' + i + ': ' + shuffled.toString() + '\n'
    res += '※人数揃わない場合は適当にマージしてくれ\n'

    recommend = [
      'お寿司',
      'バナナ',
      'TKG',
      'ステーキ',
      '納豆',
      'カスピ海ヨーグルト',
      'しめじ',
      'なめこ',
      '白米',
      'にんじん',
      '野菜',
      '豆腐',
    ]

    res += '\n今日のおすすめメニューは' + _.sample(recommend) + 'だよ！';
    res += '\nhave fun！';

#    random = [
#      'はいはい',
#      'へいへい',
#      'なに？',
#      'ここで辻村さんの一発芸',
#      '納豆'
#    ]
#    res = _.sample(random)

    result.send res

# ---
# generated by js2coffee 2.1.0
