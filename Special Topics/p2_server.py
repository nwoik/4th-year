#!/usr/bin/python
import socket
import json

TCP_IP = '127.0.0.1'
TCP_PORT = 5005
BUFFER_SIZE = 1024
c_sqnr = 0
s_sqnr = 0
state = "CLOSED"
code = 3

def connect_and_hello(s_sqnr):
	state = 'CONNECTED'
	print ('<-- HELLO received, connected!')
	print ("--> sending HELLO_ACK")
	m_json = {}
	m_json['type'] = 'HELLO_ACK' 
	s_sqnr += 1
	m_json['sqnr'] = s_sqnr 
	c.send(json.dumps(m_json).encode())
	print ("--> sent data: " , json.dumps(m_json))

def close_and_data(s_sqnr):
	state = 'CLOSED'
	print ('<-- DATA received: %s' % m_json['data'])
	print ("--> sending CLOSE")
	m_json = {}
	m_json['type'] = 'CLOSE' 
	s_sqnr += 1
	m_json['sqnr'] = s_sqnr 
	m_json['challenge'] = code
	c.send(json.dumps(m_json).encode())
	print ("--> sent data: " , json.dumps(m_json))
	c.close()
	s.close()
	print ("connection closed")
	quit()

def connect_and_auth():
	pass 



print ("starting server")
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
try:
	s.bind((TCP_IP, TCP_PORT))
	s.listen(1)
except socket.error as err:
	print ("socket.error : %s" % err)
	quit()

c, addr = s.accept()
print ('client connected to server: ' , addr)

while True:
	print ("waiting for message from client")
	m_str = c.recv(BUFFER_SIZE).decode()
	print ("<-- received data:", m_str )

	try:
		m_json = json.loads(m_str)
	except ValueError:
		print ('    received data is no JSON, exiting ...')
		c.close()
		s.close()
		quit()

	if m_json['sqnr'] > c_sqnr  :
		c_sqnr = m_json['sqnr']
	else:
		print ('    received message out of sequence, exiting ...')
		c.close()
		s.close()
		quit()

	if state == 'CLOSED' and m_json['type'] == 'HELLO' :
		connect_and_hello(s_sqnr)
		
	elif state == 'CONNECTED' and m_json['type'] == 'DATA': 
		close_and_data(s_sqnr)

	elif state == "CONNECTED" and m_json['type'] == 'AUTH':
		connect_and_auth()

	else:
		print ('--> received message of type %s ignored in state %s' % (m_json['type'],state))


