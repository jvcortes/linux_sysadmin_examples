#!/usr/bin/python3
# Gathers and prints some data from https://jsonplaceholder.typicode.com/ in
# JSON.
if __name__ == '__main__':
    import json
    import requests

    users = requests.get("https://jsonplaceholder.typicode.com/users").json()

    todo_list = {}

    for user in users:
        todos = requests.get(
            "https://jsonplaceholder.typicode.com/todos",
            params={'userId': user['id']}).json()

        for todo in todos:
            completed = todo["completed"]
            del todo["completed"]
            todo["username"] = user.get("username")
            todo["task"] = todo.get("title")
            todo["completed"] = completed
            del todo["userId"]
            del todo["id"]
            del todo["title"]

        todo_list[user['id']] = todos

    with open("todo_all_employees.json", 'w', newline='') as f:
        f.write(json.dumps(todo_list))
