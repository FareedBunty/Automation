import java.net.Socket

def host = 'localhost' // replace with your Jenkins host
def port = 8080 // replace with your Jenkins port

try {
    Socket socket = new Socket(host, port)
    println("Jenkins is running.")
    socket.close()
} catch (Exception e) {
    println("Jenkins is not running.")
}
