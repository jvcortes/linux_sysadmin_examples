#!/usr/bin/python3
"""
Module for task 2
"""
import requests


def count_words(subreddit, word_list):
    """
    Gets all the hot posts from a subreddit, which titles contain at least a
    specified keyword.

    Arguments:
        subreddit (str): subreddit to search.
    """
    print("\n")
