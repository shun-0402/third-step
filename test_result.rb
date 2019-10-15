#! /usr/bin/ruby
#encoding: utf-8

science = [65, 80, 67, 35, 58, 60, 72, 75, 68, 92, 36, 50, 2, 58.5, 46, 42, 78, 62, 84, 70]
english = [44, 87, 100, 63, 52, 60, 58, 73, 55, 86, 29, 56, 89, 23, 65, 84, 64, 27, 86, 84]

class Array
  #合計点を求める
  def sum
    inject(:+)
  end

  #平均を求める
  def ave
    sum.to_f / length
  end

  #分散を求める
  def var
    a = ave
    inject(0) { |i,n| i + (n - a) ** 2 } / length
  end

  #標準偏差を求める
  def sd
    Math.sqrt(var)
  end
end

#偏差を求める
def dv(score,array)
  (score - array.ave) / array.sd * 10 + 50
end

puts "理科の合計点: #{science.sum}点"
puts "理科の平均点: #{science.ave}点"
puts "理科の標準偏差: #{science.sd}"
puts ""
puts "英語の合計点: #{english.sum}点"
puts "英語の平均点: #{english.ave}点"
puts "英語の標準偏差: #{english.sd}"
puts ""

20.times do |num|
  puts "--#{num+1}人目の偏差値--"
  puts "理科の偏差値: #{dv(science[num],science)}"
  puts "英語の偏差値: #{dv(english[num],english)}"
  puts ""
end

#降順にソートする
science.sort!
english.sort!
puts "---点数ランキング---"
puts "--理科--   --英語--"
20.times do |i|
  puts "  #{science[19-i]}点      #{english[19-i]}点"
end