from tortoise.models import Model
from tortoise import fields
from dataclasses import dataclass

class AccessDay(Model):
    id = fields.IntField(pk=True)
    serial = fields.CharField(max_length=12, null=True)
    name = fields.CharField(max_length=20, null=True)
    startTime1 = fields.CharField(max_length=20, source_field='start_time1')
    endTime1 = fields.CharField(max_length=20, source_field='end_time1')
    startTime2 = fields.CharField(max_length=20, source_field='start_time2')
    endTime2 = fields.CharField(max_length=20, source_field='end_time2')
    startTime3 = fields.CharField(max_length=20, source_field='start_time3')
    endTime3 = fields.CharField(max_length=20, source_field='end_time3')
    startTime4 = fields.CharField(max_length=20, source_field='start_time4')
    endTime4 = fields.CharField(max_length=20, source_field='end_time4')
    startTime5 = fields.CharField(max_length=20, source_field='start_time5')
    endTime5 = fields.CharField(max_length=20, source_field='end_time5')
    
    class Meta:
        table = 'access_day'
    
    def __repr__(self):
        return f'''AccessDay [id={self.id}, serial={self.serial}, name={self.name} 
        , startTime1={self.startTime1}, endTime1={self.endTime1}
        , startTime2={self.startTime2}, endTime1={self.endTime2}
        , startTime3={self.startTime3}, endTime1={self.endTime3}
        , startTime4={self.startTime1}, endTime4={self.endTime4}
        , startTime5={self.startTime5}, endTime1={self.endTime5}]'''
        
class AccessWeek(Model):
    id = fields.IntField(pk=True)
    serial = fields.CharField(max_length=20, null=True)
    name = fields.CharField(max_length=20, null=True)
    sunday = fields.IntField()
    monday = fields.IntField()
    tuesday = fields.IntField()
    wednesday = fields.IntField()
    thursday = fields.IntField()
    friday = fields.IntField()
    saturday = fields.IntField()
    
    class Meta:
        table = 'access_week'
    
    def __repr__(self):
        return f'''AccessWeek [id={self.id}, serial={self.serial}, name={self.name}
        , monday={self.monday}, tuesday={self.tuesday}
        , wednesday={self.wednesday}, thursday={self.thursday}
        , friday={self.friday}, saturday={self.saturday}, sunday={self.sunday}]'''

class Device(Model):
    id = fields.IntField(pk=True)
    serialNum = fields.CharField(max_length=50, source_field='serial_num')
    status = fields.IntField()
    
    class Meta:
        table = 'device'
    
    def __repr__(self):
        return f'Device [id={self.id}, serialNum={self.serialNum}, status={self.status}]'
    
class EnrollInfo(Model):
    id = fields.IntField(pk=True)
    enrollId = fields.IntField(source_field='enroll_id')
    backupnum = fields.IntField(null=True)
    imagePath = fields.CharField(max_length=255, source_field='imagepath', null=True)
    signatures = fields.TextField(null=True)
    
    class Meta:
        table = 'enrollinfo'
    
    def __repr__(self):
        return f'EnrollInfo [id={self.id}, enrollId={self.enrollId}, backupnum={self.backupnum}, imagePath={self.imagePath}, signatures={self.signatures}]'
    
class Person(Model):
    id = fields.IntField(pk=True)
    name = fields.CharField(max_length=50, null=True)
    rollId = fields.IntField(source_field='roll_id', null=True)
    
    class Meta:
        table = 'person'
    
    def __repr__(self):
        return f'Person [id={self.id}, name={self.name}, rollId={self.rollId}]'
    
class Records(Model):
    id = fields.IntField(pk=True)
    enrollId = fields.IntField(source_field='enroll_id')
    recordsTime = fields.DatetimeField(source_field='records_time')
    mode = fields.IntField()
    intout = fields.IntField(source_field='intOut')
    event = fields.IntField()
    deviceSerialNum = fields.CharField(max_length=50, source_field='device_serial_num', null=True)
    temperature = fields.FloatField(null=True)
    image = fields.CharField(max_length=255, null=True)
    
    class Meta:
        table = 'records'

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