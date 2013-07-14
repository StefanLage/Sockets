from twisted.internet.protocol import Factory, Protocol
from twisted.internet import reactor

class Chat(Protocol):
	def connectionMade(self):
		self.factory.clients.append(self)
		print "Someone is connected"
	def connectionLost(self, reason):
		self.factory.clients.remove(self)
		print "A client is deconnected"
	def dataReceived(self, data):
		d_array = data.split(':')
		if len(d_array) > 1:
			command = d_array[0]
			content = d_array[1]
			msg = ""
			if command == "iam":
				self.name = content
				msg = self.name + " has joined"
			elif command == "msg":
				msg = self.name + ": " + content
				
			print msg

			for c in self.factory.clients:
				c.message(msg)
	def message(self, msg):
		self.transport.write(msg + '\n')

factory = Factory()
factory.protocol = Chat
factory.clients = []
reactor.listenTCP(80, factory)
print "Connection opened"
reactor.run()
