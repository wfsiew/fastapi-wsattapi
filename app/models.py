from dataclasses import dataclass
from typing import Optional
    
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
    
# with db_session:
#     author = Author(name='John Doe')
#     book = Book(title='Python Programming', publication_date='2022-01-01', isbn='978-0-123456-78-9', author=author)