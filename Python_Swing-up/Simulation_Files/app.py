from flask import Flask, render_template, request, jsonify, redirect, url_for, send_from_directory
import os
import json
import math
from simPendule import run_simulation

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/results')
def results():
    return render_template('results.html', control_input_image="control_input.png", state_plots_image="state_plots.png", video_file="Pendulum_Swing_Up.mp4")

@app.route('/run_simulation', methods=['POST'])
def run_simulation_route():
    data = request.get_json()
    print ("##########", data)
    run_simulation(data['x0'], data['xdot0'], data['q10'], data['q1dot0'], data['q20'], data['q2dot0'], data['xf'], data['xdotf'], data['q1f'], data['q1dotf'], data['q2f'], data['q2dotf'], data['xmin'], data['xmax'], data['umin'], data['umax'])

    return redirect(url_for('results'))

@app.route('/control_input.png')
def control_input():
    return send_from_directory(os.getcwd(), 'control_input.png')

@app.route('/state_plots.png')
def state_plots():
    return send_from_directory(os.getcwd(), 'state_plots.png')

@app.route('/Pendulum_Swing_Up.mp4')
def pendulum_swing_up():
    return send_from_directory(os.getcwd(), 'Pendulum_Swing_Up.mp4')




if __name__ == '__main__':
    app.run(debug=True)
