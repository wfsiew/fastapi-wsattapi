from typing import Annotated, List, Union
from fastapi import Depends, FastAPI, File, Form, UploadFile, Response
from fastapi.middleware.cors import CORSMiddleware
from tortoise.contrib.fastapi import register_tortoise
from app.constants import X_TOTAL_COUNT, X_TOTAL_PAGE, PAGE_SIZE
from app.models import Pager, PersonTemp, UserInfo
from app.services.deviceservice import DeviceService
from app.entities import *
from app.services.personservice import PersonService
from app.services.enrollinfoservice import EnrollInfoService
from app.services.recordsservice import RecordsService

import websocket, json, base64

app = FastAPI(dependencies=[], title='App', description='App API description', version='1.0')
origins = ['*']

register_tortoise(
    app,
    db_url="psycopg://postgres:postgres@localhost:5432/attdb",
    modules={"models": ["app.entities"]},
    generate_schemas=False,
    add_exception_handlers=True,
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*", X_TOTAL_COUNT, X_TOTAL_PAGE],
)

wsurl = 'ws://192.168.5.164:7788'

@app.get('/device')
async def getalldevice(response: Response, page: int = 1, limit: int = PAGE_SIZE):
    total = await DeviceService.countDevice()
    pg = Pager(total, page, limit)
    lq = await DeviceService.findAllDevice(pg.lowerbound, pg.pagesize)
    lx = [DeviceModel.fromOrm(o) for o in lq]
    response.headers[X_TOTAL_COUNT] = str(total)
    response.headers[X_TOTAL_PAGE] = str(pg.totalpages)
    return {
        'code': 100,
        'msg': 'success',
        'device': lx
    }
    
@app.get('/enrollinfo')
async def getallenrollinfo(response: Response, page: int = 1, limit: int = PAGE_SIZE):
    total = await PersonService.countPerson()
    pg = Pager(total, page, limit)
    lq = await PersonService.selectAllPerson(pg.lowerbound, pg.pagesize)
    lx = [PersonModel.fromOrm(o) for o in lq]
    response.headers[X_TOTAL_COUNT] = str(total)
    response.headers[X_TOTAL_PAGE] = str(pg.totalpages)
    return {
        'code': 100,
        'msg': 'success',
        'enrollInfo': lx
    }

@app.get('/sendws')
async def getuserlist():
    ws = websocket.WebSocket()
    ws.connect(wsurl)
    m = {
        'cmd': 'getuserlist',
        'stn': True,
        'deviceSn': 'ZXRL12098608'
    }
    ws.send(json.dumps(m))
    ws.close()
    return {
        'code': 100,
        'msg': 'success'
    }
    
@app.post('/addperson')
async def addperson(
    userId: Annotated[int, Form()],
    name: Annotated[str, Form()],
    privilege: Annotated[int, Form()],
    imagePath: Annotated[str, Form()] = None,
    password: Annotated[str, Form()] = None,
    cardNum: Annotated[str, Form()] = None,
    pic: Annotated[UploadFile, File()] = None):
    personTemp = PersonTemp()
    personTemp.userId = userId
    personTemp.name = name
    personTemp.privilege = privilege
    personTemp.imagePath = imagePath
    personTemp.password = password
    personTemp.cardNum = cardNum
    
    newName = ''
    data = None
    
    if pic is not None:
        newName = pic.filename
        x = await pic.read()
        data = base64.b64encode(x).decode('ascii')
        
    person = PersonModel()
    person.id = personTemp.userId
    person.name = personTemp.name
    person.rollId = personTemp.privilege
    person2 = await PersonService.selectByPrimaryKey(personTemp.userId)
    
    if person2 is None:
        await PersonService.insert([person])
        
    if personTemp.password is not None:
        enrollInfoTemp2 = EnrollInfoModel()
        enrollInfoTemp2.id = 0
        enrollInfoTemp2.backupnum = 10
        enrollInfoTemp2.enrollId = personTemp.userId
        enrollInfoTemp2.imagePath = ''
        enrollInfoTemp2.signatures = personTemp.password
        await EnrollInfoService.insertSelective([enrollInfoTemp2])
        
    if personTemp.cardNum is not None:
        enrollInfoTemp3 = EnrollInfoModel()
        enrollInfoTemp3.id = 0
        enrollInfoTemp3.backupnum = 11
        enrollInfoTemp3.enrollId = personTemp.userId
        enrollInfoTemp3.imagePath = ''
        enrollInfoTemp3.signatures = personTemp.cardNum
        await EnrollInfoService.insertSelective([enrollInfoTemp3])
        
    if newName != '':
        enrollInfoTemp = EnrollInfoModel()
        enrollInfoTemp.id = 0
        enrollInfoTemp.backupnum = 50
        enrollInfoTemp.enrollId = personTemp.userId
        enrollInfoTemp.imagePath = newName
        enrollInfoTemp.signatures = data
        await EnrollInfoService.insertSelective([enrollInfoTemp])
        
    return {
        'code': 100,
        'msg': 'success'
    }
    
@app.get('/sendgetuserinfo')
async def sendgetuserinfo(enrollid: int, backupnum: int):
    ws = websocket.WebSocket()
    ws.connect(wsurl)
    m = {
        'cmd': 'getuserinfo',
        'enrollid': enrollid,
        'backupnum': backupnum,
        'deviceSn': 'ZXRL12098608'
    }
    ws.send(json.dumps(m))
    ws.close()
    return {
        'code': 100,
        'msg': 'success'
    }
    
