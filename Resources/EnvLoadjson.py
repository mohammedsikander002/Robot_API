
import os
import json
from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword

@keyword
def load_environment_variables(config_path, environment):
 path = os.getcwd()
 print(f'This is path==> {path}')
 print("Current Dir: " + path)
 env_file_path = os.path.join(config_path, environment.upper()+".json")
 print(env_file_path)
 print(f"Current Dir:===> " + path)
 BuiltIn().set_suite_variable("${EnvironmentValue}",environment.upper())
 with open(env_file_path , 'r') as f:
     data = json.load(f)
 for s,v in data.items():
   BuiltIn().set_suite_variable(s ,v)  