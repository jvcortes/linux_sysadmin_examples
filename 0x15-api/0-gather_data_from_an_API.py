#!/usr/bin/python3
# Gathers and prints some data from https://jsonplaceholder.typicode.com/
if __name__ == '__main__':
    import sys
    import requests

    todos = requests.get("https://jsonplaceholder.typicode.com/todos",
                         params={'userId': sys.argv[1]}).json()

    completed = list(filter(lambda todo: todo["completed"], todos))

    user = requests.get("https://jsonplaceholder.typicode.com/users",
                        params={'id': sys.argv[1]}).json()[0]

    print("Employee {} is done with tasks({}/{}):".format(
        user["name"],
        len(completed),
        len(todos)))

    for todo in completed:
        print('\t ', end='')
        print(todo["title"])
