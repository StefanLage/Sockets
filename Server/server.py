from twisted.internet.protocol import Factory, Protocol
from twisted.internet import reactor

class Chat(Protocol):
	def connectionMade(self):
		self.factory.clients.append(self)
		print "Someone is connected"
	def connectionLost(self, reason):
		self.factory.clients.remove(self)
		print "A client is deconnected"


factory = Factory()
factory.protocol = Chat
factory.clients = []
reactor.listenTCP(80, factory)
print "Connection opened"
reactor.run()
