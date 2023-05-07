import  json
import os
def read_content():
    print(os.getcwd())
    file = open('C:/Users/exxxsik/PycharmProjects/PR_API/Resources/json_data.json','r')
    loadedcontent=  json.load(file)
    print(loadedcontent)
    return loadedcontent
#if __name__=="__main__":
#   read_content()