
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
        when "client", "client "
            client()
        when "shell", "shell "
            puts "-press exit for exit"
            shell_cmd()
        when "clear","clear ", "cls"
            system("clear")
            system("cls")
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
- server/client            :server client chat
- clear                    :clear terminal
- exit to left


Created by nyutiz#6350
Available on www.nyutiz.ga/nyutMenuRUBY.html
'
end

def server()
    puts "Press Ctrl+C to exit."
    server = TCPServer.new(2000)
    connection = server.accept
    while (input = connection.gets)
    print "client>"
    puts input
    end
end

def client()
    client_socket = TCPSocket.new('localhost', 2000)
    puts "Press Ctrl+C to exit."
    print "client> "
    input = gets.chomp
    client_socket.puts input
    client_socket.close
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
