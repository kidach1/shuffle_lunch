robot.respond(/お腹すいた/i, function (result) {

  var _ = require("lodash");

  var DEFAULT_LUNCH_MEMBER_NUM = 4;
  var MIN_LUNCH_MEMBER_NUM = 4;

  members = [
    'かなPさん', '谷口', '村上さん', '岡田さん',
    'ざっきーさん', 'ばびーさん', 'まいまい', '塩田さん',
    'あきさん', 'かささん', 'てるいさん', '田中さん',
    'たずさん', 'あっきーさん', 'ぽにょさん', '勝又さん',
    '宮島さん'
  ];

  var shuffled = _.shuffle(members);

  var i = 1;
  var res = ""
  while (shuffled.length >= (DEFAULT_LUNCH_MEMBER_NUM + MIN_LUNCH_MEMBER_NUM)) {
    var lunchMembers = shuffled.splice(0, DEFAULT_LUNCH_MEMBER_NUM);
    res += "チーム" + i + ": " + lunchMembers.toString() + "\n"
    i++;
  }

  res += "チーム" + i + ": " + shuffled.toString() + "\n"
  res += "have fun!"

  console.log(res);

  return result.send(res);
});
