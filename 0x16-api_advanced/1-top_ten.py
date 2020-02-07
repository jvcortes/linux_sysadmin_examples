#!/usr/bin/python3
# Module for task 1
from json import JSONDecodeError
import requests


def top_ten(subreddit):
    """
    Prints the titles of the first 10 'Hot' posts from a subreddit.

    If the given subreddit is not found, the function will print "None".

    Arguments:
        subreddit (str): subreddit to search.
    """

    request = requests.get("https://api.reddit.com"
                           "/r/{}/hot".format(subreddit),
                           params={'limit': '10'},
                           allow_redirects=False,
                           headers={'User-Agent': '941'})

    try:
        posts = request.json()["data"]["children"]
        for post in posts:
            print(post["data"]["title"])
    except JSONDecodeError:
        print("None")
