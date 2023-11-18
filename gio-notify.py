from discord_webhook import DiscordWebhook
import sys

arg = sys.argv[1]
if arg == "online":
    content = """<@&1147853465863856130>
    GIO docker braindead запускается... ✅
    (Это сообщение может повторится, т.к GIO не всегда запускается с первого раза.)
    """
if arg == "offline":
    content = """<@&1147853465863856130>
    GIO docker braindead выключается... 🚫
    (Это сообщение может не появится, т.к владелец может просто выключить систему, а не прописать ./stop.)
    """


webhook = DiscordWebhook(url="", content=content)
response = webhook.execute()
