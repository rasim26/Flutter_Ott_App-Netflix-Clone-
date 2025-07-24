import os
import time
import asyncio

from googleapiclient.discovery import build
from telegram import Update
from telegram.ext import ApplicationBuilder, CommandHandler, ContextTypes

# === CONFIGURATION ===
TELEGRAM_TOKEN = '7745618651:AAGVEaXrzVXUP9mc_CWn_jSC1BvJsEPGat0'
YOUTUBE_API_KEY = 'AIzaSyC7AAv8HPMAhdIXxpUN1SnA03P_w-FLUrY'
CHANNEL_ID = 'UCA1v1wXHrtZ5JKzNyiQDyBA'
TELEGRAM_CHAT_ID = '637831682'  # For auto notifications

# === YOUTUBE API SETUP ===
print ("script started..")
youtube = build('youtube', 'v3', developerKey=YOUTUBE_API_KEY)

def get_uploads_playlist_id(channel_id):
    res = youtube.channels().list(
        part='contentDetails',
        id=channel_id
    ).execute()
    return res['items'][0]['contentDetails']['relatedPlaylists']['uploads']

def get_videos_from_playlist(playlist_id, max_results=10):
    videos = []
    nextPageToken = None
    while len(videos) < max_results:
        res = youtube.playlistItems().list(
            part='snippet',
            playlistId=playlist_id,
            maxResults=min(50, max_results - len(videos)),
            pageToken=nextPageToken
        ).execute()
        for item in res['items']:
            videos.append({
                'title': item['snippet']['title'],
                'url': f"https://www.youtube.com/watch?v={item['snippet']['resourceId']['videoId']}"
            })
        nextPageToken = res.get('nextPageToken')
        if not nextPageToken:
            break
    return videos

def get_playlists(channel_id):
    playlists = []
    nextPageToken = None
    while True:
        res = youtube.playlists().list(
            part='snippet',
            channelId=channel_id,
            maxResults=50,
            pageToken=nextPageToken
        ).execute()
        for item in res['items']:
            playlists.append({
                'title': item['snippet']['title'],
                'id': item['id']
            })
        nextPageToken = res.get('nextPageToken')
        if not nextPageToken:
            break
    return playlists

def get_latest_video(playlist_id):
    videos = get_videos_from_playlist(playlist_id, max_results=1)
    return videos[0] if videos else None

# === TELEGRAM BOT HANDLERS ===
async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await update.message.reply_text("Hello! Use /videos to get latest uploads, /playlists for playlists.")

async def videos(update: Update, context: ContextTypes.DEFAULT_TYPE):
    playlist_id = get_uploads_playlist_id(CHANNEL_ID)
    videos = get_videos_from_playlist(playlist_id, max_results=10)
    if not videos:
        await update.message.reply_text("No videos found.")
        return
    msg = "\n\n".join([f"{v['title']}\n{v['url']}" for v in videos])
    await update.message.reply_text(msg)

async def playlists(update: Update, context: ContextTypes.DEFAULT_TYPE):
    playlists = get_playlists(CHANNEL_ID)
    if not playlists:
        await update.message.reply_text("No playlists found.")
        return
    msg = "\n\n".join([f"{p['title']}\nhttps://www.youtube.com/playlist?list={p['id']}" for p in playlists])
    await update.message.reply_text(msg)

# === AUTO NOTIFICATION TASK ===
async def auto_notify_new_uploads(app):
    playlist_id = get_uploads_playlist_id(CHANNEL_ID)
    last_video_id = None
    while True:
        latest_video = get_latest_video(playlist_id)
        if latest_video and latest_video['url'] != last_video_id:
            # Send notification
            text = f"🎬 New video uploaded!\n\n{latest_video['title']}\n{latest_video['url']}"
            await app.bot.send_message(chat_id=TELEGRAM_CHAT_ID, text=text)
            last_video_id = latest_video['url']
        await asyncio.sleep(300)  # Check every 5 minutes

# === MAIN FUNCTION ===
async def main():
    app = ApplicationBuilder().token(TELEGRAM_TOKEN).build()
    app.add_handler(CommandHandler("start", start))
    app.add_handler(CommandHandler("videos", videos))
    app.add_handler(CommandHandler("playlists", playlists))

    # Start auto notification in background
    asyncio.create_task(auto_notify_new_uploads(app))

    print("Bot is running...")
    await app.run_polling()

if __name__ == "__main__":
    import asyncio

    app = ApplicationBuilder().token(TELEGRAM_TOKEN).build()
    app.add_handler(CommandHandler("start", start))
    app.add_handler(CommandHandler("videos", videos))
    app.add_handler(CommandHandler("playlists", playlists))

    # Start auto notification in background
    loop = asyncio.get_event_loop()
    loop.create_task(auto_notify_new_uploads(app))

    print("Bot is running...")
    app.run_polling()