# Getting Your Cloudinary Credentials

## Step 1: Log into Cloudinary Dashboard

Go to: https://cloudinary.com/console

## Step 2: Find Your Credentials

On the main dashboard page, you'll see a section called **"Account Details"** or **"Product Environment Credentials"**.

You need these three values:

### Cloud Name
- Format: `dxxxxxxxx` (starts with 'd' followed by numbers/letters)
- Example: `dkx7h8s9p`

### API Key  
- Format: 15-digit number
- Example: `123456789012345`

### API Secret
- Format: 27-character alphanumeric string
- Example: `abcdefghijklmnopqrstuvwxyz1`
- ⚠️ Keep this secret! Don't share or commit to Git

## Step 3: Add to Render

In your Render web service:

1. Go to "Environment" tab
2. Add three environment variables:
   - Key: `CLOUDINARY_CLOUD_NAME` → Value: (your cloud name)
   - Key: `CLOUDINARY_API_KEY` → Value: (your API key)
   - Key: `CLOUDINARY_API_SECRET` → Value: (your API secret)
3. Click "Save Changes"

## What Cloudinary Will Store

- Menu item images uploaded by admins
- Event photos
- Any other images uploaded through the admin panel via Active Storage

Your SVG placeholder images in `public/` will still be served directly from your app.

## Free Tier Limits

- 25 GB storage
- 25 GB bandwidth per month
- 25 credits per month (transformations)

This is more than enough for a small-to-medium restaurant/market website!
