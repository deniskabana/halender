class A:
  def __init__(self, a):
    self.a = a

from flask import Flask, jsonify, make_response, request

app = Flask('python-flask-seed')


@app.route('/welcome', methods=['POST'])
def welcome(self, a):
  content = request.get_json(silent=True, force=True)

  try:
    message = 'Welcome %s!' % content['name']
    response = {'message': message}
    return make_response(jsonify(response), 200)

    except Exception as ex:
    response = {'error': 'name is required'}
    return make_response(jsonify(response), 400)

    my_list = [[1, 2], [3, 4]]

  # Duplicate a 2D list
 [[item for item in sub_list] for sub_list in my_list]

  # Duplicate an n-dimensional list
  def deep_copy(to_copy):
    if type(to_copy) is list:
      return [deep_copy(item) for item in to_copy]
    else:
      return to_copy
