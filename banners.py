import json

f = open('BannersFull.json', 'r')
text = f.read()
f.close()

json_banners = json.loads(text)

rateUpItems5_weapons = []


for i in json_banners:
    if len(i['rateUpItems5']) == 2:
        rateUpItems5_weapons.extend(i['rateUpItems5'])

rateUpItems5_weapons = list(set(rateUpItems5_weapons))

print(str(rateUpItems5_weapons).replace(" ", ""))

# print(len(rateUpItems5_weapons))
