require "csv"


def create_memo
  puts "1(新規でメモを作成) 2(既存のメモを編集する)"
  
  memo_type = gets.to_i
  
  if memo_type == 1
    puts "拡張子を除くファイル名を入力してください"
    memo_title = gets.chomp.to_s
    puts "ファイル名: #{memo_title}" + ".csv"
    puts "----------------------------------"
    
    puts "メモの内容を入力してください"
    puts "入力が終わったら[ctrl + D]を押します"
    
    CSV.open("#{memo_title}" + ".csv", "w") do |csv|
      content = readlines.map(&:chomp)
      csv << content
      
      puts "以下の内容でメモを作成しました"
      puts "ファイル名: #{memo_title}" + ".csv"
      puts "#{content}"
      
    end

  elsif memo_type == 2
    
    puts "編集するメモのファイル名を入力してください"
    edit_title = gets.chomp.to_s
    puts "ファイル名: #{edit_title}" + ".csv"
    puts "----------------------------------"
    
    puts "追記する内容を入力してください"
    puts "入力が終わったら[ctrl + D]を押します"
    
    CSV.open("#{edit_title}.csv", "a") do |csv|
      content = readlines.map(&:chomp)
      csv << content
      
      puts "以下の内容で追記しました"
      puts "ファイル名: #{edit_title}" + ".csv"
      puts "#{content}"
    end
    
  else
    puts "該当する番号がありません"
    puts "(１)もしくは(２)を入力してください"
    puts "----------------------------------"
    create_memo
  end
end

create_memo