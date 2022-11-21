# SELECT id, name FROM actresses;
#  id |    name
# ----+------------
#   1 | 多部未華子
#   2 | 佐津川愛美
#   3 | 新垣結衣
#   4 | 堀北真希
#   5 | 吉高由里子
#   6 | 悠城早矢

names = [
  "多部未華子",
  "佐津川愛美",
  "新垣結衣",
  "堀北真希",
  "吉高由里子",
  "悠城早矢"
]

names.each do |name| 
  Actor.create(name: name)
end

  # 1 |          2 | 蝉しぐれ            | 2005
  # 2 |          1 | 夜のピクニック      | 2006
  # 3 |          4 | ALWAYS 三丁目の夕日 | 2005
  # 4 |          2 | 忍道-SHINOBIDO-     | 2012
  # 5 |          2 | 貞子vs伽椰子        | 2016
  # 6 |          4 | 県庁おもてなし課    | 2013
  # 7 |          5 | 真夏の方程式        | 2013

movies_record = [
  [2, "蝉しぐれ", 2005],
  [1, "夜のピクニック", 2006],
  [4, "ALWAYS 三丁目の夕日", 2005],
  [2, "忍道-SHINOBIDO", 2012],
  [2, "貞子vs伽椰子", 2016],
  [4, "県庁おもてなし課", 2013],
  [5, "真夏の方程式", 2013]
]

movies_record.each do |movie|
  Movie.create(
    actor: Actor.find(movie[0]),
    # actors_id: movie[0],
    title: movie[1],
    year: movie[2],
  )
end

# SELECT id, movie_id, key FROM tags;
#  id | movie_id |    key
# ----+----------+------------
#   1 |        1 | 時代劇
#   2 |        1 | 子役
#   3 |        3 | 昭和
#   4 |        5 | ホラー
#   5 |        7 | ミステリー
#   6 |        7 | 夏
#   7 |        6 | 公務員
#   8 |        6 | 地方活性
#   9 |        1 | 夏

tags_record = [
  [1, "時代劇"],
  [1, "子役"],
  [3, "昭和"],
  [5, "ホラー"],
  [7, "ミステリー"],
  [7, "夏"],
  [6, "公務員"],
  [6, "地方活性"],
  [1, "夏"]
]

tags_record.each do |tag|
  Tag.create(
    movie: Movie.find(tag[0]),
    key: tag[1]
  )
end