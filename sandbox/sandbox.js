module.exports = function(robot) {
  return robot.hear(/お腹すいた/i, function(result) {
    var DEFAULT_LUNCH_MEMBER_NUM, MIN_LUNCH_MEMBER_NUM, _, i, lunchMembers, members, recommend, res, shuffled;
    _ = require('lodash');
    DEFAULT_LUNCH_MEMBER_NUM = 4;
    MIN_LUNCH_MEMBER_NUM = 4;
    members = ['かなPさん', '谷口', '村上さん', '岡田さん', 'ざっきーさん', 'ばびーさん', 'まいまい', '塩田さん', 'あきさん', 'かささん', 'てるいさん', '田中さん', 'たずさん', 'あっきーさん', 'ぽにょさん', '勝又さん', '宮島さん'];
    shuffled = _.shuffle(members);
    i = 1;
    res = '===== 本日のdawnシャッフルランチ =====\n';
    while (shuffled.length >= DEFAULT_LUNCH_MEMBER_NUM + MIN_LUNCH_MEMBER_NUM) {
      lunchMembers = shuffled.splice(0, DEFAULT_LUNCH_MEMBER_NUM);
      res += 'チーム' + i + ': ' + lunchMembers.toString() + '\n';
      i++;
    }
    res += 'チーム' + i + ': ' + shuffled.toString() + '\n';
    recommend = ['お寿司', 'バナナ', '和食', 'ステーキ', '肉料理', '納豆', '一心', '中華', '麺類', '白米', '魚料理', '野菜', '豆腐'];
    res += '\n今日のおすすめメニューは・・・' + _.sample(recommend) + 'だよ！';
    res += '\nhave fun！';
    return result.send(res);
  });
};
