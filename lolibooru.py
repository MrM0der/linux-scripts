import urllib.request
import json
import discord_webhook
import os

webhook_url = ''
params = ['video', 'uncensored']


url = "https://lolibooru.moe/post.json?tags=order:random" + \
    '+' + '+'.join(params)
response = urllib.request.urlopen(url)
data = json.loads(response.read())
url = data[0].pop('file_url')
urlencode = urllib.parse.quote_plus(url, safe='/:')


webhook = discord_webhook.DiscordWebhook(
    url=webhook_url, content=urlencode)


webhook.execute()
os.system(f'vlc {urlencode}')
print(urlencode)
