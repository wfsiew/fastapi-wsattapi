from dataclasses import dataclass
from typing import Optional

from app import constants

import math
    
@dataclass
class UserInfo:
    enrollId: int
    name: str
    backupnum: int
    admin: int
    imagePath: str
    record: str
    
    def __init__(self):
        pass
    
    def __repr__(self):
        return f'UserInfo [enrollId={self.enrollId}, name={self.name}, backupnum={self.backupnum}, admin={self.admin}, imagePath={self.imagePath}, record={self.record}]'
    
@dataclass
class UserTemp:
    enrollId: int
    admin: int
    backupnum: int
    
    def __init__(self):
        pass
    
    def __repr__(self):
        return f'UserTemp [enrollId={self.enrollId}, admin={self.admin}, backupnum={self.backupnum}]'
    
@dataclass
class PersonTemp:
    userId: int
    name: str
    privilege: int
    imagePath: Optional[str] = None
    password: Optional[str] = None
    cardNum: Optional[str] = None
    
    def __init__(self):
        pass
    
    def __repr__(self):
        return f'PersonTemp [userId={self.userId}, name={self.name}, privilege={self.privilege}, imagePath={self.imagePath}, password={self.password}, cardNum={self.cardNum}]'
    
@dataclass
class Pager:
    total: int = 0
    pagenum: int = 1
    _pagesize: int = 0
    
    def __init__(self, total, pagenum, pagesize):
        self.total = total
        self.pagenum = pagenum
        self.setpagesize(pagesize)

    @property
    def pagesize(self):
        return self._pagesize
    
    @pagesize.setter
    def pagesize(self, v):
        self.setpagesize(v)
        
    @property
    def lowerbound(self):
        return (self.pagenum - 1) * self.pagesize
    
    @property
    def upperbound(self):
        upperbound = self.pagenum * self.pagesize
        
        if self.total < upperbound:
            upperbound = self.total
            
        return upperbound
        
    @property
    def totalpages(self):
        return int(math.ceil(self.total / float(self.pagesize)))

    def setpagesize(self, pagesize):
        if (self.total < pagesize or pagesize < 1) and self.total > 0:
            self._pagesize = self.total
            
        else:
            self._pagesize = pagesize
            
        if self.totalpages < self.pagenum:
            self.pagenum = self.totalpages
            
        if self.pagenum < 1:
            self.pagenum = 1

    @property
    def headers(self):
        headers = {
            'x-total-count': self.total,
            'access-control-expose-headers': constants.DEFAULT_HEADERS
        }
        
        return headers
    
# with db_session:
#     author = Author(name='John Doe')
#     book = Book(title='Python Programming', publication_date='2022-01-01', isbn='978-0-123456-78-9', author=author)