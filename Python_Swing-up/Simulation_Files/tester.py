import requests

data = {
    'x0': -1,
    'xdot0': 0,
    'q10': 2,
    'q1dot0': 0,
    'q20': 0,
    'q2dot0': 0,
    'xf': 1.7,
    'xdotf': 0,
    'q1f': 0,
    'q1dotf': 0,
    'q2f': 0,
    'q2dotf': 0,
    'xmin': -2,
    'xmax': 2,
    'umin': -10,
    'umax': 10
}

response = requests.post('http://localhost:5000/run_simulation', json=data)
print(response.json())
