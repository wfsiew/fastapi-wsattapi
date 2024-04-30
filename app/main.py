from fastapi import Depends, FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.services.deviceservice import DeviceService
from app.entities import *
from app.services.personservice import PersonService

import websocket, json

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

@app.get('/getuserinfo')
async def getuserinfo(enrollid: int, backupnum: int):
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

@app.get('/getuserlist')
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