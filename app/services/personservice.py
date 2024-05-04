from typing import List
from tortoise import connections
from tortoise.transactions import in_transaction
from app.entities import Person, PersonModel
from app.entities import Person, PersonModel

class PersonService:
    
    @classmethod
    async def updateByPrimaryKeySelective(cls, record: Person):
        await cls.updateByPrimaryKey(record)
            
    @classmethod
    async def updateByPrimaryKey(cls, record: Person):
        await Person.filter(id=record.id).update(name=record.name, rollId=record.rollId)
            
    @classmethod
    async def insertSelective(cls, person: PersonModel):
        await cls.insert([person])
            
    @classmethod
    async def insert(cls, persons: List[PersonModel]):
        for person in persons:
            await Person.create(name=person.name, rollId=person.rollId)
            
    @classmethod
    async def deleteByPrimaryKey(cls, id: int):
        await Person.filter(id=id).delete()
            
    @classmethod
    async def selectByPrimaryKey(cls, id: int):
        return await Person.get_or_none(id=id)
    
    @classmethod
    async def countPerson(cls):
        return await Person.all().count()
    
    @classmethod
    async def selectAllPerson(cls, offset: int, limit: int):
        return await Person.all().offset(offset).limit(limit)
        
    @classmethod
    async def selectAll(cls):
        return await Person.all()