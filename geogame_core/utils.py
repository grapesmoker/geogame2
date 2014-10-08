from threading import Lock

class SynchronizedMessageQueue:
    ''' A synchronized dict class that manages its own lock.
    '''
    

    def __init__(self, *args, **kwargs):
        
        self.messages = {}
        self.lock = Lock()
        
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
        # print 'Enqueing', self.messages
        self.lock.release()

    def dequeue_message(self, username):
        self.lock.acquire()
        #print 'Dequeing', self.messages
        if username in self.messages:
            messages = self.messages[username]
            # del self.messages[username]
            self.messages[username] = []
        else:
            messages = []
            
        #print 'Dequeued', messages
        self.lock.release()

        return messages

    def __setitem__(self, k, v):
        self.lock.acquire()
        self.messages.setdefault(k, v)
        self.lock.release()
        
    def __getitem__(self, username):
        return self.dequeue_message(username)
        
        
    def __str__(self):
        self.lock.acquire()
        messages_copy = self.messages.copy()
        self.lock.release()
        return str(messages_copy)
    
