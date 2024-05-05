from typing import List
from tortoise import connections
from tortoise.transactions import in_transaction
from app.entities import Records, RecordsModel

class RecordsService:
    
    @classmethod
    async def deleteByPrimaryKey(cls, id: int):
        await Records.filter(id=id).delete()
        
    @classmethod
    async def clear(cls):
        await Records.all().delete()
        
    @classmethod
    async def insert(cls, records: List[RecordsModel]):
        for record in records:
            await Records.update_or_create(
                enrollId=record.enrollId, 
                recordsTime=record.recordsTime, 
                mode=record.mode, 
                intout=record.intout, 
                event=record.event,
                deviceSerialNum=record.deviceSerialNum,
                temperature=record.temperature,
                image=record.image
            )

    @classmethod
    async def insertSelective(cls, record: RecordsModel):
        await cls.insert([record])
        
    @classmethod
    async def selectByPrimaryKey(cls, id: int):
        return await Records.get_or_none(id=id)
    
    @classmethod
    async def updateByPrimaryKeySelective(cls, record: Records):
        await cls.updateByPrimaryKey(record)
        
    @classmethod
    async def updateByPrimaryKey(cls, record: Records):
        await Records.filter(id=record.id).update(
            enrollId=record.enrollId,
            recordsTime=record.recordsTime,
            mode=record.mode,
            intout=record.intout,
            event=record.event,
            deviceSerialNum=record.deviceSerialNum,
            temperature=record.temperature,
            image=record.image
        )
        
    @classmethod
    async def countRecords(cls):
        return await Records.all().count()

    @classmethod
    async def selectAllRecords(cls, offset: int, limit: int):
        return await Records.all().offset(offset).limit(limit)