from typing import List
from pony.orm import db_session
from app.entities import Person, PersonModel

class PersonService:
    
    @classmethod
    def updateByPrimaryKeySelective(cls, record: Person):
        cls.updateByPrimaryKey(record)
            
    @classmethod
    def updateByPrimaryKey(cls, record: Person):
        with db_session:
            o = Person[record.id]
            o.name = record.name
            o.rollId = record.rollId
            
    @classmethod
    def insertSelective(cls, person: PersonModel):
        cls.insert([person])
            
    @classmethod
    def insert(cls, persons: List[PersonModel]):
        with db_session:
            for person in persons:
                Person(name=person.name, rollId=person.rollId)
            
    @classmethod
    def deleteByPrimaryKey(cls, id: int):
        with db_session:
            Person[id].delete()
            
    @classmethod
    def selectByPrimaryKey(cls, id: int):
        with db_session:
            return Person.get(id=id)
        
    @classmethod
    def selectAll(cls) -> List[Person]:
        with db_session:
            return Person.select()[:]