## www.pubnub.com - PubNub Real-time push service in the cloud. 
# coding=utf8

## PubNub Real-time Push APIs and Notifications Framework
## Copyright (c) 2010 Stephen Blum
## http://www.pubnub.com/

## -----------------------------------
## PubNub 3.0 Real-time Push Cloud API
## -----------------------------------

from Pubnub import Pubnub
import sys
from twisted.internet import reactor

publish_key   = len(sys.argv) > 1 and sys.argv[1] or 'demo'
subscribe_key = len(sys.argv) > 2 and sys.argv[2] or 'demo'
secret_key    = len(sys.argv) > 3 and sys.argv[3] or 'demo'
cipher_key    = len(sys.argv) > 4 and sys.argv[4] or 'demo'
ssl_on        = len(sys.argv) > 5 and bool(sys.argv[5]) or False

## -----------------------------------------------------------------------
## Initiat Class
## -----------------------------------------------------------------------
pubnub = Pubnub( publish_key, subscribe_key, secret_key, ssl_on )
crazy  = 'hello_world'

## -----------------------------------------------------------------------
## UUID Example
## -----------------------------------------------------------------------

uuid = pubnub.uuid()
print "UUID"
print uuid
