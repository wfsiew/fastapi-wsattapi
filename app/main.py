from typing import Annotated, List, Union
from fastapi import Depends, FastAPI, File, Form, UploadFile
from fastapi.middleware.cors import CORSMiddleware
from app.models import PersonTemp, UserInfo
from app.services.deviceservice import DeviceService
from app.entities import *
from app.services.personservice import PersonService
from app.services.enrollinfoservice import EnrollInfoService
from app.services.recordsservice import RecordsService

import websocket, json, base64

app = FastAPI(dependencies=[], title='App', description='App API description', version='1.0')
origins = ['*']

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

wsurl = 'ws://192.168.5.164:7788'

@app.get('/device')
async def getalldevice():
    lq = DeviceService.findAllDevice()
    lx = [DeviceModel.fromOrm(o) for o in lq]
    return {
        'code': 100,
        'msg': 'success',
        'device': lx
    }
    
@app.get('/enrollinfo')
async def getallenrollinfo():
    lq = PersonService.selectAll()
    lx = [PersonModel.fromOrm(o) for o in lq]
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
    person2 = PersonService.selectByPrimaryKey(personTemp.userId)
    
    if person2 is None:
        PersonService.insert([person])
        
    if personTemp.password is not None:
        enrollInfoTemp2 = EnrollInfoModel()
        enrollInfoTemp2.id = 0
        enrollInfoTemp2.backupnum = 10
        enrollInfoTemp2.enrollId = personTemp.userId
        enrollInfoTemp2.imagePath = ''
        enrollInfoTemp2.signatures = personTemp.password
        EnrollInfoService.insertSelective([enrollInfoTemp2])
        
    if personTemp.cardNum is not None:
        enrollInfoTemp3 = EnrollInfoModel()
        enrollInfoTemp3.id = 0
        enrollInfoTemp3.backupnum = 11
        enrollInfoTemp3.enrollId = personTemp.userId
        enrollInfoTemp3.imagePath = ''
        enrollInfoTemp3.signatures = personTemp.cardNum
        EnrollInfoService.insertSelective([enrollInfoTemp3])
        
    if newName != '':
        enrollInfoTemp = EnrollInfoModel()
        enrollInfoTemp.id = 0
        enrollInfoTemp.backupnum = 50
        enrollInfoTemp.enrollId = personTemp.userId
        enrollInfoTemp.imagePath = newName
        enrollInfoTemp.signatures = data
        EnrollInfoService.insertSelective([enrollInfoTemp])
        
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
async def getallpersonfromdb(pn: int = 1):
    personList = PersonService.selectAll()
    enrollList = EnrollInfoService.selectAll()
    emps: List[UserInfo] = []
    
    for o in personList:
        userInfo = UserInfo()
        userInfo.enrollId = o.id
        userInfo.admin = o.rollId
        userInfo.name = o.name
        userInfo.backupnum = 0
        userInfo.imagePath = ''
        userInfo.record = ''
        
        for x in enrollList:
            if o.id == x.enrollId:
                if x.backupnum == 50:
                    userInfo.imagePath = x.imagePath
                    
        emps.append(userInfo)
        
    return {
        'code': 100,
        'msg': 'success',
        'emps': emps
    }
    
@app.get('/records')
async def getalllogfromdb(pn: int = 1):
    lq = RecordsService.selectAllRecords()
    lx = [RecordsModel.fromOrm(o) for o in lq]
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
    
@app.get('/test')
def testx():
    lq = EnrollInfoService.selectByEnrollId(1001)
    x = None
    if lq is not None:
        x = [EnrollInfoModel.fromOrm(o) for o in lq]
    return {
        'msg': 'success',
        'data': x
    }