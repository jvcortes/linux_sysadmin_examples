#!/usr/bin/python3
# Module for task 1
import requests


def top_ten(subreddit):
    """
    Prints the titles of the first 10 'Hot' posts from a subreddit.

    If the given subreddit is not found, the function will print "None".

    Arguments:
        subreddit (str): subreddit to search.
    """

    request = requests.get("https://www.reddit.com/r/{}/hot.json"
                           "?limit=10".format(subreddit),
                           allow_redirects=False,
                           headers={'User-Agent': '941'})

    if request.status_code == 302:
        print("None")
    else:
        posts = request.json()["data"]["children"]
        for post in posts:
            print(post["data"]["title"])
