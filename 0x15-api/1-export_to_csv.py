#!/usr/bin/python3
# Gathers and prints some data from https://jsonplaceholder.typicode.com/ in
# CSV.
if __name__ == '__main__':
    import csv
    import requests
    import sys

    todos = requests.get("https://jsonplaceholder.typicode.com/todos",
                         params={'userId': sys.argv[1]}).json()

    user = requests.get("https://jsonplaceholder.typicode.com/users",
                        params={'id': sys.argv[1]}).json()[0]

    with open("{}.csv".format(sys.argv[1]), 'w', newline='') as f:
        writer = csv.DictWriter(f,
                                ["userId", "username", "completed", "title"],
                                quoting=csv.QUOTE_ALL)

        for todo in todos:
            del todo["id"]
            todo["username"] = user.get("username")
            writer.writerow(todo)