@app.get('/setpersontodevice')
async def setpersontodevice():
    ws = websocket.WebSocket()
    ws.connect(wsurl)
    m = {
        'cmd': 'setpersontodevice',
        'deviceSn': 'ZXRL12098608'
    }
    ws.send(json.dumps(m))
    ws.close()
    return {
        'code': 100,
        'msg': 'success'
    }
    
@app.get('/setusernametodevice')
async def setusernametodevice():
    ws = websocket.WebSocket()
    ws.connect(wsurl)
    m = {
        'cmd': 'setusernametodevice',
        'deviceSn': 'ZXRL12098608'
    }
    ws.send(json.dumps(m))
    ws.close()
    return {
        'code': 100,
        'msg': 'success'
    }
    
@app.get('/getdeviceinfo')
async def getdeviceinfo():
    ws = websocket.WebSocket()
    ws.connect(wsurl)
    m = {
        'cmd': 'getdevinfo',
        'deviceSn': 'ZXRL12098608'
    }
    ws.send(json.dumps(m))
    ws.close()
    return {
        'code': 100,
        'msg': 'success'
    }
    
@app.get('/setoneuser')
async def setoneuserto(enrollId: int, backupnum: int):
    ws = websocket.WebSocket()
    ws.connect(wsurl)
    m = {
        'cmd': 'setoneuser',
        'enrollid': enrollId,
        'backupnum': backupnum,
        'deviceSn': 'ZXRL12098608'
    }
    ws.send(json.dumps(m))
    ws.close()
    return {
        'code': 100,
        'msg': 'success'
    }
    
@app.get('/deletepersonfromdevice')
async def deletedeviceuserinfo(enrollId: int):
    ws = websocket.WebSocket()
    ws.connect(wsurl)
    m = {
        'cmd': 'deleteuser',
        'enrollid': enrollId,
        'deviceSn': 'ZXRL12098608'
    }
    ws.send(json.dumps(m))
    ws.close()
    return {
        'code': 100,
        'msg': 'success'
    }
    
@app.get('/getalllog')
async def getalllog():
    ws = websocket.WebSocket()
    ws.connect(wsurl)
    m = {
        'cmd': 'getalllog',
        'stn': True,
        'deviceSn': 'ZXRL12098608'
    }
    ws.send(json.dumps(m))
    ws.close()
    return {
        'code': 100,
        'msg': 'success'
    }

@app.get('/getnewlog')
async def getnewlog():
    ws = websocket.WebSocket()
    ws.connect(wsurl)
    m = {
        'cmd': 'getnewlog',
        'stn': True,
        'deviceSn': 'ZXRL12098608'
    }
    ws.send(json.dumps(m))
    ws.close()
    return {
        'code': 100,
        'msg': 'success'
    }
    
@app.get('/emps')
async def getallpersonfromdb(response: Response, page: int = 1, limit: int = PAGE_SIZE):
    total = await PersonService.countPerson()
    pg = Pager(total, page, limit)
    personList = await PersonService.selectAllPerson(pg.lowerbound, pg.pagesize)
    lenrollid = [o.id for o in personList]
    enrollList = await EnrollInfoService.selectAllByEnrollId(lenrollid)
    emps: List[UserInfo] = []
    response.headers[X_TOTAL_COUNT] = str(total)
    response.headers[X_TOTAL_PAGE] = str(pg.totalpages)
    
    for o in personList:
        userInfo = UserInfo()
        userInfo.enrollId = o.id
        userInfo.admin = o.rollId
        userInfo.name = o.name
        userInfo.backupnum = 0
        userInfo.imagePath = ''
        userInfo.record = ''
        
        for x in enrollList:
            if x.backupnum == 50:
                userInfo.imagePath = x.imagePath
                    
        emps.append(userInfo)
        
    return {
        'code': 100,
        'msg': 'success',
        'emps': emps
    }
    
@app.get('/records')
async def getalllogfromdb(response: Response, page: int = 1, limit: int = PAGE_SIZE):
    total = await RecordsService.countRecords()
    pg = Pager(total, page, limit)
    lq = await RecordsService.selectAllRecords(pg.lowerbound, pg.pagesize)
    lx = [RecordsModel.fromOrm(o) for o in lq]
    response.headers[X_TOTAL_COUNT] = str(total)
    response.headers[X_TOTAL_PAGE] = str(pg.totalpages)
    return {
        'code': 100,
        'msg': 'success',
        'records': lx
    }
    
@app.get('/opendoor')
async def opendoor(doorNum: int):
    ws = websocket.WebSocket()
    ws.connect(wsurl)
    m = {
        'cmd': 'opendoor',
        'doornum': doorNum,
        'deviceSn': 'ZXRL12098608'
    }
    ws.send(json.dumps(m))
    ws.close()
    return {
        'code': 100,
        'msg': 'success'
    }
    
@app.get('/cleanlog')
async def cleanlog():
    ws = websocket.WebSocket()
    ws.connect(wsurl)
    m = {
        'cmd': 'cleanlog',
        'deviceSn': 'ZXRL12098608'
    }
    ws.send(json.dumps(m))
    ws.close()
    return {
        'code': 100,
        'msg': 'success'
    }
    
@app.get('/cleanuser')
async def cleanuser():
    ws = websocket.WebSocket()
    ws.connect(wsurl)
    m = {
        'cmd': 'cleanuser',
        'deviceSn': 'ZXRL12098608'
    }
    ws.send(json.dumps(m))
    ws.close()
    return {
        'code': 100,
        'msg': 'success'
    }
    
@app.get('/test')
async def testx():
    lq = await EnrollInfoService.selectAllByEnrollId([1009, 1001])
    x = None
    if lq is not None:
        x = [EnrollInfoModel.fromOrm(o) for o in lq]
    return {
        'msg': 'success',
        'data': x
    }