from twisted.internet.protocol import Factory, Protocol
from twisted.internet import reactor

class Chat(Protocol):
	def connectionMade(self):
		print "Someone is connected"

factory = Factory()
factory.protocol = Chat
reactor.listenTCP(80, factory)
print "Connection opened"
reactor.run()
