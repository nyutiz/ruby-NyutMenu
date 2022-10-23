#!/usr/bin/env ruby
require 'readline'
require 'socket'
require 'etc'
require 'io/console'
require 'timeout'

def nyut_menu()
  puts "
      █▄░█ █▄█ █░█ ▀█▀ █▀▄▀█ █▀▀ █▄░█ █░█
      █░▀█ ░█░ █▄█ ░█░ █░▀░█ ██▄ █░▀█ █▄█
  ╔════════════════════════════════════════╗
  ║═════════║ Welcome to the menu ║════════║
  ║══════════════║ By Nyutiz ║═════════════║
  ╚════════════════════════════════════════╝
"
end

def main
  loop do
    selection = Readline.readline("> ", true)
    case selection
    when "help"
      help()
    when "hist"
      puts Readline::HISTORY.to_a
    when "server", "server "
      server()
    when "shell", "shell "
      puts "-press exit for exit"
      shell_cmd()
    when "clear","clear ", "cls"
      system("clear")
      nyut_menu()
    when "exit", "exit "
      system(exit)
    else
      help()
    end
    Readline::HISTORY.pop if selection == ""
  end
end

def help()
  puts 'Command list:
- shell                    :start os terminal
                            ╚═"sudo su" for total control
- clear                    :clear terminal
- exit to left


Created by nyutiz#6350
Available on www.nyutiz.ga/nyutMenuRUBY.html
'
end

def server()
  puts "press ctrl + c for exit"
  server = TCPServer.new(2000)
  connection = server.accept
  while (input = connection.gets)
  print "client>"
  puts input
end

end

def shell_cmd()
  hostname = Etc.getlogin + "@" +Socket.gethostname
  print "#{hostname}$"
  shell_command = gets.chomp
  if shell_command != "exit"
    system(shell_command)
    shell_cmd()
  end
  main()
end

nyut_menu()
sleep 0.5
main()

