#!/usr/bin/python3
# Module for task 0
import requests


def number_of_subscribers(subreddit):
    """
    Gets the number a subscribers of a subreddit.

    If the given subreddit is not found, the function will return 0.

    Arguments:
        subreddit (str): subreddit to search.
    """

    request = requests.get("https://www.reddit.com/r/{}/about.json".format(
        subreddit),
                           allow_redirects=False,
                           headers={'User-Agent': '941'})

    if request.status_code == 200 and "subscribers" in request.json()["data"]:
        return request.json()["data"]["subscribers"]
    return 0
