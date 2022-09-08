# https://docs.ruby-lang.org/ja/latest/class/FileUtils.html
require "fileutils"

# コマンドのインターフェース
class Command
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def execute
  end

  def undo_execute
  end
end

# ファイルを作成する命令
class CreateFile < Command
  def initialize(path, contents)
    super("Create file : #{path}")
    @path = path
    @contents = contents
  end

  def execute
    f = File.open(@path, "w")
    f.write(@contents)
    f.close
  end

  def undo_execute
    File.delete(@path)
  end
end

# ファイルを削除する命令
class DeleteFile < Command
  def initialize(path)
    super("Delete file: #{path}")
    @path = path
  end

  def execute
    if File.exists?(@path)
      @content = File.read(@path)
    end
    File.delete(@path)
  end

  def undo_execute
    f = File.open(@path, "w")
    f.write(@contents)
    f.close
  end
end

# ファイルをコピーする命令
class CopyFile < Command
  def initialize(source, target)
    super("Copy file: #{source} to #{target}")
    @source = source
    @target = target
  end

  def execute
    FileUtils.copy(@source, @target)
  end

  def undo_execute
    File.delete(@target)
    if(@contents)
      f = File.open(@target, "w")
      f.write(@contents)
      f.close
    end
  end
end

# 複数のコマンドをまとめて実行できるようにしたオブジェクト
class CompositeCommand < Command
  def initialize
    @commands = []
  end

  def add_command(cmd)
    @commands << cmd
  end

  def execute
    @commands.each { |cmd| cmd.execute }
  end

  def undo_execute
    @commands.reverse.each { |cmd| cmd.undo_execute }
  end

  def description
    description = ""
    @commands.each { |cmd| description += cmd.description + "\n"}
    description
  end
end

p command_list = CompositeCommand.new
p command_list.add_command(CreateFile.new("file1.txt", "hello world\n"))
p command_list.add_command(CopyFile.new("file1.txt", "file2.txt"))
p command_list.add_command(DeleteFile.new("file1.txt"))
p command_list.execute
p command_list.description
# ➜  Command git:(main) ✗ be ruby command.rb
# #<CompositeCommand:0x00000001011f3f68 @commands=[]>
# [#<CreateFile:0x00000001011f35b8 @description="Create file : file1.txt", @path="file1.txt", @contents="hello world\n">]
# [#<CreateFile:0x00000001011f35b8 @description="Create file : file1.txt", @path="file1.txt", @contents="hello world\n">, #<CopyFile:0x00000001011f2c58 @description="Copy file: file1.txt to file2.txt", @source="file1.txt", @target="file2.txt">]
# [#<CreateFile:0x00000001011f35b8 @description="Create file : file1.txt", @path="file1.txt", @contents="hello world\n">, #<CopyFile:0x00000001011f2c58 @description="Copy file: file1.txt to file2.txt", @source="file1.txt", @target="file2.txt">, #<DeleteFile:0x00000001011f22d0 @description="Delete file: file1.txt", @path="file1.txt">]
# [#<CreateFile:0x00000001011f35b8 @description="Create file : file1.txt", @path="file1.txt", @contents="hello world\n">, #<CopyFile:0x00000001011f2c58 @description="Copy file: file1.txt to file2.txt", @source="file1.txt", @target="file2.txt">, #<DeleteFile:0x00000001011f22d0 @description="Delete file: file1.txt", @path="file1.txt", @content="hello world\n">]
# "Create file : file1.txt\nCopy file: file1.txt to file2.txt\nDelete file: file1.txt\n"

# command_list.undo_execute