##
#
#   Copyright (C) 2002-2022 MlgmXyysd All Rights Reserved.
#
##

##
#
#   Genshin Impact script for mitmproxy
#
#   https://github.com/MlgmXyysd/
#
#   *Original fiddler script from https://github.lunatic.moe/fiddlerscript
#
#   Environment requirement:
#     - mitmdump from mitmproxy
#
#   @author MlgmXyysd
#   @version 1.1
#
##

from mitmproxy import http
from mitmproxy import ctx

USE_SSL = False
REMOTE_HOST = "10.242.1.1"
REMOTE_PORT = 21000

logfile = open("logs/mitmproxy_script_log.txt", "a")

def log(msg):
    logfile.write(msg+'\n')
    logfile.flush()

class MlgmXyysd_Genshin_Impact_Proxy:

    LIST_DOMAINS = [
        "api-os-takumi.mihoyo.com",
        "hk4e-api-os-static.mihoyo.com",
        "hk4e-sdk-os.mihoyo.com",
        "dispatchosglobal.yuanshen.com",
        "osusadispatch.yuanshen.com",
        "account.mihoyo.com",
        "log-upload-os.mihoyo.com",
        "dispatchcntest.yuanshen.com",
        "devlog-upload.mihoyo.com",
        "webstatic.mihoyo.com",
        "log-upload.mihoyo.com",
        "hk4e-sdk.mihoyo.com",
        "api-beta-sdk.mihoyo.com",
        "api-beta-sdk-os.mihoyo.com",
        "cnbeta01dispatch.yuanshen.com",
        "dispatchcnglobal.yuanshen.com",
        "cnbeta02dispatch.yuanshen.com",
        "sdk-os-static.mihoyo.com",
        "webstatic-sea.mihoyo.com",
        "webstatic-sea.hoyoverse.com",
        "hk4e-sdk-os-static.hoyoverse.com",
        "sdk-os-static.hoyoverse.com",
        "api-account-os.hoyoverse.com",
        "hk4e-sdk-os.hoyoverse.com",
        "overseauspider.yuanshen.com",
        "gameapi-account.mihoyo.com",
        "minor-api.mihoyo.com",
        "public-data-api.mihoyo.com",
        "uspider.yuanshen.com",
        "sdk-static.mihoyo.com",
        "abtest-api-data-sg.hoyoverse.com",
        "log-upload-os.hoyoverse.com",
        "autopatchhk.yuanshen.com"
        
    ]

    def request(self, flow: http.HTTPFlow) -> None:
# 20220506 17:33
# https://autopatchhk.yuanshen.com/client_design_data/2.6_live/output_6731353_adfeb8be71/client_silence/General/AssetBundles/data_versions
# https://autopatchhk.yuanshen.com/client_design_data/2.6_live/output_6731353_adfeb8be71/client_silence/General/AssetBundles/blocks/00/29342328.blk
        log(flow.request.pretty_url)
        if flow.request.host == "autopatchhk.yuanshen.com":
            print(flow.request.method, flow.request.pretty_url)
            if flow.request.pretty_url.endswith("/General/AssetBundles/data_versions"):
                flow.response = http.Response.make(
                    200,
                    open('./www/data_versions', 'rb').read(),
                    {"Content-Type": "application/octet-stream"}
                )
                ctx.log.warn('<====== redirect autopatchhk data_versions ======>')
                return
            if flow.request.pretty_url.endswith("General/AssetBundles/blocks/00/29342328.blk"):
                flow.response = http.Response.make(
                    200,
                    open('./www/29342328.blk', 'rb').read(),
                    {"Content-Type": "application/octet-stream"}
                )
                ctx.log.warn('<======  redirect autopatchhk 29342328.blk ======>')
                return
        if flow.request.host in self.LIST_DOMAINS:
            if USE_SSL:
                flow.request.scheme = "https"
            else:
                flow.request.scheme = "http"
            flow.request.host = REMOTE_HOST
            flow.request.port = REMOTE_PORT
            
    def response(self, flow):
        flow.response.headers["X-MITM-REDIRECT"] = "True"

addons = [
	MlgmXyysd_Genshin_Impact_Proxy()
]
