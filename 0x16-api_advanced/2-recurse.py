#!/usr/bin/python3
"""
Module for task 2
"""
import requests


def recurse(subreddit, hot_list=[]):
    """
    Gets all the hot posts from a subreddit.

    If the given subreddit is not found, the function will return 0.

    Arguments:
        subreddit (str): subreddit to search.
    """

    if hot_list:
        request = requests.get("https://api.reddit.com"
                               "/r/{}/hot?after={}".format(subreddit,
                                                           hot_list[0]),
                               allow_redirects=False,
                               headers={'User-Agent': '941'})
    else:
        request = requests.get("https://api.reddit.com"
                               "/r/{}/hot".format(subreddit),
                               allow_redirects=False,
                               headers={'User-Agent': '941'})

    try:
        result = []
        posts = request.json()["data"]["children"]
        for post in posts:
            result.append(post["data"]["title"])
    except ValueError:
        print("None")

    if request.json()["data"]["after"]:
        return recurse(subreddit, [request.json()["data"]["after"]]) + result
    return result
