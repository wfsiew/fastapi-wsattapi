from pony.orm import *
from dataclasses import dataclass

db = Database()
db.bind(provider='sqlite', filename='../attdb.db', create_db=True)

class AccessDay(db.Entity):
    _table_ = 'access_day'
    id = PrimaryKey(int, auto=True)
    serial = Optional(str, max_len=12)
    name = Optional(str, max_len=20)
    startTime1 = Required(str, max_len=20, column='start_time1')
    endTime1 = Required(str, max_len=20, column='end_time1')
    startTime2 = Required(str, max_len=20, column='start_time2')
    endTime2 = Required(str, max_len=20, column='end_time2')
    startTime3 = Required(str, max_len=20, column='start_time3')
    endTime3 = Required(str, max_len=20, column='end_time3')
    startTime4 = Required(str, max_len=20, column='start_time4')
    endTime4 = Required(str, max_len=20, column='end_time4')
    startTime5 = Required(str, max_len=20, column='start_time5')
    endTime5 = Required(str, max_len=20, column='end_time5')
    
    def __repr__(self):
        return f'''AccessDay [id={self.id}, serial={self.serial}, name={self.name} 
        , startTime1={self.startTime1}, endTime1={self.endTime1}
        , startTime2={self.startTime2}, endTime1={self.endTime2}
        , startTime3={self.startTime3}, endTime1={self.endTime3}
        , startTime4={self.startTime1}, endTime4={self.endTime4}
        , startTime5={self.startTime5}, endTime1={self.endTime5}]'''
        
class AccessWeek(db.Entity):
    _table_ = 'access_week'
    id = PrimaryKey(int, auto=True)
    serial = Optional(str, max_len=20)
    name = Optional(str, max_len=20)
    sunday = Required(int)
    monday = Required(int)
    tuesday = Required(int)
    wednesday = Required(int)
    thursday = Required(int)
    friday = Required(int)
    saturday = Required(int)
    
    def __repr__(self):
        return f'''AccessWeek [id={self.id}, serial={self.serial}, name={self.name}
        , monday={self.monday}, tuesday={self.tuesday}
        , wednesday={self.wednesday}, thursday={self.thursday}
        , friday={self.friday}, saturday={self.saturday}, sunday={self.sunday}]'''

class Device(db.Entity):
    _table_ = 'device'
    id = PrimaryKey(int, auto=True)
    serialNum = Required(str, max_len=50, column='serial_num')
    status = Required(int)
    
    def __repr__(self):
        return f'Device [id={self.id}, serialNum={self.serialNum}, status={self.status}]'
    
class EnrollInfo(db.Entity):
    _table_ = 'enrollinfo'
    id = PrimaryKey(int, auto=True)
    enrollId = Required(int, column='enroll_id')
    backupnum = Optional(int)
    imagePath = Optional(str, max_len=255, column='imagepath')
    signatures = Optional(str)
    
    def __repr__(self):
        return f'EnrollInfo [id={self.id}, enrollId={self.enrollId}, backupnum={self.backupnum}, imagePath={self.imagePath}, signatures={self.signatures}]'
    
class Person(db.Entity):
    _table_ = 'person'
    id = PrimaryKey(int, auto=True)
    name = Optional(str, max_len=50)
    rollId = Optional(int, column='roll_id')
    
    def __repr__(self):
        return f'Person [id={self.id}, name={self.name}, rollId={self.rollId}]'
    
class Records(db.Entity):
    _table_ = 'records'
    id = PrimaryKey(int, auto=True)
    enrollId = Required(int, column='enroll_id')
    recordsTime = Required(str, column='records_time')
    mode = Required(int)
    intout = Required(int, column='intOut')
    event = Required(int)
    deviceSerialNum = Optional(str, max_len=50, column='device_serial_num')
    temperature = Optional(float)
    image = Optional(str, max_len=255)
    
db.generate_mapping(create_tables=True)
sql_debug(True)

@dataclass
class DeviceModel:
    id: int
    serialNum: str
    status: int
    
    def __init__(self):
        pass
        
    @classmethod
    def fromOrm(cls, device: Device):
        o = DeviceModel()
        o.id = device.id
        o.serialNum = device.serialNum
        o.status = device.status
        return o

@dataclass
class EnrollInfoModel:
    id: int
    enrollId: int
    backupnum: int
    imagePath: str
    signatures: str
    
    def __init__(self):
        pass
    
    @classmethod
    def fromOrm(cls, e: EnrollInfo):
        o = EnrollInfoModel()
        o.id = e.id
        o.enrollId = e.enrollId
        o.backupnum = e.backupnum
        o.imagePath = e.imagePath
        o.signatures = e.signatures
        return o
    
@dataclass
class PersonModel:
    id: int
    name: str
    rollId: int
    
    def __init__(self):
        pass
    
    @classmethod
    def fromOrm(cls, person: Person):
        o = PersonModel()
        o.id = person.id
        o.name = person.name
        o.rollId = person.rollId
        return o
    
@dataclass
class RecordsModel:
    id: int
    enrollId: int
    recordsTime: str
    mode: int
    intout: int
    event: int
    deviceSerialNum: str
    temperature: float
    image: str
    
    def __init__(self):
        pass
    
    @classmethod
    def fromOrm(cls, rec: Records):
        o = RecordsModel()
        o.id = rec.id
        o.enrollId = rec.enrollId
        o.recordsTime = rec.recordsTime
        o.mode = rec.mode
        o.intout = rec.intout
        o.event = rec.event
        o.deviceSerialNum = rec.deviceSerialNum
        o.temperature = rec.temperature
        o.image = rec.image
        return o