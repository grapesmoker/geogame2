#!/usr/bin/env python

import Queue
import random
import time
import string
import threading
from threading import Thread, Lock

class SynchronizedMessageQueue:
    ''' A synchronized dict class that manages its own lock.
    '''
    
    messages = {}
    lock = Lock()

    def __init__(self, *args, **kwargs):
        if 'keyset' in kwargs:
            self.lock.acquire()
            for key in kwargs['keyset']:
                self.messages[key] = []
            self.lock.release()

    def enqueue_message(self, username, message):
        self.lock.acquire()
        if username in self.messages:
            self.messages[username].append(message)
        else:
            self.messages.setdefault(username, [message])
        self.lock.release()

    def dequeue_message(self, username):
        self.lock.acquire()
        if username in self.messages:
            messages = self.messages[username]
            del self.messages[username]
            self.messages[username] = []
        else:
            messages = []
        self.lock.release()

        return messages

    def __str__(self):
        self.lock.acquire()
        messages_copy = self.messages.copy()
        self.lock.release()
        return str(messages_copy)

message_queue = SynchronizedMessageQueue()

def enqueue():
    while 1:
        print 'enqueue'
        k = int(random.uniform(0, 10))
        v = ''.join(random.choice(string.ascii_uppercase + string.digits) for x in range(3))
        message_queue.enqueue_message(k, v)
        interval = int(random.uniform(1,5))
        print '{0}: setting k: {1} to v: {2}, sleep for {3}'.format(threading.currentThread().getName(), k, v, interval)
        time.sleep(interval)

def dequeue():
    while 1:
        print 'dequeue'
        k = int(random.uniform(0, 10))
        v = message_queue.dequeue_message(k)
        interval = int(random.uniform(1,5))
        print '{0}: got from k: {1} value v: {2}, sleep for {3}'.format(threading.currentThread().getName(), k, v, interval)
        time.sleep(interval)

for i in range(10):
    if i % 2 == 0:
        worker_thread = Thread(target=enqueue, name='Enqueue-{0}'.format(i))
    if i % 2 == 1:
        worker_thread = Thread(target=dequeue, name='Dequeue-{0}'.format(i))
    worker_thread.start()
    
